--MCmobs v0.4
--maikerumine
--made for MC like Survival game
--License for code WTFPL and otherwise stated in readmes


--dofile(minetest.get_modpath("mobs").."/api.lua")

--###################
--################### SNOWMAN
--###################
--[[
mobs:register_mob("mobs_mc:26snowman", {
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
	mesh = "snowman.b3d",
	textures = {
		{"snowman.png"},
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

mobs:register_egg("mobs_mc:26snowman", "Snowman", "snowman_inv.png", 0)
]]

mobs:register_mob("mobs_mc:enderman", {
	type = "monster",
	hp_max = 79,
	collisionbox = {-0.4, -2.4, -0.4, 0.4, 1.8, 0.4},
	
	visual = "mesh",
	mesh = "mobs_sand_monster.b3d",
	textures = {
	{"mobs_endermen.png"}
	},
	visual_size = {x=1.2, y=2.5},
	makes_footstep_sound = true,
	sounds = {
		random = "mobs_sandmonster",
		death = "green_slime_death",
		damage = "Creeperdeath",
	},
	walk_velocity = 3.2,
	run_velocity = 5.4,
	damage = 3,
	armor = 200,
	drops = {
		{name = "default:obsidian",
		chance = 40,
		min = 0,
		max = 2,},
		{name = "default:diamond",
		chance = 61,
		min = 1,
		max = 1,},
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
		speed_normal = 45,
		speed_run = 15,
		stand_start = 0,
		stand_end = 39,
		walk_start = 41,
		walk_end = 72,
		run_start = 74,
		run_end = 105,
		punch_start = 74,
		punch_end = 105,
	},
	drawtype = "front",
	water_damage = 1,
	lava_damage = 5,
	light_damage = 0,
	view_range = 16,
	attack_type = "dogfight",
	replace_rate = 1,
	replace_what = {"default:torch","default:sand","default:desert_sand","default:cobble","default:dirt","default:dirt_with_glass","default:dirt_with_dry_grass","default:wood","default:stone","default:sandstone"},
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




mobs:register_spawn("mobs_mc:enderman", { "default:sand", "default:desert_sand"}, 5, -1, 5000, 4, 31000)




-- spawn eggs
mobs:register_egg("mobs_mc:enderman", "Enderman", "spawn_egg_overlay.png")


if minetest.settings:get_bool("log_mods") then
	minetest.log("action", "MC Enderman loaded")
end