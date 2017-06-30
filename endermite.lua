--###################
--################### ENDERMITE
--###################

mobs:register_mob("mobs_mc:endermite", {
	type = "monster",
	passive = false,
	hp_min = 8,
	hp_max = 8,
	armor = 100,
	group_attack = true,
	collisionbox = {-0.2, -0.01, -0.2, 0.2, 0.29, 0.2},
	visual = "mesh",
	mesh = "mobs_mc_endermite.b3d",
	textures = {
		{"mobs_mc_endermite.png"},
	},
	visual_size = {x=3, y=3},
	makes_footstep_sound = false,
	sounds = {
		random = "mobs_rat",
	},
	walk_velocity = 1,
	run_velocity = 2,
	jump = true,
	water_damage = 0,
	lava_damage = 4,
	light_damage = 0,
	fear_height = 4,
	view_range = 16,
	damage = 2,
	on_rightclick = function(self, clicker)
		mobs:capture_mob(self, clicker, 25, 80, 0, true, nil)
	end,
	blood_amount = 0,
})

mobs:register_egg("mobs_mc:endermite", "Endermite", "mobs_mc_spawn_icon_endermite.png", 0)
