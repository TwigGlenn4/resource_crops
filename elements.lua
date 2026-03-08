local S = core.get_translator(core.get_current_modname())

--EARTH--
resourcecrops.add_crop(S("Earth Seeds"), S("Earth Essence"), "earth", "extreme", "group:stone", nil)

--NATURE--
core.register_craftitem("resource_crops:grass_seed", {
    description = S("Grass Seeds"),
    inventory_image = "resource_crops_grass_seed.png",
})

resourcecrops.add_crop(S("Nature Seeds"), S("Nature Essence"), "nature", "extreme", "group:leaves", "resource_crops:grass_seed")

core.register_on_punchnode(function(pos, node, puncher, pointed_thing)
    if node.name == "default:dirt" then
	local puncher_name = puncher:get_player_name()
	local item = puncher:get_wielded_item()
	if item:get_name() == "resource_crops:grass_seed" then
	    core.set_node(pos, {name="default:dirt_with_grass"})
	    if not (creative and creative.is_enabled_for and creative.is_enabled_for(puncher:get_player_name())) then
		item:take_item()
		puncher:set_wielded_item(item)
	    end
	end
    end
end)

--WATER--
resourcecrops.add_crop(S("Water Seeds"), S("Water Essence"), "water", "extreme", nil, "default:snow 9")
core.register_craft({
    output = "resource_crops:seed_water_essence",
    recipe = {{"bucket:bucket_water", "resource_crops:essence_extreme", "bucket:bucket_water"},
	      {"resource_crops:essence_extreme", "resource_crops:seed_essence", "resource_crops:essence_extreme"},
	      {"bucket:bucket_water", "resource_crops:essence_extreme", "bucket:bucket_water"}},
    replacements = {{"bucket:bucket_water", "bucket:bucket_empty"}, {"bucket:bucket_water", "bucket:bucket_empty"}, {"bucket:bucket_water", "bucket:bucket_empty"}, {"bucket:bucket_water", "bucket:bucket_empty"}}
})
core.register_craft({
    output = "resource_crops:seed_water_essence",
    recipe = {{"bucket:bucket_river_water", "resource_crops:essence_extreme", "bucket:bucket_river_water"},
	      {"resource_crops:essence_extreme", "resource_crops:seed_essence", "resource_crops:essence_extreme"},
	      {"bucket:bucket_river_water", "resource_crops:essence_extreme", "bucket:bucket_river_water"}},
    replacements = {{"bucket:bucket_river_water", "bucket:bucket_empty"}, {"bucket:bucket_river_water", "bucket:bucket_empty"}, {"bucket:bucket_river_water", "bucket:bucket_empty"}, {"bucket:bucket_river_water", "bucket:bucket_empty"}}
})

--FIRE--
resourcecrops.add_crop(S("Fire Seeds"), S("Fire Essence"), "fire", "extreme", nil, "fire:permanent_flame")
core.register_craft({
    output = "resource_crops:seed_fire_essence",
    recipe = {{"bucket:bucket_lava", "resource_crops:essence_extreme", "bucket:bucket_lava"},
	      {"resource_crops:essence_extreme", "resource_crops:seed_essence", "resource_crops:essence_extreme"},
	      {"bucket:bucket_lava", "resource_crops:essence_extreme", "bucket:bucket_lava"}},
    replacements = {{"bucket:bucket_lava", "bucket:bucket_empty"}, {"bucket:bucket_lava", "bucket:bucket_empty"}, {"bucket:bucket_lava", "bucket:bucket_empty"}, {"bucket:bucket_lava", "bucket:bucket_empty"}}
})

function resourcecrops.register_fire_essence_smelting(input, result)
    core.register_craft({
        type = "shapeless",
        output = result,
        recipe = {"resource_crops:fire_essence", input}
    })
    core.register_craft({
        type = "shapeless",
        output = result.." 2",
        recipe = {"resource_crops:inferno_stone", input},
        replacements = {{"resource_crops:inferno_stone", "resource_crops:inferno_stone"}}
    })
end



--CRAFTING--
--NATURE--
core.register_craft({
    type = "shapeless",
    output = "default:dirt_with_grass",
    recipe = {"resource_crops:grass_seed", "resource_crops:grass_seed"}
})
core.register_craft({
    type = "shapeless",
    output = "farming:wheat 9",
    recipe = {"resource_crops:nature_essence", "resource_crops:nature_essence"}
})
core.register_craft({
    type = "shapeless",
    output = "farming:cotton 9",
    recipe = {"resource_crops:nature_essence", "resource_crops:nature_essence", "resource_crops:nature_essence"}
})
core.register_craft({
    type = "shapeless",
    output = "default:sapling 9",
    recipe = {"resource_crops:nature_essence", "resource_crops:nature_essence", "resource_crops:nature_essence", "resource_crops:nature_essence"}
})
core.register_craft({
    type = "shapeless",
    output = "default:papyrus 9",
    recipe = {"resource_crops:nature_essence", "resource_crops:nature_essence", "resource_crops:nature_essence", "resource_crops:nature_essence", "resource_crops:nature_essence"}
})
core.register_craft({
    type = "shapeless",
    output = "default:leaves 18",
    recipe = {"resource_crops:nature_essence", "resource_crops:nature_essence", "resource_crops:nature_essence", "resource_crops:nature_essence", "resource_crops:nature_essence", "resource_crops:nature_essence"}
})
core.register_craft({
    type = "shapeless",
    output = "default:tree 9",
    recipe = {"resource_crops:nature_essence", "resource_crops:nature_essence", "resource_crops:nature_essence", "resource_crops:nature_essence", "resource_crops:nature_essence", "resource_crops:nature_essence", "resource_crops:nature_essence"}
})



