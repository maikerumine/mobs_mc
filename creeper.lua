--License for code WTFPL and otherwise stated in readmes



--dofile(minetest.get_modpath("mobs").."/api.lua")


--###################
--################### CREEPER
--###################




mobs:register_mob("mobs_mc:creeper", {
	type = "monster",
	hp_min = 20,
	hp_max = 20,
	collisionbox = {-0.3, -0.01, -0.3, 0.3, 1.69, 0.3},
	pathfinding = 1,
	visual = "mesh",
	mesh = "mobs_mc_creeper.b3d",
	textures = {
		{"mobs_mc_creeper.png"},
	},
	visual_size = {x=3, y=3},
	sounds = {
		attack = "tnt_ignite",
		death = "Creeperdeath", -- TODO: Replace
		damage = "Creeper4", -- TODO: Replce
		war_cry = "tnt_ignite",
		explode = "tnt_explode",
	},
	makes_footstep_sound = true,
	walk_velocity = 1.5,
	run_velocity = 3,
	attack_type = "explode",
	
	explosion_radius = 3,
	-- TODO: Disable Mobs Redo fire

	-- Force-ignite creeper with flint and steel and explode after 1.5 seconds.
	-- TODO: Make creeper flash after doing this as well.
	-- TODO: Test and debug this code.
	on_rightclick = function(self, clicker)
		if self._forced_explosion_countdown_timer ~= nil then
			return
		end
		local item = clicker:get_wielded_item()
		if item:get_name() == mobs_mc.items.flint_and_steel then
			if not minetest.settings:get_bool("creative_mode") then
				-- Wear tool
				local wdef = item:get_definition()
				item:add_wear(1000)
				-- Tool break sound
				if itemstack:get_count() == 0 and wdef.sound and wdef.sound.breaks then
					minetest.sound_play(wdef.sound.breaks, {pos = pt.above, gain = 0.5})
				end
				clicker:set_wielded_item(item)
			end
			self._forced_explosion_countdown_timer = 1.5
			minetest.sound_play(self.sounds.attack, {pos = self.object:getpos(), gain = 1, max_hear_distance = 16})
		end
	end,
	do_custom = function(self, dtime)
		if self._forced_explosion_countdown_timer ~= nil then
			self._forced_explosion_countdown_timer = self._forced_explosion_countdown_timer - dtime
			if self._forced_explosion_countdown_timer <= 0 then
				mobs:explosion(self.object:getpos(), self.explosion_radius, 0, 1, self.sounds.explode)
				self.object:remove()
			end
		end
	end,
	maxdrops = 2,
	drops = {
		{name = mobs_mc.items.gunpowder,
		chance = 1,
		min = 0,
		max = 2,},

		-- FIXME: Music disc drops
		--[[
		{name = "jdukebox:disc_1",
		chance = 30,
		min = 0,
		max = 1,},
		{name = "jdukebox:disc_2",
		chance = 30,
		min = 0,
		max = 1,},
		{name = "jdukebox:disc_3",
		chance = 30,
		min = 0,
		max = 1,},
		{name = "jdukebox:disc_4",
		chance = 30,
		min = 0,
		max = 1,},
		{name = "jdukebox:disc_5",
		chance = 30,
		min = 0,
		max = 1,},
		{name = "jdukebox:disc_6",
		chance = 30,
		min = 0,
		max = 1,},
		]]
		{name = "mcl_jukebox:record_1",
		chance = 1600,
		min = 1,
		max = 1,},
		{name = "mcl_jukebox:record_2",
		chance = 1600,
		min = 1,
		max = 1,},
		{name = "mcl_jukebox:record_3",
		chance = 1600,
		min = 1,
		max = 1,},
		{name = "mcl_jukebox:record_4",
		chance = 1600,
		min = 1,
		max = 1,},
		{name = "mcl_jukebox:record_5",
		chance = 1600,
		min = 1,
		max = 1,},
		{name = "mcl_jukebox:record_6",
		chance = 1600,
		min = 1,
		max = 1,},
		{name = "mcl_jukebox:record_7",
		chance = 1600,
		min = 1,
		max = 1,},
		{name = "mcl_jukebox:record_8",
		chance = 1600,
		min = 1,
		max = 1,},
		{name = "mobs_mc:creeper_head",
		chance = 200,
		min = 1,
		max = 1,},
	},
	animation = {
		speed_normal = 24,
		speed_run = 48,
		stand_start = 0,
		stand_end = 23,
		walk_start = 24,
		walk_end = 49,
		run_start = 24,
		run_end = 49,
		hurt_start = 110,
		hurt_end = 139,
		death_start = 140,
		death_end = 189,
		look_start = 50,
		look_end = 108,
	},
	drawtype = "front",
	floats = 1,
	water_damage = 1,
	lava_damage = 5,
	light_damage = 0,
	view_range = 16,
})


mobs:spawn_specific("mobs_mc:creeper", mobs_mc.spawn.solid, {"air"},0, 7, 20, 6500, 1, -310, 31000)

-- compatibility
mobs:alias_mob("mobs:creeper", "mobs_mc:creeper")

-- spawn eggs
mobs:register_egg("mobs_mc:creeper", "Creeper", "mobs_mc_spawn_icon_creeper.png", 0)

if minetest.settings:get_bool("log_mods") then
	minetest.log("action", "MC Creeper loaded")
end
