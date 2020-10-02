--[[
  Machines
]]
-- Form Specs
local function crusher_menu()
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
minetest.register_node("epilyx_industry:crusher", {
    description = "Crusher",
    tiles = {"crusher.png"},
    is_ground_content = false,
    groups = {metallic=3,cracky=1},
    after_place_node = function(pos, placer)
        local meta = minetest.get_meta(pos)
        meta:set_string("formspec",crusher_menu())
    end,
    on_receive_fields = function(pos, formname, fields, player)
        if fields.quit then
           epilyx.chat("a")
            return
        end
        print(fields.x)
    end
})
minetest.register_alias("crusher","epilyx_industry:crusher")
-- End Register Blocks
