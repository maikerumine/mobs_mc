--License for code WTFPL and otherwise stated in readmes

mobs:register_mob("mobs_mc:polar_bear", {
	type = "animal",
	runaway = false,
	passive = false,
	stepheight = 1.2,
	hp_min = 30,
	hp_max = 30,
	collisionbox = {-0.7, -0.01, -0.7, 0.7, 1.39, 0.7},
	rotate = -180,
	visual = "mesh",
	mesh = "polarbear.b3d",
	textures = {
		{"polarbear.png"},
	},
	visual_size = {x=3.0, y=3.0},
	makes_footstep_sound = true,
	damage = 6,
	walk_velocity = 1.2,
	run_velocity = 2.4,
	group_attack = true,
	attack_type = "dogfight",
	drops = {
		-- 3/4 chance to drop raw fish (poor approximation)
		{name = "fishing:fish_raw",
		chance = 2,
		min = 0,
		max = 2,},		
		-- 1/4 to drop raw salmon
		{name = "fishing:pike_raw",
		chance = 4,
		min = 0,
		max = 2,},

	},
	drawtype = "front",
	water_damage = 0,
	floats = 1,
	lava_damage = 5,
	light_damage = 0,
	fear_height = 4,
	sounds = {
		random = "Cowhurt1", -- TODO: Replace
	},
	animation = {
		speed_normal = 25,		speed_run = 50,
		stand_start = 0,		stand_end = 0,
		walk_start = 0,		walk_end = 40,
		run_start = 0,		run_end = 40,
	},

	view_range = 16,
})


-- compatibility
mobs:alias_mob("mobs_mc:polarbear", "mobs_mc:polar_bear")


mobs:register_spawn("mobs_mc:polar_bear", {"default:snowblock"}, 20, 8, 17000, 3, 31000)


-- spawn egg



mobs:register_egg("mobs_mc:polar_bear", "Polar Bear", "polarbear_inv.png", 0)


if minetest.settings:get_bool("log_mods") then
	minetest.log("action", "MC Polar Bear loaded")
end
