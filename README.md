[![ContentDB](https://content.minetest.net/packages/TwigGlenn4/resource_crops/shields/title/)](https://content.minetest.net/packages/TwigGlenn4/resource_crops/)
[![ContentDB](https://content.minetest.net/packages/TwigGlenn4/resource_crops/shields/downloads/)](https://content.minetest.net/packages/TwigGlenn4/resource_crops/)

# Resource Crops

Resource Crops is a mod made by TwigGlenn4 that adds crops that grow resources to [Minetest](https://www.minetest.net/), 
a free and open source infinite world block sandbox game. This mod was inspired by the Mystical Agricutlure mod for Minecraft.

## Suggestions
You should install a crafting guide mod, such as [Unified Inventory](https://content.minetest.net/packages/RealBadAngel/unified_inventory/)

Growing crops takes time, and getting higher teir crops is a very slow process.
If you do not want to wait as long, you can change the settings:

```
resourcecrops_growth_interval (growth interval) = 10
resourcecrops_growth_chance (growth chance) = 4
```

## Items & Nodes
### Essence Ore
Essence Ore is found between depths of -5 and -5000.
### Essence Harvester
The Essence Harvester will harvest any fully grown resource crop directly under it and drop the item onto the crop.
### Seeds
Seeds are placed on farmland, only grow when it is wet, and can be crafted into their respective essence.
### Essences 
Essences are usually crafted into materials by filling the crafting grid, see special recipies with a crafting guide mod.
### Elemental Essences
Mostly used as another way to get misc items. Fire essence can be crafted with an item to smelt it.
Essence Smelting only currently works with metals that have existing crops and recipies from *minetest_game*
### Inferno Stone
The Inferno Stone can be crafted with an item to get the twice the result of smelting that item, it is not consumed by the recipe.
This only works on the same items as fire essence.
### Crops
Crops require a light level of at least 8, so they can grow in torchlight. You can punch a crop to harvest it, 
which drops it's items and resets the crop to it's first growth level.


## Config
The options have short descriptions found in the client interface settings or [`settingtypes.txt`](settingtypes.txt)
To change the config options of this mod, you have two options:

### Client Interface
1. With Minetest running, click the menu tab called "Settings".
2. Click the "Advanced Setting".
3. Open the "Mods" section.
4. Open the "resource_crops" subsection.
5. Change values as you wish!

### Text Editor or Server
1. Find "resourcecrops" in your "mods" folder.
2. Open "settingtypes.txt", copy options you want to change, but not the lines starting with "#".
3. Find "minetest.conf" in minetest's main folder, it might be beside the "mods" folder.
4. Paste the options you copied into minetest.conf, change them to your liking.

## Compat
### Mods
This mod alters the growth of crops from the *farming* mod in *minetest_game*. Cotton and wheat now have a 4-step growth cycle like the other added crops. 

Includes support for <br>
[More Ores](https://content.minetest.net/packages/Calinou/moreores/) <br>
[Technic](https://content.minetest.net/packages/RealBadAngel/technic/) <br>
[Xtraores](https://forum.minetest.net/viewtopic.php?t=12798) <br>
*Note, only the xtraores version by daviddoesminetest has been tested, other versions may be incompatible. <br>
*Note 2, xtraores metals level 9 (Rarium) and above are disabled by default for balancing, they can be enabled in settings.

### Minetest
This version was developed on Minetest 5.6.1.
It might work on older versions, but I have not tested them.

## Changelog
See ['description.txt'](description.txt) for the changelog.

## License

- Resource Crops is licensed with the MIT license, see
  [`LICENSE.md`](LICENSE.md) for details.
