
--###################
--################### SILVERFISH
--###################
--[[
mobs:register_mob("mobs_mc:25silverfish", {
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
	mesh = "silverfish.b3d",
	textures = {
		{"silverfish.png"},
	},
	visual_size = {x=3, y=3},
	walk_velocity = 0.6,
	run_velocity = 2,
	jump = true,
	animation = {
		speed_normal = 25,		speed_run = 50,
		stand_start = 0,		stand_end = 20,
		walk_start = 0,		walk_end = 20,
		run_start = 0,		run_end = 20,
	},
})

mobs:register_egg("mobs_mc:25silverfish", "Silverfish", "silverfish_inv.png", 0)
]]
-- Bunny by ExeterDad

mobs:register_mob("mobs_mc:silverfish", {
	type = "monster",
	passive = false,
	reach = 1,
	hp_min = 10,
	hp_max = 40,
	armor = 120,
	collisionbox = {-0.2, -0.01, -0.2, 0.2, 0.3, 0.2},
    rotate = -180,
	visual = "mesh",
	mesh = "silverfish.b3d",
	textures = {
		{"silverfish.png"},
	},
	visual_size = {x=3, y=3},
	sounds = {},
	makes_footstep_sound = false,
	walk_velocity = 0.6,
	run_velocity = 2,
	runaway = true,
	jump = true,
	drops = {
		{name = "mobs:meat_raw", chance = 1, min = 1, max = 1},
	},
	water_damage = 1,
	lava_damage = 4,
	light_damage = 0,
	fear_height = 2,
	animation = {
		speed_normal = 25,		speed_run = 50,
		stand_start = 0,		stand_end = 20,
		walk_start = 0,		walk_end = 20,
		run_start = 0,		run_end = 20,
	},
	follow = {"farming:carrot", "farming_plus:carrot_item"},
	view_range = 8,
	replace_rate = 10,
	replace_what = {"default:stonebrick"},
	replace_with = "default:stone",
	on_rightclick = function(self, clicker)

		mobs:capture_mob(self, clicker, 30, 50, 80, false, nil)
	end,

	attack_type = "dogfight",
	damage = 5,
})

mobs:register_spawn("mobs_mc:silverfish",
	{"default:stonebrick"}, 20, 10, 15000, 2, -10, true)

--mobs:register_egg("mobs_mc:bunny", S("Bunny"), "mobs_bunny_inv.png", 0)
mobs:register_egg("mobs_mc:silverfish", "Silverfish", "silverfish_inv.png", 0)

