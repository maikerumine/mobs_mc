--MCmobs v0.4
--maikerumine
--made for MC like Survival game
--License for code WTFPL and otherwise stated in readmes


--dofile(minetest.get_modpath("mobs").."/api.lua")
--###################
--################### BAT
--###################
--[[
mobs:register_mob("mobs_mc:1bat", {
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
	mesh = "bat.b3d",
	textures = {
		{"bat.png"},
	},
	visual_size = {x=1, y=1},
	walk_velocity = 3,
	run_velocity = 3,
	jump = true,
	animation = {
		speed_normal = 80,		speed_run = 80,
		stand_start = 0,		stand_end = 40,
		walk_start = 0,		walk_end = 40,
		run_start = 0,		run_end = 40,
	},
})

mobs:register_egg("mobs_mc:1bat", "Bat", "bat_inv.png", 0)
]]

mobs:register_mob("mobs_mc:bat", {
	type = "animal",
	passive = true,
    runaway = true,
    stepheight = 1.2,
	hp_min = 6,
	hp_max = 6,
    collisionbox = {-0.2, -1, -0.2, 0.2, -0.8, 0.2},
    rotate = -180,
	visual = "mesh",
	mesh = "bat.b3d",
	textures = {
		{"bat.png"},
	},
	visual_size = {x=1, y=1},
		sounds = {
		random = "mobs_rat",
	},
	walk_velocity = 3,
	run_velocity = 3,
	jump = true,
	animation = {
		speed_normal = 80,		speed_run = 80,
		stand_start = 0,		stand_end = 40,
		walk_start = 0,		walk_end = 40,
		run_start = 0,		run_end = 40,
	},

	water_damage = 10,
	lava_damage = 20,
	light_damage = 0,
	fall_damage = 0,
	view_range = 16,

	floats=1,
	fly = true,
	jump_chance = 98,
	fear_height = 22,	
})



mobs:spawn_specific("mobs_mc:bat", {"default:air","default:stone"},{"air"},0, 17, 20, 5000, 2, -100, -2)


-- spawn eggs
mobs:register_egg("mobs_mc:bat", "Bat", "bat_inv.png", 0)


if minetest.settings:get_bool("log_mods") then
	minetest.log("action", "MC Bat loaded")
end