--EARTH--
core.register_craft({
    output = "default:dirt 36",
    recipe = {{"resource_crops:earth_essence", "resource_crops:earth_essence"},
	      {"resource_crops:earth_essence", "resource_crops:earth_essence"}}
})
core.register_craft({
    output = "default:gravel 36",
    recipe = {{"", "resource_crops:earth_essence", ""},
	      {"resource_crops:earth_essence", "", "resource_crops:earth_essence"},
	      {"", "resource_crops:earth_essence", ""}}
})
core.register_craft({
    output = "default:sandstone 18",
    recipe = {{"", "resource_crops:earth_essence", "resource_crops:earth_essence"},
	      {"resource_crops:earth_essence", "resource_crops:earth_essence", "resource_crops:earth_essence"}}
})
core.register_craft({
    output = "default:desert_sandstone 18",
    recipe = {{"resource_crops:earth_essence", "", "resource_crops:earth_essence"},
	      {"resource_crops:earth_essence", "resource_crops:earth_essence", "resource_crops:earth_essence"}}
})
core.register_craft({
    output = "default:silver_sandstone 18",
    recipe = {{"resource_crops:earth_essence", "resource_crops:earth_essence", ""},
	      {"resource_crops:earth_essence", "resource_crops:earth_essence", "resource_crops:earth_essence"}}
})
core.register_craft({
    output = "default:stone 18",
    recipe = {{"", "resource_crops:earth_essence", "resource_crops:earth_essence"},
	      {"resource_crops:earth_essence", "resource_crops:earth_essence", "resource_crops:earth_essence"},
	      {"resource_crops:earth_essence", "resource_crops:earth_essence", "resource_crops:earth_essence"}}
})
core.register_craft({
    output = "default:desert_stone 18",
    recipe = {{"resource_crops:earth_essence", "resource_crops:earth_essence", ""},
	      {"resource_crops:earth_essence", "resource_crops:earth_essence", "resource_crops:earth_essence"},
	      {"resource_crops:earth_essence", "resource_crops:earth_essence", "resource_crops:earth_essence"}}
})



--WATER--
core.register_craft({
    output = "bucket:bucket_water",
    recipe = {{"resource_crops:water_essence", "resource_crops:water_essence", "resource_crops:water_essence"},
	      {"resource_crops:water_essence", "resource_crops:water_essence", "resource_crops:water_essence"},
	      {"resource_crops:water_essence", "bucket:bucket_empty", ""}}
})
core.register_craft({
    output = "bucket:bucket_river_water",
    recipe = {{"resource_crops:water_essence", "resource_crops:water_essence", "resource_crops:water_essence"},
	      {"resource_crops:water_essence", "resource_crops:water_essence", "resource_crops:water_essence"},
	      {"", "bucket:bucket_empty", "resource_crops:water_essence"}}
})



--FIRE--
core.register_craftitem("resource_crops:inferno_stone", {
	description = S("Inferno Stone"),
	inventory_image = "resource_crops_inferno_stone.png",
	stack_max = 1,
})
core.register_craft({
	output = "bucket:bucket_lava",
	recipe = {{"resource_crops:fire_essence", "resource_crops:fire_essence", "resource_crops:fire_essence"},
		  {"resource_crops:fire_essence", "resource_crops:fire_essence", "resource_crops:fire_essence"},
		  {"resource_crops:fire_essence", "bucket:bucket_empty", "resource_crops:fire_essence"}}
})
core.register_craft({
	output = "default:torch 18",
	recipe = {{"resource_crops:fire_essence"},
		  {"default:stick"}}
})
core.register_craft({
	output = "resource_crops:inferno_stone",
	recipe = {{"resource_crops:fire_essence", "resource_crops:essence_block", "resource_crops:fire_essence"},
		  {"bucket:bucket_lava", "default:obsidian", "bucket:bucket_lava"},
		  {"resource_crops:fire_essence", "resource_crops:essence_block", "resource_crops:fire_essence"}},
	replacements = {{"bucket:bucket_lava", "bucket:bucket_empty"}, {"bucket:bucket_lava", "bucket:bucket_empty"}}
})

