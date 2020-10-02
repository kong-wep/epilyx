--[[
   Power Items
]]
-- Form Specs
local function charger_menu()
   local text = "Charger"
   local formspec = {
        "formspec_version[3]",
        "size[10,7]",
        "label[0.375,0.5;", minetest.formspec_escape(text), "]",
        "list[context;main;0.1,1;1,1;]",
        "list[current_player;main;0.15,3;8,4;]"
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
    end,
    on_receive_fields = function(pos, formname, fields, player)
        if fields.quit then
           epilyx.chat("a")
            return
        end

        print(fields.x)
    end
})
minetest.register_alias("charger","epilyx_industry:charger")
-- End Register Blocks

