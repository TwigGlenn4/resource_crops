local S = core.get_translator(core.get_current_modname())

--Register an alias for steel ingot and undo technic's name change.
core.register_alias("default:iron_ingot", "default:steel_ingot")
if resourcecrops.has_technic then
  core.override_item("default:iron_ingot", { description = "Steel Ingot" })
end

--Harvest and replant a crop, drop it's items.
function resourcecrops.harvest_crop(pos)
  if resourcecrops.check_crop_node(pos) then
    local plant = core.get_node(pos)

    core.set_node(pos, {name=plant.name:sub(1, -2).."1"})
    local itemstacks = core.get_node_drops(plant.name)
    local seeds_blocked = 0;
    for _, itemname in ipairs(itemstacks) do
      if itemname:find("seed") and seeds_blocked == 0 then -- remove 1 seed from drops as it is replanted.
        seeds_blocked = 1
      else
        core.add_item(pos, itemname)
      end
    end
  end
end

--Check if the node is a crop. true/false.
function resourcecrops.check_crop_node(pos)
  local node = core.get_node(pos)
  local def = core.registered_nodes[node.name]
	if def == nil then
    return false
  end
  return def.groups.resource_crops_harvestable == 1 
end


function resourcecrops.add_crop(seed_description, essence_description, resource_name,   essence_level, recipe_input,        recipe_output,         mod_name)
  -- example:                  ("Coal Seeds",     "Coal Essence",      "coal",          "weak",        "default:coal_lump", "default:coal_lump 2")

  if not mod_name then
    mod_name = "resource_crops"
  end
  
  local essence_item = mod_name..":"..resource_name.."_essence"
  local essence_ingredient = "resource_crops:essence_"..essence_level

  -- Register Plant
  local essence_groups = {essence = 1}
  essence_groups["essence_"..essence_level] = 1
  local plant_def = {
    description = seed_description,
    harvest_description = essence_description,
    paramtype2 = "meshoptions",
    place_param2 = 0,
    inventory_image = mod_name.."_"..resource_name.."_seed.png",
    steps = 4,
    minlight = 8,
    maxlight = default.LIGHT_MAX,
    fertility = {"grassland"},
    groups = essence_groups,
  }
  local seed_item = farming.register_plant(essence_item, plant_def).seed -- "resource_crops:seed_coal_essence"
  -- item texture: 	 "resource_crops_coal_essence.png"
  -- plant textures: "resource_crops_coal_essence_1.png" to "resource_crops_coal_essence_4.png"
  -- seed texture:   "resource_crops_coal_seed.png"

  -- Add fully grown to group resource_crops_harvestable
  local fully_grown_def = core.registered_nodes[essence_item.."_4"]
  local fully_grown_groups = table.copy(fully_grown_def.groups)
  fully_grown_groups.resource_crops_harvestable = 1
  core.override_item(essence_item.."_4", { groups=fully_grown_groups })

  --Register Recipes
  if recipe_output then
    core.register_craft({ -- craft 9 essence into recipe_output
      output = recipe_output,
      recipe = {{essence_item, essence_item, essence_item},
            {essence_item, essence_item, essence_item},
            {essence_item, essence_item, essence_item}}
    })
  end
  if recipe_input then
    core.register_craft({ -- craft the seed from 4 resource, 4 generic essence, and a essence seed
      output = seed_item,
      recipe = {{recipe_input, essence_ingredient, recipe_input},
            {essence_ingredient, "resource_crops:seed_essence", essence_ingredient},
            {recipe_input, essence_ingredient, recipe_input}}
    })
  end
  core.register_craft({ -- convert a seed into one essence.
    output = essence_item,
    recipe = {
      {seed_item}
    }
  })

  if mod_name == "resource_crops" then
    -- Register aliases for v1.x.x
    core.register_alias("resource_crops:"..resource_name.."_seed", seed_item)
    core.register_alias("resource_crops:"..resource_name.."crop_1", essence_item.."_1")
    core.register_alias("resource_crops:"..resource_name.."crop_2", essence_item.."_2")
    core.register_alias("resource_crops:"..resource_name.."crop_3", essence_item.."_3")
    core.register_alias("resource_crops:"..resource_name.."crop", essence_item.."_4")
  end
end

