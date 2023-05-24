local index = 1
local notfound = true
while(actions[index] ~= nil) and (notfound) do
    if(actions[index].id == "DRAW_3_RANDOM") then
        actions[index].action = function( recursion_level, iteration )
			SetRandomSeed( GameGetFrameNum() + #deck, GameGetFrameNum() - 325 + #discarded )
			local datasize = #deck + #discarded
            
            local randomSpells = {}
            local rec = {}
			
			for i=1,3 do
				local rnd = Random( 1, datasize )
				
				local data = {}
				
				if ( rnd <= #deck ) then
					data = deck[rnd]
				else
					data = discarded[rnd - #deck]
				end
				
				local checks = 0
				rec[i] = check_recursion( data, recursion_level )
				
				while ( data ~= nil ) and ( ( rec[i] == -1 ) or ( ( data.uses_remaining ~= nil ) and ( data.uses_remaining == 0 ) ) ) and ( checks < datasize ) do
					rnd = ( rnd % datasize ) + 1
					checks = checks + 1
					
					if ( rnd <= #deck ) then
						data = deck[rnd]
					else
						data = discarded[rnd - #deck]
					end
					
					rec[i] = check_recursion( data, recursion_level )
				end
				
				if ( data ~= nil ) and ( rec[i] > -1 ) and ( ( data.uses_remaining == nil ) or ( data.uses_remaining ~= 0 ) ) then
                        
                        randomSpells[i] = data
					
					if ( data.uses_remaining ~= nil ) and ( data.uses_remaining > 0 ) then
						data.uses_remaining = data.uses_remaining - 1
						
						local reduce_uses = ActionUsesRemainingChanged( data.inventoryitem_id, data.uses_remaining )
						if not reduce_uses then
							data.uses_remaining = data.uses_remaining + 1 -- cancel the reduction
						end
					end
				end
			end
        
            for i=1,3 do
                if ( randomSpells[i] ~= nil ) and ( rec[i] > -1 ) then
                    randomSpells[i].action( rec[i] )
                end
            end
		end
        notfound = false
    end
        index = index + 1;
    end