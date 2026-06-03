# v2.0.3
* Fix other mods unable to use `resourcecrops.add_crop()` due to namespace issues by auto-detecting mod name and allowing override.
* Allow `resourcecrops.register_fire_essence_smelting()` to handle item quantity in the result variable.

**API**
* Added optional `override_mod_name` parameter to end of `resourcecrops.add_crop()` param list.
* `resourcecrops.add_crop()` now uses the calling mod's name for nodes and textures, see [API.md](API.md). This is a breaking change.
* `resourcecrops.register_fire_essence_smelting()` now properly applies quantities of result item in itemstring format (ex. `"default:iron_ingot 2"`)

# v2.0.2
* Add documentation for other mods to add support for Resource Crops in [API.md](API.md).
* Refactor to `core` namespace instead of `minetest` and update Minetest to Luanti.
* Make `resourcecrops.register_fire_essence_smelting(input, result)` a public function for other mods to easily register Fire Essence and Inferno Stone smelting recipes.
* Make Fire Essence and Inferno Stone recipes shapeless.

# v2.0.1
* Add a null check in `resourcecrops.check_crop_node(pos)` to prevent a crash when punching unknown nodes.

# v2.0.0
* Rewrote backend to stop changing behavior of `farming` mod and properly use the `farming` API
* Now compatible with mods that add new soil nodes (ex. `everness`) and no longer breaks wheat and cotton on those new soil nodes
* Essence type is now visibile throughout crop growth instead of only on the final stage
* REMOVED crop growth interval and chance settings. These are not easily modifiable though the `farming` API.

# v1.4.4
* README typo

# v1.4.3
* Essence duplication fixed by [Monniasza](https://github.com/Monniasza)

# v1.4.2
* Add German, Dutch, and Danish translations by [jolesh](https://github.com/jolesh)

# v1.4.1
* Fixes Xtraores antricite recipe. Fixes missing Fire Essence and Inferno Stone smelting. Also changes Inferno Stone to be made with obsidian instead of stone.

# v1.4.0
* Adds support for Xtraores by daviddoesminetest https://forum.luanti.org/viewtopic.php?t=12798

# v1.3.1
* Fixes a crash when the block under a crop is broken, now any block that isn't farmland will cause the crop to drop. Crops that aren't fully grown now drop a seed when broken.

# v1.3.0
* Adds support for translations, Esperanto translation by [jolesh](https://github.com/jolesh), and Español translation by Google Translate

# v1.2.2
* Fixes crafting obsidian from fire, earth, and water essences.
