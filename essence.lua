local S = minetest.get_translator(minetest.get_current_modname())

--reused resourcecrops.add_crop code for node naming.

local essence_item = "resource_crops:essence"

-- Register Plant
local plant_def = {
	description = S("Essence Seeds"),
	harvest_description = S("Essence Dust"),
	paramtype2 = "meshoptions",
	place_param2 = 0,
	inventory_image = "resource_crops_essence_seed.png",
	steps = 4,
	minlight = 8,
	maxlight = default.LIGHT_MAX,
	fertility = {"grassland"},
	groups = {magic_essence = 1},
}
farming.register_plant(essence_item, plant_def)
-- item texture: 	 "resource_crops_essence.png"
-- plant textures: "resource_crops_essence_1.png" to "resource_crops_essence_4.png"
-- seed texture:   "resource_crops_seed.png"


-- Add fully grown to group resource_crops_harvestable
local fully_grown_def = minetest.registered_nodes[essence_item.."_4"]
local fully_grown_groups = table.copy(fully_grown_def.groups)
fully_grown_groups.resource_crops_harvestable = 1
minetest.override_item(essence_item.."_4", { groups=fully_grown_groups })


--Register essences
minetest.register_craftitem("resource_crops:essence_weak", {
	description = S("Weak Essence"),
	groups = {magic_essence = 1, essence = 1},
	inventory_image = "resource_crops_essence_weak.png"
})
minetest.register_craftitem("resource_crops:essence_regular", {
	description = S("Regular Essence"),
	groups = {magic_essence = 1, essence = 1},
	inventory_image = "resource_crops_essence_regular.png"
})
minetest.register_craftitem("resource_crops:essence_strong", {
	description = S("Strong Essence"),
	groups = {magic_essence = 1, essence = 1},
	inventory_image = "resource_crops_essence_strong.png"
})
minetest.register_craftitem("resource_crops:essence_extreme", {
	description = S("Extreme Essence"),
	groups = {magic_essence = 1, essence = 1},
	inventory_image = "resource_crops_essence_extreme.png"
})

minetest.register_node("resource_crops:essence_block", {
	description = S("Essence Block"),
	tiles = {"resource_crops_essence_block.png"},
	groups = {snappy=1,oddly_breakable_by_hand=2},
})


--Register Recipies
minetest.register_craft({
	output = "resource_crops:essence_weak",
	recipe = {
		{"", "resource_crops:essence", ""},
		{"resource_crops:essence", "resource_crops:upgrade_stone_weak", "resource_crops:essence"},
		{"", "resource_crops:essence", ""}
	},
	replacements = {{"resource_crops:upgrade_stone_weak", "resource_crops:upgrade_stone_weak"}},
})
minetest.register_craft({
	output = "resource_crops:essence_regular",
	recipe = {
		{"", "resource_crops:essence_weak", ""},
		{"resource_crops:essence_weak", "resource_crops:upgrade_stone_regular", "resource_crops:essence_weak"},
		{"", "resource_crops:essence_weak", ""}
	},
	replacements = {{"resource_crops:upgrade_stone_regular", "resource_crops:upgrade_stone_regular"}},
})
minetest.register_craft({
	output = "resource_crops:essence_strong",
	recipe = {
		{"", "resource_crops:essence_regular", ""},
		{"resource_crops:essence_regular", "resource_crops:upgrade_stone_strong", "resource_crops:essence_regular"},
		{"", "resource_crops:essence_regular", ""}
	},
	replacements = {{"resource_crops:upgrade_stone_strong", "resource_crops:upgrade_stone_strong"}},
})
minetest.register_craft({
	output = "resource_crops:essence_extreme",
	recipe = {
		{"", "resource_crops:essence_strong", ""},
		{"resource_crops:essence_strong", "resource_crops:upgrade_stone_extreme", "resource_crops:essence_strong"},
		{"", "resource_crops:essence_strong", ""}
	},
	replacements = {{"resource_crops:upgrade_stone_extreme", "resource_crops:upgrade_stone_extreme"}},
})
minetest.register_craft({
	output = "resource_crops:essence_block",
	recipe = {
		{"resource_crops:essence_regular", "resource_crops:essence_extreme", "resource_crops:essence_regular"},
		{"resource_crops:essence_extreme", "resource_crops:upgrade_stone_extreme", "resource_crops:essence_extreme"},
		{"resource_crops:essence_regular", "resource_crops:essence_extreme", "resource_crops:essence_regular"}
	},
	replacements = {{"resource_crops:upgrade_stone_extreme", "resource_crops:upgrade_stone_extreme"}},
})

--Essence Downgrades
minetest.register_craft({
	output = 'resource_crops:essence_regular 68',
	recipe = {{'resource_crops:essence_block'}}
})
minetest.register_craft({
	output = "resource_crops:essence_strong 4",
	recipe = {{"resource_crops:essence_extreme"}}
})
minetest.register_craft({
	output = "resource_crops:essence_regular 4",
	recipe = {{"resource_crops:essence_strong"}}
})
minetest.register_craft({
	output = "resource_crops:essence_weak 4",
	recipe = {{"resource_crops:essence_regular"}}
})
minetest.register_craft({
	output = "resource_crops:essence 4",
	recipe = {{"resource_crops:essence_weak"}}
})
minetest.register_craft({
	output = "resource_crops:essence",
	recipe = {{"resource_crops:seed_essence"}}
})

minetest.register_craft({
	output = "resource_crops:seed_essence",
	recipe = {
		{"resource_crops:essence", "resource_crops:essence_weak", "resource_crops:essence"},
		{"resource_crops:essence_weak", "group:seed"         , "resource_crops:essence_weak"},
		{"resource_crops:essence", "resource_crops:essence_weak", "resource_crops:essence"}
	}
})


-- Aliases for v1.x.x

minetest.register_alias("resource_crops:essence_seed", "resource_crops:seed_essence")
minetest.register_alias("resource_crops:essencecrop_1", "resource_crops:essence_1")
minetest.register_alias("resource_crops:essencecrop_2", "resource_crops:essence_2")
minetest.register_alias("resource_crops:essencecrop_3", "resource_crops:essence_3")
minetest.register_alias("resource_crops:essencecrop", "resource_crops:essence_4")
minetest.register_alias("resource_crops:essence_dust", "resource_crops:essence")
