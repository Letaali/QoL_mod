local frozen_vault_orb = 0xFFFFD102
local snowy_depth_orb = 0xFFFFD109
local wizard_den_orb = 0xFFFFD110
local sandcave_orb = 0xFFFFD104
local color_end_room = 0xFF50EED7
local color_boss_arena = 0xFF14EED7

BiomeMapSetPixel( 44, 43, color_end_room )

paint_biome_area( 35, 38, 5, 2, color_boss_arena )
BiomeMapSetPixel( 37, 40, color_boss_arena )
BiomeMapSetPixel( 38, 40, color_boss_arena )
BiomeMapSetPixel( 12, 19, frozen_vault_orb )
BiomeMapSetPixel( 14, 42, snowy_depth_orb )
BiomeMapSetPixel( 52, 45, wizard_den_orb )
BiomeMapSetPixel( 51, 19, sandcave_orb )

local world_state_entity = GameGetWorldStateEntity()
local comp = EntityGetComponent( world_state_entity, "WorldStateComponent" )

if ( comp ~= nil ) then
	orb_map_update()
end
