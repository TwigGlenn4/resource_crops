#!/usr/bin/python3

# build resource crops from hex colors or old essence textures.

from PIL import Image, ImageColor
from os import path

template_crop_1 = "textures/resource_crops_template_1.png"
template_crop_2 = "textures/resource_crops_template_2.png"
template_crop_3 = "textures/resource_crops_template_3.png"
template_crop_4 = "textures/resource_crops_template_4.png"
template_seed = "textures/resource_crops_template_seed.png"
template_essence = "textures/resource_crops_template.png"

template_color_border = "#000000"
template_color_light  = "#C0C0C0"
template_color_dark   = "#808080"


# convert template hex to imagecolor
template_color_border = ImageColor.getcolor(template_color_border, "RGBA")
template_color_light = ImageColor.getcolor(template_color_light, "RGBA")
template_color_dark = ImageColor.getcolor(template_color_dark, "RGBA")


def get_source_colors( source_name ):
  source_essence = "textures_old/resource_crops_"+source_name+"_essence.png"
  if not path.exists(source_essence):
    print("WARNING: Skipping "+source_name+" - Could not find source essence at "+source_essence)
    return False

  source_image = Image.open(source_essence, 'r')
  source_data = source_image.load()

  colors = { "border": source_data[4, 0],
             "light":  source_data[4, 7],
             "dark":   source_data[4, 3]}
  
  source_image.close()
  return colors


def replace_color( pixdata, size, to_replace, replace_with):
  for y in range(size):
    for x in range(size):
        if pixdata[x, y] == to_replace:
            pixdata[x, y] = replace_with
  return pixdata


def recolor_template( template_path, colors, name ):
  template = Image.open(template_path, 'r')
  pixdata = template.load()

  pixdata = replace_color(pixdata, template.size[0], template_color_border, colors["border"])
  pixdata = replace_color(pixdata, template.size[0], template_color_light, colors["light"])
  pixdata = replace_color(pixdata, template.size[0], template_color_dark, colors["dark"])

  template.save(template_path.replace("template", name))
  template.close()


def build_textures( name, colors=None ):
  print("Building textures for: "+name)

  if colors == None: # get source colors. 
      colors = get_source_colors(name)
      if colors == False:
        return
  else: 
    if not ("border" in colors  and  "light" in colors  and  "dark" in colors) :
      print("WARNING: Skipping "+name+" - missing colors.")
      return
    colors["border"] = ImageColor.getcolor(colors["border"], "RGBA")
    colors["light"] = ImageColor.getcolor(colors["light"], "RGBA")
    colors["dark"] = ImageColor.getcolor(colors["dark"], "RGBA")

  recolor_template(template_seed, colors, name)
  name = name+"_essence"
  recolor_template(template_essence, colors, name)
  recolor_template(template_crop_1, colors, name)
  recolor_template(template_crop_2, colors, name)
  recolor_template(template_crop_3, colors, name)
  recolor_template(template_crop_4, colors, name)
  

# default
# build_textures("coal", { "border": "#4D4D4D", "light":  "#A1A1A1", "dark": "#626262"})
# build_textures("tin")
# build_textures("copper")
# build_textures("iron")
# build_textures("gold")
# build_textures("diamond")
# build_textures("mese")

# elements
# build_textures("earth")
# build_textures("nature")
# build_textures("water")
# build_textures("fire")

# moreores
# build_textures("silver")
# build_textures("mithril")

# technic
# build_textures("brass")
# build_textures("cast_iron")
# build_textures("carbon_steel")
# build_textures("chromium")
# build_textures("lead")
# build_textures("sulfur")
# build_textures("uranium")
# build_textures("zinc")
# build_textures("rubber")

# terumet
# build_textures("terumetal")

# xtraores
# build_textures("nickel")
# build_textures("platinum")
# build_textures("palladium")
# build_textures("cobalt")
# build_textures("thorium")
# build_textures("antracite")
# build_textures("osmium")
# build_textures("rhenium")
# build_textures("vanadium")
# build_textures("rarium")
# build_textures("orichalcum")
# build_textures("titanium")

# xtraores technic conflicts
# build_textures("xores_uranium")
# build_textures("xores_chromium")