local colors = {
    {"white",      "White"},
    {"grey",       "Grey"},
    {"dark_grey",  "Dark Grey"},
    {"black",      "Black"},
    {"violet",     "Violet"},
    {"blue",       "Blue"},
    {"cyan",       "Cyan"},
    {"dark_green", "Dark Green"},
    {"green",      "Green"},
    {"yellow",     "Yellow"},
    {"brown",      "Brown"},
    {"orange",     "Orange"},
    {"red",        "Red"},
    {"magenta",    "Magenta"},
    {"pink",       "Pink"},
}

for _,name in ipairs(colors) do
    minetest.register_node("stainedglass:stained_glass_"..name[1], {
        description = name[2].." Stained Glass",
        tiles = {"stainedglass_"..name[1]..".png", "stainedglass_detail_"..name[1]..".png"},
        drawtype = "glasslike_framed_optional",
        use_texture_alpha = "blend",
        paramtype = "light",
        sunlight_propagates = true,
        is_ground_content = false,
        groups = {cracky = 3, oddly_breakable_by_hand = 3, stained_glass = 1},
        sounds = default.node_sound_glass_defaults(),
    })
    
    minetest.register_craft({
        output = "stainedglass:stained_glass_"..name[1],
        type = "shapeless",
        recipe = {"default:glass", "dye:"..name[1]},
    })
    
    minetest.register_craft({
        output = "stainedglass:stained_glass_"..name[1],
        type = "shapeless",
        recipe = {"group:stained_glass", "dye:"..name[1]},
    })
    
    xpanes.register_pane("pane_"..name[1], {
        description = name[2].." Stained Glass Pane",
        textures = {"stainedglass_"..name[1]..".png", "", "stainedglass_pane_edge_"..name[1]..".png"},
        inventory_image = "stainedglass_"..name[1]..".png",
        wield_image = "stainedglass_"..name[1]..".png",
        use_texture_alpha = "blend",
        sounds = default.node_sound_glass_defaults(),
        groups = {snappy=2, cracky=3, oddly_breakable_by_hand=3, stained_glass_pane=1},
        recipe = {
            {"stainedglass:stained_glass_"..name[1], "stainedglass:stained_glass_"..name[1], "stainedglass:stained_glass_"..name[1]},
            {"stainedglass:stained_glass_"..name[1], "stainedglass:stained_glass_"..name[1], "stainedglass:stained_glass_"..name[1]}
        }
    })
    
    minetest.register_craft({
        output = "xpanes:pane_"..name[1].."_flat",
        type = "shapeless",
        recipe = {"xpanes:pane_flat", "dye:"..name[1]},
    })
    
    minetest.register_craft({
        output = "xpanes:pane_"..name[1].."_flat",
        type = "shapeless",
        recipe = {"group:stained_glass_pane", "dye:"..name[1]},
    })
end
