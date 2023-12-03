

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

--Ruby fix.

do
local fileContents = ModTextFileGetContent("data/entities/animals/boss_centipede/ending/sampo_start_ending_sequence.lua")
local pattern = "-- AddFlagPersistent( \"secret_amulet_gem\" )"
fileContents = string.gsub(fileContents, pattern, "AddFlagPersistent( \"secret_amulet_gem\" )")
ModTextFileSetContent("data/entities/animals/boss_centipede/ending/sampo_start_ending_sequence.lua", fileContents)
end

--Iron stomach qol
do 
--Append status effects for iron stomach
    local path = "data/scripts/status_effects/status_list.lua"
    ModTextFileSetContent(
        path,
        ModTextFileGetContent(path) .. ModTextFileGetContent("mods/QoL_mod/files/iron_stomach_qol/status_list_append.lua")
    )
	
	function replace(file, target, text)
		local content = ModTextFileGetContent(file)
		local first, last = content:find(target, 0, true)
		local before = content:sub(1, first - 1)
		local after = content:sub(last + 1)
		local new = before .. text .. after
		ModTextFileSetContent(file, new)
	end
	
	--Adding new ingestion effects into materials.xml
	local polypattern = "POLYMORPH\" amount=\"0.2\" />"
	local poly_add = "\n <StatusEffect type=\"POLYMORPH_IRON\" amount=\"0.2\" />"

	local polyrpattern = "POLYMORPH_RANDOM\" amount=\"0.2\" />"
	local polyr_add = "\n <StatusEffect type=\"POLYMORPH_RANDOM_IRON\" amount=\"0.2\" />"

	local polyupattern = "POLYMORPH_UNSTABLE\" amount=\"0.2\" />"
	local polyu_add = "\n <StatusEffect type=\"POLYMORPH_UNSTABLE_IRON\" amount=\"0.2\" />"

	local poisonpattern = "POISONED\" amount=\"(%d?%.%d+)\" />"
	local poison_add = "\n <StatusEffect type=\"POISONED_IRON\" amount=\"%1\" />"
	
	replace("data/materials.xml", polypattern, polypattern .. poly_add )
	replace("data/materials.xml", polyrpattern, polyrpattern .. polyr_add )
	replace("data/materials.xml", polyupattern, polyupattern .. polyu_add )
	
	local fileContents = ModTextFileGetContent("data/materials.xml")
	fileContents = string.gsub(fileContents, poisonpattern, poisonpattern .. poison_add)
	ModTextFileSetContent("data/materials.xml", fileContents)
end