# API
If you want to add support for Resource Crops to your mod or addon/plugin, this is your guide! <br>

I am open to Issues asking me to integrate support for a mod, or Pull Requests if you can do the dirty work!

## Useful References
[Programming in Lua](https://www.lua.org/pil/contents.html) - Indexed by search engines for the official answers to everything from syntax to built-in functions. <br>
[Luanti API Documentation](https://api.luanti.org/) - In particular, the [Definition tables](https://api.luanti.org/definition-tables/) show everything that goes into each definition. <br>
[Luanti Modding Book by rubenwardy](https://rubenwardy.com/minetest_modding_book/en/index.html) - An excellent resource with examples starting from the basics. <br>

## Verify resource crops is active
First, set your mod to depend or optional_depend on `resource_crops`

If you only optionally depend on Resource Crops, then you should wrap your code that relates to this mod in the following `if` statement to prevent invalid references when Resource Crops is not loaded.

```lua
if core.get_modpath("resource_crops") ~= nil then
	-- Your code
end
```
## Add crops and items using `resourcecrops.add_crop()`
The `resourcecrops.add_crop()` function automatically handles most of creating a crop, essence, and crafting recipes for a resource. <br>
See examples in [init.lua](init.lua). 
- Note for examples from source code: This mod uses a translator `S("input_text")` for descriptions when calling `add_crop()`. This is not required, just use a string if you are not using a translator.
``` lua
resourcecrops.add_crop(seed_description, essence_description, resource_name,   essence_level, recipe_input,        recipe_output        )
  -- example:         ("Coal Seeds",     "Coal Essence",      "coal",          "weak",        "default:coal_lump", "default:coal_lump 2")
```
### Parameters
 - `seed_description`: The name of the seed item. Shown when item is hovered in the inventory.
 - `essence_description`: The name of the essence item. Shown when item is hovered in the inventory.
 - `resource_name`: The internal name of the resource. This is not seen by players, but is used for identifying items and textures, see [Created Items](#created-items) and [Expected Textures](#expected-textures).
 - `essence_level`: The essence used in the crafting [Recipe](#recipes) for the seed. Essence levels are `weak`, `regular`, `strong`, and `extreme`.
 - `recipe_input`: The itemstring of the resource item used in the crafting [Recipe](#recipes) for the seed. If not defined or `nil`, the recipe for the seed will not be registered automatically.
 - `recipe_output`: The itemstring of the output of crafting 9 resource essence together, optionally including the number of items. If not defined or `nil`, the recipe will not be registered automatically.

### Created Items

| Item Name             | Itemstring                                          | Name Example (Coal) | Itemstring Example (Coal)            |
|-----------------------|-----------------------------------------------------|---------------------|--------------------------------------|
| `essence_description` | `"resource_crops:"..resource_name.."_essence"`      | "Coal Essence"      | `"resource_crops:coal_essence"`      |
| `seed_description`    | `"resource_crops:seed_"..resource_name.."_essence"` | "Coal Seeds"        | `"resource_crops:seed_coal_essence"` |

### Recipes

Resource Seed (if `recipe_input` is not `nil`)
| Location | Item Name | Itemstring |
| --- | --- | ---|
| Center   | Essence Seed | `"resource_crops:seed_essence"` |
| Corners  | | `recipe_input`|
| Sides    | `essence_level` Essence | `"resource_crops:essence_"..essence_level` |

`recipe_output` (if not `nil`)
| Location | Item Name | Itemstring |
| --- | --- | ---|
| Every Slot   | `essence_description` | `"resource_crops:"..resource_name.."_essence"` |

Resource Essence (shapeless)
- Resource Seed

### Expected Textures
| Texture | Filename | Example |
| --- | --- | --- |
| Resource Essence | `"resource_crops_"..resource_name.."_essence.png"` | `"resource_crops_coal_essence.png"` |
| Plant Stage 1 | `"resource_crops_"..resource_name.."_essence_1.png"` | `"resource_crops_coal_essence_1.png"` |
| Plant Stage 2 | `"resource_crops_"..resource_name.."_essence_2.png"` | `"resource_crops_coal_essence_2.png"` |
| Plant Stage 3 | `"resource_crops_"..resource_name.."_essence_3.png"` | `"resource_crops_coal_essence_3.png"` |
| Plant Stage 4 | `"resource_crops_"..resource_name.."_essence_4.png"` | `"resource_crops_coal_essence_4.png"` |
| Resource Seed | `"resource_crops_"..resource_name.."_seed.png"` | `"resource_crops_coal_seed.png"` |


## Alternate Recipes
To use alternate recipes, you can leave `recipe_input` and/or `recipe_output` blank, then define your own recipes to craft a seed and/or use the essence. Examples of this are in [elements.lua](elements.lua)

## Fire Essence Smelting

Fire Essence Smelting is a shortcut to register two shapeless recipes
 - Fire Essence + `input` = `result`
 - Inferno Stone + `input` = 2 `result`

```lua
resourcecrops.register_fire_essence_smelting(input,               result)
  -- example:                               ("default:iron_lump", "default:iron_ingot")
```

 - Note: this function is incompatible with `result` itemstrings including a quantity (ex. `"default:iron_ingot 2"`) due to the extremely simple logic for making the Inferno Stone smelt into two items.
 If you want control over the quantities output by the recipe, you must register the recipes manually using the following code block.

```lua
core.register_craft({
    type = "shapeless",
    output = result, -- fire essence smelting result
    recipe = {"resource_crops:fire_essence", input}
})
core.register_craft({
    type = "shapeless",
    output = result, -- inferno stone smelting result
    recipe = {"resource_crops:inferno_stone", input},
    replacements = {{"resource_crops:inferno_stone", "resource_crops:inferno_stone"}}
})
```
 
