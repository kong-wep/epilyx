--[[
   All Drills and Bits
]]

local WEAR_TABLE = {
   copper_drill = {},
}

-- Register Tools
local function default_drill(material_name,description)
 minetest.register_tool("epilyx_industry:"..material_name.."_drill", {
    description = description,
    inventory_image = material_name .."_drill.png",
    tool_capabilities = {
        full_punch_interval = 1.5,
        max_drop_level = 0,
        groupcaps = {
            crumbly = {
                maxlevel = 1,
                uses = 100,
                times = { [1]=2.00, [2]=0.50, [3]=0.30 }
            },
            cracky = {
                maxlevel = 1,
                uses = 1,
                times = { [1]=0.00, [2]=0.50, [3]=0.80 }
            },
        },
        damage_groups = {fleshy=2},
    },
})
minetest.register_alias(material_name.."_drill","epilyx_industry:"..material_name.."_drill")
end

default_drill("copper","Copper Drill")

local electric_drill = epilyx.power_tools:create("electric_drill","Electric Drill")

-- End Register Tools

-- Register Items
local function default_head(material_name,description)
minetest.register_craftitem("epilyx_industry:"..material_name.."_drill_head", {
   description = description,
   inventory_image = material_name.."_drill_head.png",
})
minetest.register_alias(material_name.."_drill_head","epilyx_industry:"..material_name.."_drill_head")
end

default_head("copper","Copper Drill Head")

default_head("tin","Tin Drill Head")

default_head("steel","Steel Drill Head")

default_head("obsidian","Obsidian Drill Head")

default_head("diamond","Diamond Drill Head")

default_head("electric","Electric Drill Head")
  
minetest.register_craftitem("epilyx_industry:drill_base", {
   description = "Drill Base",
   inventory_image = "drill_base.png",
})
minetest.register_alias("drill_base","epilyx_industry:drill_base")
-- End Register Items

-- Register Node

--
local drill_name = minetest.registered_aliases[itemname] or itemname
