dofile_once("data/scripts/lib/utilities.lua")

function material_area_checker_success( pos_x, pos_y )
    local entity_id = GetUpdatedEntityID()
    local sun = EntityGetInRadiusWithTag( pos_x, pos_y, 40, "sunrock" )
    local darksun = EntityGetInRadiusWithTag( pos_x, pos_y, 40, "darksunrock" )
    
    if(#sun > 0) or (#darksun > 0) then
        return
    else
        if( EntityHasTag( entity_id, "suncheck" )) then
            EntityAddTag(entity_id, "sunrock")
        elseif (EntityHasTag( entity_id, "darksuncheck" )) then
            EntityAddTag(entity_id, "darksunrock")
        end
    end
        
end