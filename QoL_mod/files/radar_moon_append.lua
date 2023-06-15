local min_distance = 16
local darkmoon_x= 9 + 256
local darkmoon_y= 37513 + 256
local multi = 1
local scaled_mag = 0

function get_indicators( target_x,target_y,dis )
	local dir_x = target_x - pos_x
	local dir_y = target_y - pos_y
	
	if(dis < 30) then
		scaled_mag = math.min(20000, math.max(512, get_magnitude(dir_x, dir_y)))
		multi = ((scaled_mag - 512)/(20000-512))+1
	else
		multi = 1
	end
	
	dir_x,dir_y = vec_normalize(dir_x,dir_y)
	local indi_x = pos_x + dir_x * math.min(indicator_distance, dis * multi)
	local indi_y = pos_y + dir_y * math.min(indicator_distance, dis * multi)


return indi_x, indi_y
end

--Indicators for new suns
for _,id in pairs(EntityGetWithTag("seed_e")) do
	local sun_x, sun_y = EntityGetTransform(id)
	local indicator_x, indicator_y = get_indicators(sun_x, sun_y, min_distance)

	GameCreateSpriteForXFrames( "mods/QoL_mod/files/radar_sun.png", indicator_x, indicator_y )
end
--Indicators for dark suns
for _,id in pairs(EntityGetWithTag("seed_f")) do
	local sun_x, sun_y = EntityGetTransform(id)
	local indicator_x, indicator_y = get_indicators(sun_x, sun_y, min_distance)

	GameCreateSpriteForXFrames( "mods/QoL_mod/files/radar_darksun.png", indicator_x, indicator_y )
end
--Indicator for dark moon

	local indicator_x, indicator_y = get_indicators(darkmoon_x, darkmoon_y, indicator_distance)
	GameCreateSpriteForXFrames( "mods/QoL_mod/files/radar_darkmoon.png", indicator_x, indicator_y )

