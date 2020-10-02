--[[
   All Drills and Bits
]]
local function drill_no_power(itemstack, user, node, digparams)
   item_name = itemstack:get_name()
   if itemstack:get_wear()+digparams.wear <= 65535 then
      itemstack:add_wear(digparams.wear)
      return itemstack
   else

      itemstack:add_wear(65535-itemstack:get_wear())
      local tool_cap = itemstack:get_tool_capabilities()["groupcaps"]
      for k,grp in pairs(itemstack:get_tool_capabilities()["groupcaps"]) do
         tool_cap["times"] = {}
      end
      epilyx.chat("out of power")
      itemstack:get_meta():set_tool_capabilities(tool_cap)
      return itemstack
   end
end

local WEAR_TABLE = {
   copper_drill = {},
}


-- Register Tools
minetest.register_tool("epilyx_industry:copper_drill", {
    description = "Copper Drill",
    inventory_image = "copper_drill.png",
    tool_capabilities = {
        full_punch_interval = 1.5,
        max_drop_level = 0,
        groupcaps = {
            crumbly = {
                maxlevel = 1,
                uses = 10,
                times = { [1]=0.00, [2]=0.50, [3]=0.00 }
            },
            cracky = {
                maxlevel = 1,
                uses = 1,
                times = { [1]=0.00, [2]=0.50, [3]=0.00 }
            },
        },
        damage_groups = {fleshy=2},
    },
})
minetest.register_alias("copper_drill","epilyx_industry:copper_drill")


minetest.register_tool("epilyx_industry:electric_drill", {
    description = "Electric_drill",
    inventory_image = "copper_drill.png",
    tool_capabilities = {
        full_punch_interval = 1.5,
        max_drop_level = 0,
        groupcaps = {
            crumbly = {
                maxlevel = 1,
                uses = 10,
                times = { [1]=0.00, [2]=0.50, [3]=0.00 }
            },
            cracky = {
                maxlevel = 1,
                uses = 1,
                times = { [1]=0.00, [2]=0.50, [3]=0.00 }
            },
        },
        damage_groups = {fleshy=2},
    },
    after_use = drill_no_power
})
minetest.register_alias("electric_drill","epilyx_industry:electric_drill")
-- End Register Tools

-- Register Items
minetest.register_craftitem("epilyx_industry:copper_drill_head", {
    description = "Copper Drill Head",
    inventory_image = "copper_drill_head.png",
})
minetest.register_alias("copper_drill_head","epilyx_industry:copper_drill_head")

minetest.register_craftitem("epilyx_industry:electic_drill_head", {
    description = "Electric Drill Head",
    inventory_image = "electric_drill_head.png",
})
minetest.register_alias("electric_drill_head","epilyx_industry:electric_drill_head")
  
minetest.register_craftitem("epilyx_industry:drill_base", {
    description = "Drill Base",
    inventory_image = "drill_base.png",
})
minetest.register_alias("drill_base","epilyx_industry:drill_base")
-- End Register Items

-- Register Node

--
local drill_name = minetest.registered_aliases[itemname] or itemname
