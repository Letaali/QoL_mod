
if(ModIsEnabled("QoL_mod")) then
	local already_there = EntityGetInRadiusWithTag( x, y, 40, "darksuncheck" )
if(not (#already_there > 0)) then
	EntityLoad( "mods/QoL_mod/files/sun_rock_fix/check_sun_rock.xml", x+10, y )
	EntityLoad( "mods/QoL_mod/files/sun_rock_fix/check_darksun_rock.xml", x-10, y )
end
end