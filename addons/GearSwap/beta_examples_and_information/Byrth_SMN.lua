function get_sets()
	-- Precast Sets
	sets['precast_Elemental Siphon'] = {main="Soulscourge",sub="Vox Grip",
		head="Marduk's Tiara +1",neck="Caller's Pendant",rear="Smn. Earring",
		body="Call. Doublet +2",hands="Smn. Bracers +2",lring="Evoker's Ring",rring="Fervor Ring",
		back="Conveyance Cape",legs="Mdk. Shalwar +1",feet="Caller's Pgch. +2"}
	
	sets['precast_Shock Squall'] = {main="Soulscourge",sub="Vox Grip",
		head="Marduk's Tiara +1",neck="Caller's Pendant",rear="Smn. Earring",
		body="Call. Doublet +2",hands="Smn. Bracers +2",lring="Evoker's Ring",rring="Fervor Ring",
		back="Tiresias' cape",legs="Smn. Spats +2",feet="Smn. Pigaches +2"}
	
	sets.precast_BP = {ammo="Eminent Sachet",hands="Smn. Bracers +2",back="Tiresias' cape",legs="Smn. Spats +2",feet="Smn. Pigaches +2"}
	
	sets['precast_Mana Cede'] = {hands="Call. Bracers +2"}
	
	sets.precast_FC = {head="Nahtirah Hat",neck="Orunmila's Torque",ear1="Loquac. Earring",body="Marduk's Jubbah +1",
		hands="Mdk. Dastanas +1",ring2="Prolix Ring",back="Swith Cape +1",waist="Siegel Sash",legs="Orvail Pants +1",
		feet="Chelona Boots +1"}
		
	sets.precast_Cur = {body="Heka's Kalasiris",legs="Nabu's Shalwar",back="Pahtli Cape"}
	
	sets.precast_FC_Thunder = {main='Apamajas I'}
	sets.precast_FC_Fire = {main='Atar I'}
	
	-- Midcast Sets
	sets.BP_Base = {main="Balsam Staff",sub="Vox grip",ammo="Eminent Sachet",
		head="Hagondes Hat",ear1="Gifted Earring",ear2="Smn. Earring",
		body="Call. Doublet +2",hands="Spurrina Gages",ring1="Evoker's Ring",ring2="Fervor Ring",
		legs="Ngen Seraweels",feet="Convoker's Pigaches"}
	
	sets.midcast_Phys_BP = set_combine(sets.BP_Base,{main="Soulscourge",head="Caller's horn +2",neck="Sacrifice torque",back="Conveyance Cape",waist="Mujin Obi"})
		
	sets.midcast_MAB_No_TP_BP = set_combine(sets.BP_Base,{neck="Eidolon Pendant",hands="Hagondes Cuffs",back="Tiresias' Cape",waist="Caller's sash",legs="Hagondes Pants",feet="Hagondes Sabots"})
		
	sets.midcast_MAB_TP_BP = set_combine(sets.BP_Base,{neck="Eidolon Pendant",hands="Hagondes Cuffs",back="Tiresias' Cape",waist="Caller's sash",legs="Caller's spats +2",feet="Hagondes Sabots"})
		
	sets.midcast_MAB_Spell = set_combine(sets.BP_Base,{neck="Eidolon Pendant",hands="Hagondes Cuffs",back="Tiresias' Cape",waist="Caller's sash",legs="Hagondes Pants",feet="Hagondes Sabots"})
		
	sets.midcast_MAcc_BP = set_combine(sets.BP_Base,{main="Yaskomo's Pole",neck="Caller's Pendant",body="Anhur Robe",hands="Smn. Bracers +2",back="Conveyance Cape",legs="Smn. spats +2",feet="Caller's Pgch. +2"})
	
	sets.midcast_Buff_BP = set_combine(sets.BP_Base,{head="Caller's Horn +2",neck="Caller's Pendant",hands="Smn. Bracers +2",back="Conveyance Cape",legs="Nares Trews"})
					
	sets.midcast_Cur = {main="Arka IV",head="Marduk's Tiara +1",ear2="Novia earring",
		body="Heka's Kalasiris"}
		
	sets.midcast_Stoneskin = {head="Marduk's Tiara +1",neck="Stone Gorget",body="Marduk's Jubbah +1",
		hands="Marduk's Dastanas +1",waist="Siegel Sash",legs="Shedir Seraweels"}
	
	
	--Aftercast Sets
	sets.aftercast_None = {main="Terra's Staff",sub="Oneiros Grip",
		head="Caller's Horn +2",neck="Twilight Torque",ear1="Loquac. Earring",ear2="Antivenom Earring",
		body="Marduk's Jubbah +1",hands="Marduk's Dastanas +1",ring1="Dark Ring",ring2="Defending Ring",
		back="Umbra Cape",waist="Hierarch belt",legs="Nares Trews",feet="Herald's Gaiters"}
	
	sets.aftercast_Favor = {main="Chatoyant Staff",sub="Vox grip",ammo="Eminent Sachet",
		head="Caller's Horn +2",neck="Caller's Pendant",ear1="Loquac. Earring",ear2="Antivenom Earring",
		body="Caller's Doublet +2",hands="Smn. Bracers +2",ring1="Evoker's Ring",ring2="Fervor Ring",
		back="Conveyance Cape",waist="Hierarch belt",legs="Ngen Seraweels",feet="Rubeus Boots"}
	
	sets.aftercast_Perp_Base = {main="Chatoyant Staff",sub="Oneiros Grip",ammo="Eminent Sachet",
		head="Caller's Horn +2",neck="Caller's Pendant",
		body="Caller's Doublet +2",hands="Adhara Gages",ring1="Evoker's Ring",ring2="Defending Ring",
		waist="Hierarch belt",legs="Nares Trews",feet="Caller's Pgch. +2"}
	
	sets.aftercast_Avatar_Carbuncle = {hands="Carbuncle Mitts"}
	
	sets.aftercast_Avatar_Diabolos = {waist="Diabolos's Rope"}
	
	sets.aftercast_Avatar_Spirit = {main="Soulscourge",sub="Vox grip",ammo="Eminent Sachet",
		head="Caller's Horn +2",neck="Caller's Pendant",ear2="Smn. Earring",
		body="Caller's Doublet +2",hands="Smn. Bracers +2",ring1="Evoker's Ring",ring2="Fervor Ring",
		back="Conveyance Cape",legs="Smn. spats +2",feet="Rubeus Boots"}
				
	sets.aftercast_Resting = {main="Numen Staff",sub="Ariesian Grip",ammo="Mana Ampulla",
		head="Caller's Horn +2",neck="Eidolon Pendant",ear1="Relaxing Earring",ear2="Antivenom Earring",
		body="Marduk's Jubbah +1",hands="Nares Cuffs",ring1="Celestial Ring",ring2="Angha Ring",
		back="Vita cape",waist="Austerity belt",legs="Nares Trews",feet="Oracle's Pigaches"}
	
	sets.aftercast_Idle = sets.aftercast_None	
	
	-- Variables and notes to myself
	Debuff_BPs = T{'Diamond Storm','Sleepga','Slowga','Tidal Roar','Shock Squall','Nightmare','Pavor Nocturnus','Ultimate Terror','Somnolence','Lunar Cry','Lunar Roar'}
	Magical_BPs_affected_by_TP = T{'Heavenly Strike','Wind Blade','Holy Mist','Night Terror','Thunderstorm','Geocrush','Meteor Strike','Grand Fall','Lunar Bay','Thunderspark'} -- Unsure if Thunderspark is affected by TP
	Magical_BPs_unaffected_by_TP = T{'Nether Blast','Aerial Blast','Searing Light','Diamond Dust','Earthen Fury','Zantetsuken','Tidal Wave','Judgment Bolt','Inferno','Howling Moon','Ruinous Omen','Flaming Crush'}
	Additional_effect_BPs = T{'Rock Throw'}	
	send_command('input /macro book 8;wait .1;input /macro set 1')
