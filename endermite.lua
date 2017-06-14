
--###################
--################### ENDERMITE
--###################
--[[
mobs:register_mob("mobs_mc:14endermite", {
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
	mesh = "endermite.b3d",
	textures = {
		{"endermite.png"},
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

mobs:register_egg("mobs_mc:14endermite", "Endermite", "endermite_inv.png", 0)
]]
-- Rat by PilzAdam

mobs:register_mob("mobs_mc:endermite", {
	type = "monster",
	passive = false,
	hp_min = 8,
	hp_max = 8,
	armor = 100,
	group_attack = true,
    collisionbox = {-0.2, -0.01, -0.2, 0.2, 0.3, 0.2},
    rotate = -180,
	visual = "mesh",
	mesh = "endermite.b3d",
	textures = {
		{"endermite.png"},
	},
	visual_size = {x=3, y=3},
	makes_footstep_sound = false,
	sounds = {
		random = "mobs_rat",
	},
	walk_velocity = 1,
	run_velocity = 2,
	runaway = true,
	jump = true,
	water_damage = 0,
	lava_damage = 4,
	light_damage = 0,
	fear_height = 2,
	view_range = 16,
	damage = 2,
	on_rightclick = function(self, clicker)
		mobs:capture_mob(self, clicker, 25, 80, 0, true, nil)
	end,

})

mobs:register_spawn("mobs_mc:endermite", {"default:stone"}, 20, 5, 15000, 2, -3000)


mobs:register_egg("mobs_mc:endermite", "Endermite", "endermite_inv.png", 0)


