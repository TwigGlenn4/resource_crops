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
* Adds support for Xtraores by daviddoesminetest https://forum.minetest.net/viewtopic.php?t=12798
# v1.3.1
* Fixes a crash when the block under a crop is broken, now any block that isn't farmland will cause the crop to drop. Crops that aren't fully grown now drop a seed when broken.
# v1.3.0
* Adds support for translations, Esperanto translation by [jolesh](https://github.com/jolesh), and Español translation by Google Translate
# v1.2.2
* Fixes crafting obsidian from fire, earth, and water essences.
