--MCmobs v0.4
--maikerumine
--made for MC like Survival game
--License for code WTFPL and otherwise stated in readmes


--dofile(minetest.get_modpath("mobs").."/api.lua")


--###################
--################### CREEPER
--###################
--[[
mobs:register_mob("mobs_mc:27creeper", {
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
	mesh = "creeper.b3d",
	textures = {
		{"creeper.png"},
	},
	visual_size = {x=3, y=3},
	walk_velocity = 0.6,
	run_velocity = 2,
	jump = true,
	animation = {
		speed_normal = 25,		speed_run = 50,
		stand_start = 0,		stand_end = 0,
		walk_start = 0,		walk_end = 40,
		run_start = 0,		run_end = 40,
	},
})

mobs:register_egg("mobs_mc:27creeper", "Creeper", "creeper_inv.png", 0)
]]


mobs:register_mob("mobs_mc:creeper", {
	type = "monster",
	hp_min = 20,
	hp_max = 20,
	collisionbox = {-0.4, -0.01, -0.4, 0.4, 1.6, 0.4},
	pathfinding = true,
	group_attack = true,
    rotate = -180,
	visual = "mesh",
	mesh = "creeper.b3d",
	textures = {
		{"creeper.png"},
	},
	visual_size = {x=3, y=3},
	makes_footstep_sound = false,
	sounds = {
		attack = "Fuse",
		death = "Creeperdeath",
		damage = "Creeper4",
		war_cry = "Fuse",
		explode = "explo",
	},
	walk_velocity = 1.5,
	run_velocity = 3,
	attack_type = "explode",
	
--	This function generates an explosion which removes nodes in a specific radius and replace them with fire or air. Protection nodes, obsidian and locked chests will not be destroyed although a normal chest will drop it's contents.
--	mobs:explosion(pos, radius, fire, smoke)
--	'pos' centre position of explosion
--	'radius' radius of explosion (typically set to 3)
--	'fire' should fire appear in explosion (1=yes, 0=no)
--	'smoke' should smoke appear in explosion (1=yes, 0=no)
--	'sound' sound played when mob explodes

	explosion_radius = 3,
	explosion_fire = 0,
	explosion_smoke = 1,

	maxdrops = 2,
	drops = {
		{name = "tnt:gunpowder",
		chance = 3,
		min = 0,
		max = 2,},

		--[[
		{name = "jdukebox:disc_1",
		chance = 30,
		min = 0,
		max = 1,},
		{name = "jdukebox:disc_2",
		chance = 30,
		min = 0,
		max = 1,},
		{name = "jdukebox:disc_3",
		chance = 30,
		min = 0,
		max = 1,},
		{name = "jdukebox:disc_4",
		chance = 30,
		min = 0,
		max = 1,},
		{name = "jdukebox:disc_5",
		chance = 30,
		min = 0,
		max = 1,},
		{name = "jdukebox:disc_6",
		chance = 30,
		min = 0,
		max = 1,},
		]]
		{name = "mcl_jukebox:record_1",
		chance = 30,
		min = 0,
		max = 1,},
		{name = "mcl_jukebox:record_2",
		chance = 40,
		min = 0,
		max = 1,},
		{name = "mcl_jukebox:record_3",
		chance = 20,
		min = 0,
		max = 1,},
		{name = "mcl_jukebox:record_4",
		chance = 30,
		min = 0,
		max = 1,},
		{name = "mcl_jukebox:record_5",
		chance = 30,
		min = 0,
		max = 1,},
		{name = "mcl_jukebox:record_6",
		chance = 30,
		min = 0,
		max = 1,},
		{name = "mcl_jukebox:record_7",
		chance = 30,
		min = 0,
		max = 1,},
		{name = "mcl_jukebox:record_8",
		chance = 50,
		min = 0,
		max = 1,},
		{name = "mobs_mc:creeper_head",
		chance = 50,
		min = 0,
		max = 1,},
	},
	animation = {
		speed_normal = 24,
		speed_run = 48,
		stand_start = 0,
		stand_end = 23,
		walk_start = 24,
		walk_end = 49,
		run_start = 24,
		run_end = 49,
		hurt_start = 110,
		hurt_end = 139,
		death_start = 140,
		death_end = 189,
		look_start = 50,
		look_end = 108,
	},
	drawtype = "front",
	water_damage = 1,
	lava_damage = 5,
	light_damage = 0,
	view_range = 16,
})


--mobs:register_spawn("mobs_mc:creeper", {"group:crumbly", "group:cracky", "group:choppy", "group:snappy"}, 7, -1, 5000, 4, 31000)
mobs:spawn_specific("mobs_mc:creeper", {"default:dirt_with_grass", "default:dirt_with_dry_grass","default:stone","default:dirt","default:coarse_dirt", "default:sand"},{"air"},0, 6, 20, 9000, 1, -310, 31000)

-- compatibility
mobs:alias_mob("mobs:creeper", "mobs_mc:creeper")

-- spawn eggs
mobs:register_egg("mobs_mc:creeper", "Creeper", "creeper_inv.png", 0)

if minetest.settings:get_bool("log_mods") then
	minetest.log("action", "MC Creeper loaded")
end
