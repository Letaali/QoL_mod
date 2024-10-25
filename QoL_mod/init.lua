

--Copy three fix

ModLuaFileAppend( "data/scripts/gun/gun_actions.lua", "mods/QoL_mod/files/gun_actions_append.lua")

--Sun Crystal fix

do 
    local path = "data/scripts/magic/altar_tablet_magic.lua"
    ModTextFileSetContent(
        path,
        ModTextFileGetContent(path) .. ModTextFileGetContent("mods/QoL_mod/files/sun_rock_fix/altar_tablet_magic_append.lua")
    )
end

-- Lukki transformation removal fix

do
local fileContents = ModTextFileGetContent("data/scripts/perks/perk.lua")
local pattern = "player_hat\", false %)"
fileContents = string.gsub(fileContents, pattern, ModTextFileGetContent("mods/QoL_mod/files/lukki_removal_fix.lua"))
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

--Ruby fix.

do
local fileContents = ModTextFileGetContent("data/entities/animals/boss_centipede/ending/sampo_start_ending_sequence.lua")
local pattern = "-- AddFlagPersistent( \"secret_amulet_gem\" )"
fileContents = string.gsub(fileContents, pattern, "AddFlagPersistent( \"secret_amulet_gem\" )")
ModTextFileSetContent("data/entities/animals/boss_centipede/ending/sampo_start_ending_sequence.lua", fileContents)
end

--Spells to Power fix

do
local fileContents = ModTextFileGetContent("data/scripts/projectiles/spells_to_power.lua")
local pattern = "count %+ expcount"
fileContents = string.gsub(fileContents, pattern, "math%.max%(0%.001, count %+ expcount%)")
ModTextFileSetContent("data/scripts/projectiles/spells_to_power.lua", fileContents)
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
	local poison_add = "\n <StatusEffect type=\"MYRKKY\" amount=\"%1\" />"
	
	replace("data/materials.xml", polypattern, polypattern .. poly_add )
	replace("data/materials.xml", polyrpattern, polyrpattern .. polyr_add )
	replace("data/materials.xml", polyupattern, polyupattern .. polyu_add )
	
	local fileContents = ModTextFileGetContent("data/materials.xml")
	fileContents = string.gsub(fileContents, poisonpattern, "POISONED\" amount=\"%1\" />" .. poison_add)
	ModTextFileSetContent("data/materials.xml", fileContents)
end