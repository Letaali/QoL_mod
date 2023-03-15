
if (ModIsEnabled("nightmare")) then
    ModLuaFileAppend( "mods/nightmare/files/biome_map.lua", "mods/QoL_mod/files/biome_map_append.lua")
end

--Copy three fix

ModLuaFileAppend( "data/scripts/gun/gun_actions.lua", "mods/QoL_mod/files/gun_actions_append.lua")

--Sun Crystal fix

ModLuaFileAppend( "data/scripts/biomes/mountain/mountain_floating_island.lua", "mods/QoL_mod/files/mountain_floating_island_append.lua")
