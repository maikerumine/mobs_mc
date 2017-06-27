--MCmobs v0.4
--maikerumine
--made for MC like Survival game
--License for code WTFPL and otherwise stated in readmes


--dofile(minetest.get_modpath("mobs").."/api.lua")


--###################
--################### LLAMA
--###################


mobs:register_mob("mobs_mc:llama", {
	type = "animal",
	hp_min = 15,
	hp_max = 30,
	passive = false,
	collisionbox = {-0.45, -0.01, -0.45, 0.45, 1.86, 0.45},
	rotate = -180,
	visual = "mesh",
	mesh = "mobs_mc_llama.b3d",
    textures = {{"llama.png"},{"llama1.png"},{"llama2.png"},{"llama3.png"},{"llama4.png"}},
	visual_size = {x=2.4, y=2.4},
	makes_footstep_sound = true,
	runaway = true,
	walk_velocity = 1,
	run_velocity = 4.4,
	floats = 1,
	drops = {
		{name = mobs_mc.items.leather,
		chance = 1,
		min = 0,
		max = 2,},
	},
	drawtype = "front",
	water_damage = 0,
	lava_damage = 4,
	light_damage = 0,
	fear_height = 4,
	sounds = {
		random = "mobs_sheep",
		death = "mobs_sheep",
		damage = "mobs_sheep",
		distance = 16,
	},
	animation = {
		speed_normal = 24,
		stand_start = 0,
		stand_end = 0,
		walk_start = 0,
		walk_end = 40,
		hurt_start = 118,
		hurt_end = 154,
		death_start = 154,
		death_end = 179,
		eat_start = 49,
		eat_end = 78,
		look_start = 78,
		look_end = 108,
	},
	follow = mobs_mc.items.horse,
	view_range = 16,
	do_custom = function(self, dtime)

		-- set needed values if not already present
		if not self.v2 then
			self.v2 = 0
			self.max_speed_forward = 2  --swap due to -180 model
			self.max_speed_reverse = 4  --swap due to -180 model
			self.accel = 4
			self.terrain_type = 3
			self.driver_attach_at = {x = 0, y = 7.5, z = 0}
			self.player_rotation = {x = 0, y = 180, z = 0}
			self.driver_eye_offset = {x = 0, y = 3, z = 0}
			self.driver_scale = {x = 0.3, y = 0.3}
		end

		-- if driver present allow control of horse
		if self.driver then

			mobs.drive(self, "walk", "stand", false, dtime)

			return false -- skip rest of mob functions
		end

		return true
	end,

	on_die = function(self, pos)

		-- drop saddle when horse is killed while riding
		-- also detach from horse properly
		if self.driver then
			minetest.add_item(pos, mobs_mc.items.saddle)
			mobs.detach(self.driver, {x = 1, y = 0, z = 1})
		end

	end,

	on_rightclick = function(self, clicker)

		-- make sure player is clicking
		if not clicker or not clicker:is_player() then
			return
		end

		-- feed, tame or heal horse
		if mobs:feed_tame(self, clicker, 10, true, true) then
			return
		end

		-- make sure tamed horse is being clicked by owner only
		if self.tamed and self.owner == clicker:get_player_name() then

			local inv = clicker:get_inventory()

			-- detatch player already riding horse
			if self.driver and clicker == self.driver then

				mobs.detach(clicker, {x = 1, y = 0, z = 1})

				-- add saddle back to inventory
				if inv:room_for_item("main", mobs_mc.items.saddle) then
					inv:add_item("main", mobs_mc.items.saddle)
				else
					minetest.add_item(clicker.getpos(), mobs_mc.items.saddle)
				end

			-- attach player to horse
			elseif not self.driver
			and clicker:get_wielded_item():get_name() == mobs_mc.items.saddle then

				self.object:set_properties({stepheight = 1.1})
				mobs.attach(self, clicker)

				-- take saddle from inventory
				inv:remove_item("main", mobs_mc.items.saddle)
			end
		end

		-- used to capture horse with magic lasso
		mobs:capture_mob(self, clicker, 0, 0, 80, false, nil)
	end

})

--spawn
mobs:register_spawn("mobs_mc:llama", mobs_mc.spawn.savanna, minetest.LIGHT_MAX+1, 0, 15000, 1, 40)

-- spawn eggs
mobs:register_egg("mobs_mc:llama", "Llama", "llama_inv.png", 0)

if minetest.settings:get_bool("log_mods") then
	minetest.log("action", "MC Llama loaded")
end
