-- v1.4

--###################
--################### GUARDIAN
--###################

mobs:register_mob("mobs_mc:guardian", {
	type = "monster",
	hp_min = 30,
	hp_max = 30,
    	passive = false,
	attack_type = "dogfight",
	pathfinding = 1,
	view_range = 16,
	walk_velocity = 2,
	run_velocity = 4,
	damage = 6,
	collisionbox = {-0.425, 0.25, -0.425, 0.425, 1.1, 0.425},
	visual = "mesh",
	mesh = "mobs_mc_guardian.b3d",
	textures = {
		{"mobs_mc_guardian.png"},
	},
	visual_size = {x=3, y=3},
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
		-- TODO: Fix drops
		{name = mobs_mc.items.black_dye,
		chance = 1,
		min = 1,
		max = 3,},
	},
    rotate = 180,
	fly = 1,
	fly_in = mobs_mc.items.water_source,
	view_range = 8,
	water_damage = 0,
	lava_damage = 4,
	light_damage = 0,
})

mobs:register_spawn("mobs_mc:guardian", mobs_mc.spawn.water, minetest.LIGHT_MAX+1, 0, 5000, 2, -1000, true)

-- spawn eggs
mobs:register_egg("mobs_mc:guardian", "Guardian", "mobs_mc_spawn_icon_guardian.png", 0)
