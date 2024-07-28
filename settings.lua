--Check for optional dependencies
resourcecrops.has_moreores = false
if minetest.get_modpath("moreores") then
	resourcecrops.has_moreores = true
end
resourcecrops.has_technic_ores = false
if minetest.get_modpath("technic_worldgen") ~= nil then
	resourcecrops.has_technic_ores = true --Use technic_worldgen because that part loads materials
end
resourcecrops.has_technic = false
if minetest.get_modpath("technic") then
	resourcecrops.has_technic = true --for rubber
end
resourcecrops.has_terumet = false
if minetest.get_modpath("terumet") then
	resourcecrops.has_terumet = true
end
resourcecrops.has_xtraores = false
if minetest.get_modpath("xtraores") then
	resourcecrops.has_xtraores = true
end

local prefix = "resourcecrops_"
resourcecrops.settings = {
    elements          = true,
    essence_ore       = true,
    essence_harvester = true,
    punch_harvest     = true,

    crop_coal    = true,
    crop_tin     = true,
    crop_copper  = true,
    crop_iron    = true,
    crop_gold    = true,
    crop_diamond = true,
    crop_mese    = true,
    
    crop_silver  = true,
    crop_mithril = true,
    
    crop_brass          = true,
    crop_cast_iron      = true,
    crop_carbon_steel   = true,
    crop_chromium       = true,
    crop_lead           = true,
    crop_sulfur         = true,
    crop_uranium        = true,
    crop_zinc           = true,
    crop_rubber         = true,
    
    crop_terumet    = true,

    crop_nickel     = true,
    crop_platinum   = true,
    crop_palladium  = true,
    crop_cobalt     = true,
    crop_thorium    = true,
    crop_antracite  = true,
    crop_osmium     = true,
    crop_rhenium    = true,
    crop_vanadium   = false,
    crop_rarium     = false,
    crop_orichalcum = false,
    crop_titanium   = false,
    crop_xores_uranium    = false,
    crop_xores_chromium   = false
}
for name, value in pairs(resourcecrops.settings) do
	local setting_type = type(value)
	if setting_type == "boolean" then
		resourcecrops.settings[name] = minetest.settings:get_bool(prefix..name)
		if resourcecrops.settings[name] == nil then
			resourcecrops.settings[name] = value
		end
	else
		resourcecrops.settings[name] = minetest.settings:get(prefix..name)
	end
end

if resourcecrops.has_moreores == false then
    resourcecrops.settings.crop_silver  = false
    resourcecrops.settings.crop_mithril = false
end
if resourcecrops.has_technic_ores == false then
    resourcecrops.settings.crop_brass        = false
    resourcecrops.settings.crop_cast_iron    = false
    resourcecrops.settings.crop_carbon_steel = false
    resourcecrops.settings.crop_chromium     = false
    resourcecrops.settings.crop_lead         = false
    resourcecrops.settings.crop_sulfur       = false
    resourcecrops.settings.crop_uranium      = false
    resourcecrops.settings.crop_zinc         = false
end
if resourcecrops.has_technic == false then
    resourcecrops.settings.crop_rubber = false
end
if resourcecrops.has_terumet == false then
    resourcecrops.settings.crop_terumet = false
end
if resourcecrops.has_xtraores == false then
    resourcecrops.settings.crop_nickel      = false
    resourcecrops.settings.crop_platinum    = false
    resourcecrops.settings.crop_palladium   = false
    resourcecrops.settings.crop_cobalt      = false
    resourcecrops.settings.crop_thorium     = false
    resourcecrops.settings.crop_antracite   = false
    resourcecrops.settings.crop_osmium      = false
    resourcecrops.settings.crop_rhenium     = false
    resourcecrops.settings.crop_vanadium    = false
    resourcecrops.settings.crop_rarium      = false
    resourcecrops.settings.crop_orichalcum  = false
    resourcecrops.settings.crop_titanium    = false
    resourcecrops.settings.crop_xores_uranium     = false
    resourcecrops.settings.crop_xores_chromium    = false
end
