--MCmobs v0.4
--maikerumine
--made for MC like Survival game
--License for code WTFPL and otherwise stated in readmes


--dofile(minetest.get_modpath("mobs").."/api.lua")


--###################
--################### SKELETON
--###################
--[[
mobs:register_mob("mobs_mc:35skeleton", {
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
	mesh = "skeleton.b3d",
	textures = {
		{"skeleton.png"},
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

mobs:register_egg("mobs_mc:35skeleton", "Skeleton", "skeleton_inv.png", 0)
]]


mobs:register_mob("mobs_mc:skeleton", {
	type = "monster",
	hp_min = 20,
	hp_max = 20,
	collisionbox = {-0.4, -0.01, -0.4, 0.4, 1.9, 0.4},
	pathfinding = true,
	group_attack = true,
	visual = "mesh",
	mesh = "skeleton.b3d",
	    rotate = -180,
	textures = {
		{"skeleton.png"},
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
	drops = {
		{name = "throwing:arrow",
		chance = 1,
		min = 0,
		max = 2,},
		{name = "throwing:bow_wood",
		chance = 11,
		min = 1,
		max = 1,},
		{name = "bonemeal:bone",
		chance = 1,
		min = 0,
		max = 2,},
		{name = "mobs_mc:skeleton_head",
		chance = 50,
		min = 0,
		max = 1,},
	},
    animation = {
		stand_start = 0,
		stand_end = 40,
        speed_stand = 5,
		walk_start = 40,
		walk_end = 60,
        speed_walk = 50,
        shoot_start = 70,
        shoot_end = 90,
        punch_start = 70,
        punch_end = 90,
        die_start = 120,
        die_end = 130,
        speed_die = 5,
        hurt_start = 100,
		hurt_end = 120,
	},
	drawtype = "front",
	water_damage = 1,
	lava_damage = 5,
	light_damage = 1,
	view_range = 16,
	attack_type = "dogshoot",
	--arrow = "throwing:arrow_entity",  --was "mobs:arrow_entity"
	arrow = "mobs:arrow_entity",
	shoot_interval = 2.5,
	shoot_offset = 1,
	--'dogshoot_switch' allows switching between shoot and dogfight modes inside dogshoot using timer (1 = shoot, 2 = dogfight)
	--'dogshoot_count_max' number of seconds before switching above modes.
	dogshoot_switch = 1,
	dogshoot_count_max =1.8,
})


-- compatibility
mobs:alias_mob("mobs:skeleton", "mobs_mc:skeleton")

--spawn
mobs:spawn_specific("mobs_mc:skeleton", {"default:dirt_with_grass", "default:dirt_with_dry_grass","default:stone","default:dirt","default:coarse_dirt"},{"air"},0, 6, 20, 9000, 2, -110, 31000)

-- spawn eggs
mobs:register_egg("mobs_mc:skeleton", "Skeleton", "skeleton_inv.png", 0)

if minetest.settings:get_bool("log_mods") then
	minetest.log("action", "MC Skeleton loaded")
end
