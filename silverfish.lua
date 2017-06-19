--###################
--################### SILVERFISH
--###################

mobs:register_mob("mobs_mc:silverfish", {
	type = "monster",
	passive = false,
	group_attack = true,
	reach = 1,
	hp_min = 8,
	hp_max = 8,
	collisionbox = {-0.4, -0.01, -0.4, 0.4, 0.44, 0.4},
	rotate = -180,
	visual = "mesh",
	mesh = "silverfish.b3d",
	textures = {
		{"silverfish.png"},
	},
	pathfinding = 1,
	visual_size = {x=3, y=3},
	sounds = {},
	makes_footstep_sound = false,
	walk_velocity = 0.6,
	run_velocity = 2,
	jump = true,
	water_damage = 1,
	lava_damage = 4,
	light_damage = 0,
	fear_height = 4,
	animation = {
		speed_normal = 25,		speed_run = 50,
		stand_start = 0,		stand_end = 20,
		walk_start = 0,		walk_end = 20,
		run_start = 0,		run_end = 20,
	},
	view_range = 16,
	attack_type = "dogfight",
	damage = 1,
})

mobs:register_spawn("mobs_mc:silverfish",
	{"default:diorite"}, 20, 10, 15000, 2, 80, true)

mobs:register_egg("mobs_mc:silverfish", "Silverfish", "silverfish_inv.png", 0)

