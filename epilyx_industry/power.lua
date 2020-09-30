--[[
   Power Items
]]
local MODNAME = "epilyx_industry"
local MODFORMAT = MODNAME .. ":"
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
minetest.register_node(MODFORMAT .. "charger",{
    description = "Charger",
    tiles = {"copper_drill.png"},
    is_ground_content = true,
    groups = {metallic=3},
})

minetest.register_alias("charger",MODFORMAT .."charger")

--
minetest.register_chatcommand("game", {
    func = function(name)
       minetest.show_formspec(name, MODNAME, charger_menu())
    end
})
