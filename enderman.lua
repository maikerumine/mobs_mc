--MCmobs v0.4
--maikerumine
--made for MC like Survival game
--License for code WTFPL and otherwise stated in readmes


--dofile(minetest.get_modpath("mobs").."/api.lua")


--###################
--################### ENDERMAN
--###################
--[[
mobs:register_mob("mobs_mc:13enderman", {
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
	mesh = "enderman.b3d",
	textures = {
		{"enderman.png"},
	},
	visual_size = {x=3, y=3},
	walk_velocity = 0.6,
	run_velocity = 2,
	jump = true,
	animation = {
		speed_normal = 25,		speed_run = 50,
		stand_start = 40,		stand_end = 80,
		walk_start = 0,		walk_end = 40,
		run_start = 0,		run_end = 40,
	},
})

mobs:register_egg("mobs_mc:13enderman", "Enderman", "enderman_inv.png", 0)
]]

mobs:register_mob("mobs_mc:ender_man", {
	type = "monster",
    runaway = true,
    pathfinding = 2,
    stepheight = 1.2,
	hp_min = 40,
	hp_max = 40,
    collisionbox = {-0.35, -0.01, -0.35, 0.35, 2.75, 0.35},
    rotate = -180,
	visual = "mesh",
	mesh = "enderman.b3d",
	textures = {
		{"enderman.png"},
	},
	visual_size = {x=3, y=3},
	makes_footstep_sound = true,
	sounds = {
		random = "mobs_sandmonster",
		death = "green_slime_death",
		damage = "Creeperdeath",
	},
	walk_velocity = 0.2,
	run_velocity = 3.4,
	damage = 7,
	drops = {
		{name = "farorb:farorb",
		chance = 3,
		min = 0,
		max = 1,},
		{name = "mobs_mc:enderman_head",
		chance = 50,
		min = 0,
		max = 1,},
	},
	animation = {
		speed_normal = 25,		speed_run = 50,
		stand_start = 40,		stand_end = 80,
		walk_start = 0,		walk_end = 40,
		run_start = 0,		run_end = 40,
	},
	drawtype = "front",
	water_damage = 8,
	lava_damage = 5,
	light_damage = 0,
	view_range = 16,
	fear_height = 10,
	attack_type = "dogfight",
	replace_rate = 1,
	replace_what = {"default:torch","default:torch_wall", "default:cobble","default:wood"},
	replace_with = "air",
	replace_offset = -1,

})

minetest.register_craftitem("mobs_mc:ender_eye", {
	description = "Ender Eye",

	inventory_image = "mcl_end_ender_eye.png",
	groups = { craftitem = 1 },
})

minetest.register_craft({
	output		= 'mobs_mc:ender_eye',
	recipe		= {
		{ 'farorb:farorb', 'mobs_mc:blaze_rod'}
	}
})

-- compatibility
mobs:alias_mob("mobs_mc:enderman", "mobs_mc:ender_man")

--spawn
mobs:register_spawn("mobs_mc:ender_man", { "default:sand", "default:desert_sand"}, 7, -1, 9000, 1, 31000)
mobs:register_spawn("mobs_mc:ender_man", { "default:end_stone"}, 7, -1, 5000, 5, -5000)

-- spawn eggs
mobs:register_egg("mobs_mc:ender_man", "Ender man", "enderman_inv.png", 0)

if minetest.settings:get_bool("log_mods") then

	minetest.log("action", "MC Enderman loaded")
end

