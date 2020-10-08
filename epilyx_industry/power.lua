--[[
   Power Items
]]

-- Form Specs
local function charger_menu()
   local text = "hello world"
   local formspec = {
      "formspec_version[3]",
      "size[10.25,8.5]",
      "list[context;input;0,0;2,2]",
      "list[current_player;main;0.25,3.5;8,4]",
      "listring[]"
   }
   return table.concat(formspec, "")
end

local function boiler_menu()
   local text = "hello world"
   local formspec = {
      "formspec_version[3]",
      "size[6,3.476]",
      "label[0.375,0.5;", minetest.formspec_escape(text), "]",
      "field[0.375,1.25;5.25,0.8;number;Number;]",
      "button[1.5,2.3;3,0.8;guess;Guess]"
   }
   return table.concat(formspec, "")
end
--

-- Register Blocks
minetest.register_node("epilyx_industry:charger",{
   description = "Charger",
   tiles = {"charger.png"},
   is_ground_content = false,
   groups = {metallic=3,cracky=1},
   after_place_node = function(pos, placer)
      local meta = minetest.get_meta(pos)
      meta:set_string("formspec",charger_menu())
      local inv = meta:get_inventory()
      inv:set_size('input',1)
      minetest.get_node_timer(pos):start(1)
   end,
   on_receive_fields = function(pos, formname, fields, player)
   end,
   on_timer = function(pos,elapsed)
      -- Charge
      local stack = minetest.get_inventory({type="node",pos=pos}):get_stack("input",1)
      local name = stack:get_name()
      if minetest.get_item_group(name, "epilyx_chargable") == 1 then
         local tool_cap = epilyx.power_tools.types[name].tool_capabilities
         local w = -3276
         stack:get_meta():set_tool_capabilities(tool_cap)
         stack:add_wear(w)
         minetest.get_meta(pos):get_inventory():set_stack("input",1,stack)
      end
      return true
   end
})
minetest.register_alias("charger","epilyx_industry:charger")

minetest.register_node("epilyx_industry:boiler",{
   description = "Boiler",
   tiles = {"charger.png"},
   is_ground_content = false,
   groups = {metallic=3,cracky=1},
   after_place_node = function(pos, placer)
      local meta = minetest.get_meta(pos)
      meta:set_string("formspec",boiler_menu())
   end,
   on_receive_fields = function(pos, formname, fields, player)
      if fields.quit then
         epilyx.chat("a")
         return
      end

      print(fields.x)
   end
})
minetest.register_alias("boiler","epilyx_industry:boiler")
-- End Register Blocks