--MIX--
core.register_craft({
    output = "default:obsidian 9",
    recipe = {{"resource_crops:fire_essence", "resource_crops:fire_essence", "resource_crops:fire_essence"},
		  {"resource_crops:earth_essence", "resource_crops:earth_essence", "resource_crops:earth_essence"},
		  {"resource_crops:water_essence", "resource_crops:water_essence", "resource_crops:water_essence"}}
})
core.register_craft({
    output = "default:clay 36",
    recipe = {{"resource_crops:earth_essence", "resource_crops:water_essence"},
	      {"resource_crops:water_essence", "resource_crops:earth_essence"}}
})
core.register_craft({
    output = "default:clay 36",
    recipe = {{"resource_crops:water_essence", "resource_crops:earth_essence"},
	      {"resource_crops:earth_essence", "resource_crops:water_essence"}}
})
core.register_craft({
    output = "default:sand 36",
    recipe = {{"resource_crops:fire_essence", "resource_crops:earth_essence"},
	      {"resource_crops:earth_essence", "resource_crops:fire_essence"}}
})
core.register_craft({
    output = "default:sand 36",
    recipe = {{"resource_crops:earth_essence", "resource_crops:fire_essence"},
	      {"resource_crops:fire_essence", "resource_crops:earth_essence"}}
})

core.register_craft({
	type = "fuel",
	recipe = "resource_crops:fire_essence",
	burntime = 60,
})
--FIRE ESSENCE SMELTING--
resourcecrops.register_fire_essence_smelting("default:clay_lump", "default:clay_brick")
resourcecrops.register_fire_essence_smelting("default:tin_lump", "default:tin_ingot")
resourcecrops.register_fire_essence_smelting("default:copper_lump", "default:copper_ingot")
resourcecrops.register_fire_essence_smelting("default:iron_lump", "default:iron_ingot")
resourcecrops.register_fire_essence_smelting("default:gold_lump", "default:gold_ingot")
resourcecrops.register_fire_essence_smelting("default:cobble", "default:stone")
resourcecrops.register_fire_essence_smelting("default:mossy_cobble", "default:stone")
resourcecrops.register_fire_essence_smelting("default:desert_cobble", "default:desert_stone")
resourcecrops.register_fire_essence_smelting("group:sand", "default:glass")
resourcecrops.register_fire_essence_smelting("default:obsidian_shard", "default:obsidian_glass")
resourcecrops.register_fire_essence_smelting("default:key", "default:gold_ingot")
resourcecrops.register_fire_essence_smelting("default:skeleton_key", "default:gold_ingot")
if resourcecrops.has_moreores then
    resourcecrops.register_fire_essence_smelting("moreores:silver_lump", "moreores:silver_ingot")
    resourcecrops.register_fire_essence_smelting("moreores:mithril_lump", "moreores:mithril_ingot")
end
if resourcecrops.has_technic_ores then
    resourcecrops.register_fire_essence_smelting("technic:uranium_lump", "technic:uranium_ingot")
    resourcecrops.register_fire_essence_smelting("technic:chromium_lump", "technic:chromium_ingot")
    resourcecrops.register_fire_essence_smelting("technic:zinc_lump", "technic:zinc_ingot")
    resourcecrops.register_fire_essence_smelting("technic:lead_lump", "technic:lead_ingot")
    resourcecrops.register_fire_essence_smelting("default:iron_ingot", "technic:cast_iron_ingot")
    resourcecrops.register_fire_essence_smelting("technic:cast_iron_ingot", "default:iron_ingot")
    resourcecrops.register_fire_essence_smelting("technic:carbon_steel_ingot", "default:iron_ingot")
end
if resourcecrops.has_terumet then
    resourcecrops.register_fire_essence_smelting("terumet:lump_raw", "terumet:ingot_raw")
end
if resourcecrops.has_xtraores then
    resourcecrops.register_fire_essence_smelting("xtraores:nickel_ore", "xtraores:nickel_bar")
    resourcecrops.register_fire_essence_smelting("xtraores:platinum_ore", "xtraores:platinum_bar")
    resourcecrops.register_fire_essence_smelting("xtraores:palladium_ore", "xtraores:palladium_bar")
    resourcecrops.register_fire_essence_smelting("xtraores:cobalt_ore", "xtraores:cobalt_bar")
    resourcecrops.register_fire_essence_smelting("xtraores:thorium_ore", "xtraores:thorium_bar")
    resourcecrops.register_fire_essence_smelting("xtraores:osmium_ore", "xtraores:osmium_bar")
    resourcecrops.register_fire_essence_smelting("xtraores:rhenium_ore", "xtraores:rhenium_bar")
    resourcecrops.register_fire_essence_smelting("xtraores:vanadium_ore", "xtraores:vanadium_bar")
    resourcecrops.register_fire_essence_smelting("xtraores:rarium_ore", "xtraores:rarium_bar")
    resourcecrops.register_fire_essence_smelting("xtraores:orichalcum_ore", "xtraores:orichalcum_bar")
    resourcecrops.register_fire_essence_smelting("xtraores:titanium_ore", "xtraores:titanium_bar")
    resourcecrops.register_fire_essence_smelting("xtraores:uranium_ore", "xtraores:uranium_bar")
    resourcecrops.register_fire_essence_smelting("xtraores:chromium_ore", "xtraores:chromium_bar")
end
