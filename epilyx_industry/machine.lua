--[[
  Machines
]]
-- Form Specs
local function crusher_menu()
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
--

-- Register Blocks
minetest.register_node("epilyx_industry:crusher", {
    description = "Crusher",
    tiles = {"crusher.png"},
    is_ground_content = false,
    groups = {metallic=3,cracky=1},
    after_place_node = function(pos, placer)
        local meta = minetest.get_meta(pos)
        meta:set_string("formspec",crusher_menu())
        local inv = meta:get_inventory()
        inv:set_size('input',2)
    end,
    on_receive_fields = function(pos, formname, fields, player)
        if fields.quit then
           epilyx.chat("a")
            return
        end
        epilyx.chat(fields.number)
    end
})
minetest.register_alias("crusher","epilyx_industry:crusher")
-- End Register Blocks
