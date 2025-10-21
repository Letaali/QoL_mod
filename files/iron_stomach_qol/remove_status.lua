
if(GameHasFlagRun("PERK_PICKED_IRON_STOMACH")) then
	return
else
	local player = EntityGetWithTag( "player_unit" )[1]
	EntityRemoveIngestionStatusEffect( player, "POLYMORPH_IRON")
	EntityRemoveIngestionStatusEffect( player, "POLYMORPH_RANDOM_IRON")
	EntityRemoveIngestionStatusEffect( player, "POLYMORPH_UNSTABLE_IRON")
	EntityRemoveIngestionStatusEffect( player, "MYRKKY")
end