resourcecrops = {}
local modname = minetest.get_current_modname()
resourcecrops.path = minetest.get_modpath(modname)
local function runfile(file)
    dofile(resourcecrops.path .. "/" .. file .. ".lua")
end
runfile("lib")
runfile("settings")
--FIX FARMING MOD CROPS
runfile("farming")
--ESSENCE--
runfile("essence")
--UPGRADE STONES--
runfile("upgrade_stones")
--BASE--
runfile("base")
if resourcecrops.settings.elements then
    runfile("elements")
end

local S = minetest.get_translator(minetest.get_current_modname())



-- default materials
if resourcecrops.settings.crop_coal then
    resourcecrops.add_crop(S("Coal Seeds"), S("Coal Essence"), "coal", "weak", "default:coal_lump", "default:coal_lump 2")
end if resourcecrops.settings.crop_tin then
    resourcecrops.add_crop(S("Tin Seeds"), S("Tin Essence"),  "tin", "weak", "default:tin_ingot", "default:tin_lump 2")
end if resourcecrops.settings.crop_copper then
    resourcecrops.add_crop(S("Copper Seeds"), S("Copper Essence"), "copper", "regular", "default:copper_ingot", "default:copper_lump 2")
end if resourcecrops.settings.crop_iron then
    resourcecrops.add_crop(S("Iron Seeds"), S("Iron Essence"), "iron", "regular", "default:iron_ingot", "default:iron_lump 2")
end if resourcecrops.settings.crop_gold then
    resourcecrops.add_crop(S("Gold Seeds"), S("Gold Essence"), "gold", "strong", "default:gold_ingot", "default:gold_lump 2")
end if resourcecrops.settings.crop_diamond then
    resourcecrops.add_crop(S("Diamond Seeds"), S("Diamond Essence"), "diamond", "extreme", "default:diamond", "default:diamond")
end if resourcecrops.settings.crop_mese then
    resourcecrops.add_crop(S("Mese Seeds"), S("Mese Essence"), "mese", "strong", "default:mese_crystal", "default:mese_crystal")
end

-- moreores metals
if resourcecrops.settings.crop_silver then
    resourcecrops.add_crop(S("Silver Seeds"), S("Silver Essence"), "silver", "regular", "moreores:silver_ingot", "moreores:silver_lump 2")
end if resourcecrops.settings.crop_mithril then
    resourcecrops.add_crop(S("Mithril Seeds"), S("Mithril Essence"), "mithril", "strong", "moreores:mithril_ingot", "moreores:mithril_lump 2")
end

-- technic materials
if resourcecrops.settings.crop_brass then
    resourcecrops.add_crop(S("Brass Seeds"), S("Brass Essence"), "brass", "regular", "technic:brass_ingot", "technic:brass_ingot 2")
end if resourcecrops.settings.crop_cast_iron then
    resourcecrops.add_crop(S("Cast Iron Seeds"), S("Cast Iron Essence"), "cast_iron", "regular", "technic:cast_iron_ingot", "technic:cast_iron_ingot 2")
end if resourcecrops.settings.crop_carbon_steel then
    resourcecrops.add_crop(S("Carbon Steel Seeds"), S("Carbon Steel Essence"), "carbon_steel", "strong", "technic:carbon_steel_ingot", "technic:carbon_steel_ingot")
end if resourcecrops.settings.crop_chromium then
    resourcecrops.add_crop(S("Chromium Seeds"), S("Chromium Essence"), "chromium", "regular", "technic:chromium_ingot", "technic:chromium_lump 2")
end if resourcecrops.settings.crop_lead then
    resourcecrops.add_crop(S("Lead Seeds"), S("Lead Essence"), "lead", "regular", "technic:lead_ingot", "technic:lead_lump 2")
end if resourcecrops.settings.crop_sulfur then
    resourcecrops.add_crop(S("Sulfur Seeds"), S("Sulfur Essence"), "sulfur", "weak", "technic:sulfur_lump", "technic:sulfur_lump 2")
end if resourcecrops.settings.crop_uranium then
    resourcecrops.add_crop(S("Uranium Seeds"), S("Uranium Essence"), "uranium", "extreme", "technic:uranium_ingot", "technic:uranium_lump 2")
end if resourcecrops.settings.crop_zinc then
    resourcecrops.add_crop(S("Zinc Seeds"), S("Zinc Essence"), "zinc", "regular", "technic:zinc_ingot", "technic:zinc_lump 2")
end if resourcecrops.settings.crop_rubber then
    resourcecrops.add_crop(S("Rubber Seeds"), S("Rubber Essence"), "rubber", "regular", "technic:rubber", "technic:rubber 3")
