
local status_effects_appends = 	
	{
	{
		id="POLYMORPH_IRON",
		ui_name="Polymorphn't",
		ui_description="Polymorphine doesn't bother you.",
		ui_icon="mods/qol_mod/files/iron_stomach_qol/iron_poly.png",
		effect_entity="mods/qol_mod/files/iron_stomach_qol/iron_stomach_check.xml",
		is_harmful=false,
	},
	
	{
		id="POLYMORPH_RANDOM_IRON",
		ui_name="Random Polymorphn't",
		ui_description="Random Polymorphine doesn't bother you.",
		ui_icon="mods/qol_mod/files/iron_stomach_qol/iron_polychaos.png",
		effect_entity="mods/QoL_mod/files/iron_stomach_qol/iron_stomach_check.xml",
		is_harmful=false,
	},
		
	{
		id="POLYMORPH_UNSTABLE_IRON",
		ui_name="Unstable Polymorphn't",
		ui_description="Unstable Polymorphine doesn't bother you.",
		ui_icon="mods/qol_mod/files/iron_stomach_qol/iron_polyunstable.png",
		effect_entity="mods/QoL_mod/files/iron_stomach_qol/iron_stomach_check.xml",
		is_harmful=false,
	},
	
	{
		id="IRON_POISON",
		ui_name="Poison stain immunity",
		ui_description="Poison stains won't hurt you.",
		ui_icon= "mods/qol_mod/files/iron_stomach_qol/iron_poison.png",
		effect_entity="mods/QoL_mod/files/iron_stomach_qol/iron_stomach_check.xml",
		is_harmful=false,
	},
	}


for k=1,#status_effects_appends do 
	local v = status_effects_appends[k]
	table.insert(status_effects,v)
end

	