--[[
   Power Items
]]
-- Form Specs
local function charger_menu()
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
    tiles = {"copper_drill.png"},
    is_ground_content = true,
    groups = {metallic=3},
    after_place_node = function(pos, placer)
        -- This function is run when the chest node is placed.
        -- The following code sets the formspec for chest.
        -- Meta is a way of storing data onto a node.

        local meta = minetest.get_meta(pos)
        meta:set_string("formspec",
                "formspec_version[3]" ..
                "size[5,5]" ..
                "label[1,1;This is shown on right click]" ..
                "field[1,2;2,1;x;x;]")
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

minetest.register_chatcommand("game", {
    func = function(name)
       minetest.show_formspec(name, "epilyx_industry", charger_menu())
    end
})
