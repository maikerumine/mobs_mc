-- v1.4

--###################
--################### GUARDIAN
--###################

mobs:register_mob("mobs_mc:guardian_elder", {
	type = "monster",
	hp_min = 80,
	hp_max = 80,
    	passive = false,
	attack_type = "dogfight",
	pathfinding = 1,
	view_range = 16,
	walk_velocity = 2,
	run_velocity = 4,
	damage = 8,
	collisionbox = {-0.99875, 0.5, -0.99875, 0.99875, 2.4975, 0.99875},
	visual = "mesh",
	mesh = "mobs_mc_guardian.b3d",
	textures = {
		{"mobs_mc_guardian_elder.png"},
	},
	visual_size = {x=7, y=7},
	sounds = {
		damage = "mobs_mc_squid_hurt",
		distance = 16,
	},
	animation = {
		stand_speed = 25, walk_speed = 25, run_speed = 50,
		stand_start = 0,		stand_end = 20,
		walk_start = 0,		walk_end = 20,
		run_start = 0,		run_end = 20,
	},
	drops = {
		-- TODO: Implement correct drops
		{name = mobs_mc.items.black_dye,
		chance = 1,
		min = 1,
		max = 3,},
	},
	fly = true,
	fly_in = mobs_mc.items.water_source,
	water_damage = 0,
	lava_damage = 4,
	light_damage = 0,
	view_range = 16,
	blood_amount = 0,
})

mobs:register_spawn("mobs_mc:guardian_elder", mobs_mc.spawn.water, minetest.LIGHT_MAX+1, 0, 5000, 2, -1000, true)

-- spawn eggs
mobs:register_egg("mobs_mc:guardian_elder", "Guardian Elder", "mobs_mc_spawn_icon_guardian_elder.png", 0)