end

function precast(spell,action)
	if spell.name:sub(1,3) == 'Bar' then
		return
	end
	if tonumber(spell.casttime) > 5 then
		verify_equip()
	end
	if action.type == 'Magic' then
		equip(sets.precast_FC)
		if string.find(spell.english,'Cur') then
			equip(sets.precast_Cur)
		end
	elseif string.find(spell.type,'BloodPact') then
		if buffactive['Astral Conduit'] then
			midcast(spell,action)
		else
			equip(sets.precast_BP)
		end
	end
	
	if sets['precast_FC_'..tostring(spell.element)] then equip(sets['precast_FC_'..spell.element]) end
	if sets['precast_'..spell.english] then equip(sets['precast_'..spell.english]) end
end

function midcast(spell,action)
	if spell.name:sub(1,3) == 'Bar' then
		return
	end
	if string.find(spell.english,'Cur') then
		equip(sets.midcast_Cur)
	elseif spell.english=='Stoneskin' then
		equip(sets.midcast_Stoneskin)
	else -- Bloodpacts don't have a midcast, so don't worry about them.
		idle()
	end
end

function aftercast(spell,action)
	if spell.name and spell.name:sub(1,3) == 'Bar' then
		return
	end
	if not spell.type or not string.find(spell.type,'BloodPact') then
		-- Don't want to swap away too quickly if I'm about to put BP damage gear on
		-- Need to wait 1 in order to allow pet information to update on Release.
		send_command('@wait 1;gs c Idle')
	end
