--MCmobs v0.4
--maikerumine
--made for MC like Survival game
--License for code WTFPL and otherwise stated in readmes


--dofile(minetest.get_modpath("mobs").."/api.lua")
--###################
--################### IRON GOLEM
--###################
--[[
mobs:register_mob("mobs_mc:19iron_golem", {
	type = "monster",
    attack_type = "dogfight",
	passive = false,
    stepheight = 1.2,
	hp_min = 30,
	hp_max = 60,
	armor = 150,
    collisionbox = {-0.35, -0.01, -0.35, 0.35, 2, 0.35},
    rotate = -180,
	visual = "mesh",
	mesh = "iron_golem.b3d",
	textures = {
		{"iron_golem.png"},
	},
	visual_size = {x=3, y=3},
	walk_velocity = 0.6,
	run_velocity = 2,
	jump = true,
	animation = {
		speed_normal = 15,		speed_run = 25,
		stand_start = 0,		stand_end = 0,
		walk_start = 0,		walk_end = 40,
		run_start = 0,		run_end = 40,
        punch_start = 40,  punch_end = 50,
	},
})

mobs:register_egg("mobs_mc:19iron_golem", "Iron Golem", "iron_golem_inv.png", 0)

]]

-- Dog
mobs:register_mob("mobs_mc:iron_golem", {
	type = "npc",
	passive = true,
	hp_min = 100,
	hp_max = 100,
    collisionbox = {-0.35, -0.01, -0.35, 0.35, 2, 0.35},
    rotate = -180,
	visual = "mesh",
	mesh = "iron_golem.b3d",
	textures = {
		{"iron_golem.png"},
	},
	visual_size = {x=3, y=3},
	makes_footstep_sound = true,
	sounds = {
		war_cry = "mobs_wolf_attack",
	},
	view_range = 16,
	stepheight = 1.1,
	stepheight = 1.2,
	owner = "",
	order = "follow",
	floats = {x=0,y=0,z=0},
	walk_velocity = 4,
	run_velocity = 4,
	stepheight = 1.1,
	damage = 14,
	group_attack = true,
	attacks_monsters = true,
	attack_type = "dogfight",
	drops = {
		{name = "default:steel_block",
		chance = 1,
		min = 2,
		max = 3,},
	},
	drawtype = "front",
	water_damage = 0,
	lava_damage = 5,
	light_damage = 0,

	animation = {
		speed_normal = 15,		speed_run = 25,
		stand_start = 0,		stand_end = 0,
		walk_start = 0,		walk_end = 40,
		run_start = 0,		run_end = 40,
        punch_start = 40,  punch_end = 50,
	},
	jump = true,
	step = 1,
	blood_texture = "default_steelblock.png",
})


mobs:register_spawn("mobs_mc:iron_golem", {"default:steelblock"}, 20, 0, 19000, 1, 31000)




-- spawn eggs
mobs:register_egg("mobs_mc:iron_golem", "Iron Golem", "iron_golem_inv.png", 0)


if minetest.settings:get_bool("log_mods") then
	minetest.log("action", "MC Iron Golem loaded")
end
