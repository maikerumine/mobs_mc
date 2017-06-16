--MCmobs v0.4
--maikerumine
--made for MC like Survival game
--License for code WTFPL and otherwise stated in readmes


--dofile(minetest.get_modpath("mobs").."/api.lua")

--###################
--################### HORSE
--###################
--[[
mobs:register_mob("mobs_mc:52horse", {
	type = "animal",
	passive = true,
    runaway = true,
    stepheight = 1.2,
	hp_min = 30,
	hp_max = 60,
	armor = 150,
    collisionbox = {-0.35, -0.01, -0.35, 0.35, 2, 0.35},
    rotate = -180,
	visual = "mesh",
	mesh = "horse.b3d",
    textures = {{"horse.png"},{"horse1.png"},{"horse2.png"},{"horse3.png"},{"horse4.png"},{"horse5.png"},{"horse6.png"}},
	visual_size = {x=3, y=3},
	walk_velocity = 0.6,
	run_velocity = 2,
	jump = true,
	animation = {
		speed_normal = 25,		speed_run = 50,
		stand_start = 0,		stand_end = 0,
		walk_start = 0,		walk_end = 40,
		run_start = 0,		run_end = 40,
	},
})

mobs:register_egg("mobs_mc:52horse", "Horse", "horse_inv.png", 0)
]]


-- Horse
mobs:register_mob("mobs_mc:horse", {
	type = "animal",
	visual = "mesh",
	--visual_size = {x = 1.20, y = 1.20},
	--mesh = "mobs_horse.x",
	mesh = "horse.b3d",
	visual_size = {x=3, y=3},
	rotate = -180,
	collisionbox = {-0.4, -0.01, -0.4, 0.4, 1.25, 0.4},
	animation = {
		speed_normal = 25,		speed_run = 50,
		stand_start = 0,		stand_end = 0,
		walk_start = 0,		walk_end = 40,
		run_start = 0,		run_end = 40,
	},
	textures = {
		{"horse.png"},
		{"horse1.png"},
		{"horse2.png"},
		{"horse3.png"},
		{"horse4.png"},
		{"horse5.png"},
	},
	fear_height = 3,
	runaway = true,
	fly = false,
	walk_chance = 60,
	view_range = 16,
	follow = {"default:apple"},
	passive = true,
	hp_min = 15,
	hp_max = 30,
	lava_damage = 5,
	fall_damage = 5,
	water_damage = 1,
	makes_footstep_sound = true,
	drops = {
		{name = "mobs:leather",
		chance = 1,
		min = 0,
		max = 2,},
	},

	do_custom = function(self, dtime)

		-- set needed values if not already present
		if not self.v2 then
			self.v2 = 0
			self.max_speed_forward = 2  --swap due to -180 model
			self.max_speed_reverse = 7  --swap due to -180 model
			self.accel = 6
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
			minetest.add_item(pos, "mobs:saddle")
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
				if inv:room_for_item("main", "mobs:saddle") then
					inv:add_item("main", "mobs:saddle")
				else
					minetest.add_item(clicker.getpos(), "mobs:saddle")
				end

			-- attach player to horse
			elseif not self.driver
			and clicker:get_wielded_item():get_name() == "mobs:saddle" then

				self.object:set_properties({stepheight = 1.1})
				mobs.attach(self, clicker)

				-- take saddle from inventory
				inv:remove_item("main", "mobs:saddle")
			end
		end

		-- used to capture horse with magic lasso
		mobs:capture_mob(self, clicker, 0, 0, 80, false, nil)
	end
})


--===========================
--Spawn Function
mobs:register_spawn("mobs_mc:horse", {"default:dirt_with_dry_grass","es:strange_grass","es:aiden_grass", "default:desert_sand"}, 20, 12, 21000, 1, 12)


-- compatibility
mobs:alias_mob("mobs:horse", "mobs_mc:horse")
mobs:alias_mob("mobs_mc:horse1", "mobs_mc:horse")
mobs:alias_mob("mobs_mc:horse2", "mobs_mc:horse")
mobs:alias_mob("mobs_mc:horse3", "mobs_mc:horse")
mobs:alias_mob("mobs_mc:horse4", "mobs_mc:horse")
mobs:alias_mob("mobs_mc:horse5", "mobs_mc:horse")
mobs:alias_mob("mobs_mc:horse6", "mobs_mc:horse")

-- spawn eggs
mobs:register_egg("mobs_mc:horse", "Horse", "horse_inv.png", 0)


--bits and bobs

minetest.register_craftitem(":mobs:saddle", {
	description = "Saddle",
	inventory_image = "saddle.png",
})

minetest.register_craft({
	output = "mobs:saddle",
	recipe = {
		{"mobs:leather", "mobs:leather", "mobs:leather"},
		{"farming:string", "", "farming:string"},
	{"default:steel_ingot", "", "default:steel_ingot"}
	},
})


if minetest.settings:get_bool("log_mods") then
	minetest.log("action", "MC Horse loaded")
end