end

function status_change(new,action)
	if new=='Idle' then
		idle()
	elseif new=='Resting' then
		equip(sets['aftercast_Resting'])
	end
end

function pet_midcast(spell,action)
	if spell.name == 'Perfect Defense' then
		equip(sets['precast_Elemental Siphon'],{feet="Rubeus Boots"})
	elseif spell.type=='BloodPactWard' then
		if Debuff_BPs:contains(spell.name) then
			equip(sets.midcast_MAcc_BP)
		else
			equip(sets.midcast_Buff_BP)
		end
	elseif spell.type=='BloodPactRage' then
		if Magical_BPs_affected_by_TP:contains(spell.name) or string.find(spell.name,' II') or string.find(spell.name,' IV') then
			if (spell.name == 'Heavenly Strike' and pet.TP > 120) or pet.TP > 280 then
				equip(sets.midcast_MAB_No_TP_BP)
			else
				equip(sets.midcast_MAB_TP_BP)
			end
		elseif Magical_BPs_unaffected_by_TP:contains(spell.name) then
			equip(sets.midcast_MAB_No_TP_BP)
		elseif Additional_effect_BPs:contains(spell.name) then -- for BPs where the additional effect matters more than the damage
			equip(sets.midcast_MAcc_BP)
		else
			equip(sets.midcast_Phys_BP)
		end
	elseif spell.type=='BlackMagic' then
		equip(sets.midcast_MAB_Spell)
	end
end

function pet_aftercast(spell,action)
	idle()
end

function self_command(command)
	if command == 'Idle' then
		idle()
	end
end

function idle()
	equip(sets.aftercast_None)
	if pet.isvalid then
		if string.find(pet.name,'Spirit') then
			equip(sets.aftercast_Avatar_Spirit)
		elseif buffactive["Avatar's Favor"] then
			equip(sets.aftercast_Favor)
		else
			equip(sets.aftercast_Perp_Base)
			if sets['aftercast_Avatar_'..pet.name] then
				equip(sets['aftercast_Avatar_'..pet.name])
			end
		end
	end
end