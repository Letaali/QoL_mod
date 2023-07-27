

--Copy three fix

ModLuaFileAppend( "data/scripts/gun/gun_actions.lua", "mods/QoL_mod/files/gun_actions_append.lua")

--Sun Crystal fix

ModLuaFileAppend( "data/scripts/biomes/mountain/mountain_floating_island.lua", "mods/QoL_mod/files/mountain_floating_island_append.lua")

--Healderdrone fix

do
local fileContents = ModTextFileGetContent("data/scripts/biomes/snowcastle.lua")
local pattern = "healderdrone"
fileContents = string.gsub(fileContents, pattern, "healerdrone")
ModTextFileSetContent("data/scripts/biomes/snowcastle.lua", fileContents)
end

--Related perk fix

do
local fileContents = ModTextFileGetContent("data/scripts/perks/perk.lua")
local pattern = "GameAddFlagRun%( f %)"
fileContents = string.gsub(fileContents, pattern,'GameAddFlagRun%( f %) \n local pickup_count = tonumber%( GlobalsGetValue%( f %.%. "_PICKUP_COUNT", "0" %) %) \n pickup_count = pickup_count %+ 1 \n GlobalsSetValue%( f %.%. "_PICKUP_COUNT", tostring%( pickup_count %) %)')
ModTextFileSetContent("data/scripts/perks/perk.lua", fileContents)
end

--Moon radar QoL

do -- Append Moon radar perk
    local path = "data/scripts/perks/radar_moon.lua"
    ModTextFileSetContent(
        path,
        ModTextFileGetContent(path) .. ModTextFileGetContent("mods/QoL_mod/files/radar_moon_append.lua")
    )
end

--Limit max gold drop for performance reasons.

do
  local path = "data/scripts/items/drop_money.lua"
  local content = ModTextFileGetContent(path)
  content = content:gsub("local x, y = EntityGetTransform( entity )", "if money > 400050 then money = 400050 end local x, y = EntityGetTransform( entity )")
  ModTextFileSetContent(path, content)
end
