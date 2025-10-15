player_hat", false )
local comp = EntityGetFirstComponent( player_id, "SpriteComponent", "lukki_disable")
if ( comp ~= nil ) then
  ComponentSetValue2( comp, "alpha", 1.0 )
end