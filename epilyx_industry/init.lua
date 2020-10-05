--[[

  Minetest Epilyx Mechamata
 by toftpokk & tokkpython

]]

epilyx = rawget(_G, "epilyx") or {}
epilyx.industry = {}
local modpath = minetest.get_modpath("epilyx_industry")

-- debug_tools
function epilyx.chat(text)
   minetest.chat_send_all(tostring(text))
end
--

-- Power tools
local function power_use(itemstack, user, node, digparams)
   local item_name = itemstack:get_name()
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

epilyx.power_tools = {}
epilyx.power_tools.__index = epilyx.power_tools
epilyx.power_tools.types = {}
function epilyx.power_tools:create(name,description)
   local power_tool = {}
   setmetatable(power_tool,epilyx.power_tools)
   self.tool_capabilities = {
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
   }
   epilyx.power_tools:register(name,description,self.tool_capabilities)
   epilyx.power_tools.types[name] = power_tool
   return power_tool
end


function epilyx.power_tools:register(material_name,description,cap)
 minetest.register_tool("epilyx_industry:"..material_name, {
    description = description,
    inventory_image = material_name .. ".png",
    tool_capabilities = cap,
    after_use = power_use,
    groups = {epilyx_chargable= 1},
    _a = "c"
})
minetest.register_alias(material_name,"epilyx_industry:"..material_name)
end


--

-- Drills
dofile(modpath .. "/drill.lua")

-- Power Items
dofile(modpath .. "/power.lua")

-- Machines
dofile(modpath .. "/machine.lua")
