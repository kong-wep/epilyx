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

-- Drills
dofile(modpath .. "/drill.lua")

-- Power Items
dofile(modpath .. "/power.lua")
