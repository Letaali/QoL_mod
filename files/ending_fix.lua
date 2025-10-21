ending_sampo_spot_mountain" )

local underground = EntityGetClosestWithTag( x, y, "ending_sampo_spot_underground" )
local mountain = EntityGetClosestWithTag( x, y, "ending_sampo_spot_mountain" )

if(underground > 0) then
endpoint_underground[1] = underground
end
if(mountain > 0) then
endpoint_mountain[1] = mountain
end