end 

-- terumet metal
if resourcecrops.settings.crop_terumet then
    resourcecrops.add_crop(S("Terumetal Seeds"), S("Terumetal Essence"), "terumetal", "strong", "terumet:lump_raw", "terumet:lump_raw 2")
end

-- xtraores metals
if resourcecrops.settings.crop_nickel then
    resourcecrops.add_crop(S("Nickel Seeds"), S("Nickel Essence"), "nickel", "weak", "xtraores:nickel_bar", "xtraores:nickel_bar 4")
end if resourcecrops.settings.crop_platinum then
    resourcecrops.add_crop(S("Platinum Seeds"), S("Platinum Essence"), "platinum", "regular", "xtraores:platinum_bar", "xtraores:platinum_bar 3")
end if resourcecrops.settings.crop_palladium then
    resourcecrops.add_crop(S("Palladium Seeds"), S("Palladium Essence"), "palladium", "strong", "xtraores:palladium_bar", "xtraores:palladium_bar 3")
end if resourcecrops.settings.crop_cobalt then
    resourcecrops.add_crop(S("Cobalt Seeds"), S("Cobalt Essence"), "cobalt", "strong", "xtraores:cobalt_bar", "xtraores:cobalt_bar 2")
end if resourcecrops.settings.crop_thorium then
    resourcecrops.add_crop(S("Thorium Seeds"), S("Thorium Essence"), "thorium", "strong", "xtraores:thorium_bar", "xtraores:thorium_bar 1")
end if resourcecrops.settings.crop_antracite then
    resourcecrops.add_crop(S("Antracite Seeds"), S("Antracite Essence"), "antracite", "strong", "xtraores:antracite_lump", "xtraores:antracite_lump 1")
end if resourcecrops.settings.crop_osmium then
    resourcecrops.add_crop(S("Osmium Seeds"), S("Osmium Essence"), "osmium", "extreme", "xtraores:osmium_bar", "xtraores:osmium_bar 3")
end if resourcecrops.settings.crop_rhenium then
    resourcecrops.add_crop(S("Rhenium Seeds"), S("Rhenium Essence"), "rhenium", "extreme", "xtraores:rhenium_bar", "xtraores:rhenium_bar 2")
end if resourcecrops.settings.crop_vanadium then
    resourcecrops.add_crop(S("Vanadium Seeds"), S("Vanadium Essence"), "vanadium", "extreme", "xtraores:vanadium_bar", "xtraores:vanadium_bar 1")
end if resourcecrops.settings.crop_rarium then
    resourcecrops.add_crop(S("Rarium Seeds"), S("Rarium Essence"), "rarium", "extreme", "xtraores:rarium_bar", "xtraores:rarium_bar 1")
end if resourcecrops.settings.crop_orichalcum then
    resourcecrops.add_crop(S("Orichalcum Seeds"), S("Orichalcum Essence"), "orichalcum", "extreme", "xtraores:orichalcum_bar", "xtraores:orichalcum_bar 1")
end if resourcecrops.settings.crop_titanium then
    resourcecrops.add_crop(S("Titanium Seeds"), S("Titanium Essence"), "titanium", "extreme", "xtraores:titanium_bar", "xtraores:titanium_bar 1")
end
--These materials have the same name as ones from technic, rename them if the technic crop is enabled.
if resourcecrops.settings.crop_xores_uranium and resourcecrops.settings.crop_uranium then
    resourcecrops.add_crop(S("Uranium (XtraOres) Seeds"), S("Uranium (XtraOres) Essence"), "xores_uranium", "extreme", "xtraores:uranium_bar", "xtraores:uranium_bar 1")
elseif resourcecrops.settings.crop_xores_uranium then
    resourcecrops.add_crop(S("Uranium Seeds"), S("Uranium Essence"), "xores_uranium", "extreme", "xtraores:uranium_bar", "xtraores:uranium_bar 1")
end
if resourcecrops.settings.crop_xores_chromium and resourcecrops.settings.crop_chromium then
    resourcecrops.add_crop(S("Chromium (XtraOres) Seeds"), S("Chromium (XtraOres) Essence"), "xores_chromium", "extreme", "xtraores:chromium_bar", "xtraores:chromium_bar 1")
elseif resourcecrops.settings.crop_xores_chromium then
    resourcecrops.add_crop(S("Chromium Seeds"), S("Chromium Essence"), "xores_chromium", "extreme", "xtraores:chromium_bar", "xtraores:chromium_bar 1")
end 

print("Resource Crops loaded!")
