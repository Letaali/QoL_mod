RegisterSpawnFunction( 0xffd6e900, "check_sun_rock" )
RegisterSpawnFunction( 0xff8400e9, "check_darksun_rock" )

function check_sun_rock(x, y)
	EntityLoad( "mods/QoL_mod/files/check_sun_rock.xml", x, y )
end

function check_darksun_rock(x, y)
	EntityLoad( "mods/QoL_mod/files/check_darksun_rock.xml", x, y )
end