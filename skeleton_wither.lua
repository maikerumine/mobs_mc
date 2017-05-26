--MCmobs v0.4
--maikerumine
--made for MC like Survival game
--License for code WTFPL and otherwise stated in readmes


--dofile(minetest.get_modpath("mobs").."/api.lua")


--###################
--################### WITHER SKELETON
--###################
--[[
mobs:register_mob("mobs_mc:36witherskeleton", {
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
	mesh = "witherskeleton.b3d",
	textures = {
		{"witherskeleton.png"},
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

mobs:register_egg("mobs_mc:36witherskeleton", "Wither Skeleton", "witherskeleton_inv.png", 0)
]]


mobs:register_mob("mobs_mc:witherskeleton", {
	type = "monster",
	hp_max = 80,
	pathfinding = true,
	group_attack = true,
    collisionbox = {-0.35, -0.01, -0.35, 0.35, 2, 0.35},
    rotate = -180,
	visual = "mesh",
	mesh = "witherskeleton.b3d",
	textures = {
		{"witherskeleton.png"},
	},
	visual_size = {x=3, y=3},
	makes_footstep_sound = true,
	sounds = {
		random = "skeleton1",
		death = "skeletondeath",
		damage = "skeletonhurt1",
	},
	walk_velocity = 1.2,
	run_velocity = 2.4,
	damage = 2,
	armor = 200,
	drops = {
		{name = "mobs:arrow",
		chance = 1,
		min = 0,
		max = 2,},
		{name = "mobs:bow_wood",
		chance = 11,
		min = 1,
		max = 1,},
		{name = "bonemeal:bone",
		chance = 1,
		min = 0,
		max = 2,},
		{name = "mobs_mc:skeleton_head2",
		chance = 50,
		min = 0,
		max = 1,},
	},
	animation = {
		speed_normal = 30,
		speed_run = 60,
		stand_start = 0,
		stand_end = 23,
		walk_start = 24,
		walk_end = 49,
		run_start = 24,
		run_end = 49,
		hurt_start = 85,
		hurt_end = 115,
		death_start = 117,
		death_end = 145,
		shoot_start = 50,
		shoot_end = 82,
	},
	drawtype = "front",
	water_damage = 1,
	lava_damage = 5,
	light_damage = 1,
	view_range = 16,
	attack_type = "dogshoot",
	arrow = "mobs:arrow_entity",
	shoot_interval = 2.5,
	shoot_offset = 1,
	--'dogshoot_switch' allows switching between shoot and dogfight modes inside dogshoot using timer (1 = shoot, 2 = dogfight)
	--'dogshoot_count_max' number of seconds before switching above modes.
	dogshoot_switch = 1,
	dogshoot_count_max =0.5,
})

--spawn
mobs:spawn_specific("mobs_mc:witherskeleton", {"default:nitherbrick"},{"air"},0, 6, 20, 9000, 2, -9110, -50)

-- spawn eggs
mobs:register_egg("mobs_mc:witherskeleton", "Wither Skeleton", "witherskeleton_inv.png", 0)

if minetest.setting_get("log_mods") then
	minetest.log("action", "MC Wither Skeleton loaded")
end