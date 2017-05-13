--MCmobs v0.2
--maikerumine
--made for MC like Survival game
--License for code WTFPL and otherwise stated in readmes


--dofile(minetest.get_modpath("mobs").."/api.lua")



mobs:register_mob("mobs_mc:zombie", {
	type = "monster",
	hp_max = 35,
	collisionbox = {-0.4, -0.01, -0.4, 0.4, 1.9, 0.4},
	textures = {
	{"mobs_zombie.png"}
	},
	visual = "mesh",
	mesh = "mobs_zombie.x",
	makes_footstep_sound = true,
	sounds = {
		random = "zombie1",
		death = "zombiedeath",
		damage = "zombiehurt1",
		attack = "default_punch3",
	},
	walk_velocity = .8,
	run_velocity = 1.6,
	damage = 1,
	pathfinding = true,
	group_attack = true,
	armor = 200,
	drops = {
		{name = "mobs:rotten_flesh",
		chance = 1,
		min = 1,
		max = 1,},
		{name = "default:steel_ingot",
		chance = 3,
		min = 0,
		max = 2,},
		{name = "default:shovel_steel",
		chance = 4,
		min = 1,
		max = 1,},
		{name = "default:sword_steel",
		chance = 8,
		min = 1,
		max = 1,},
		{name = "farming:carrot",
		chance = 10,
		min = 1,
		max = 1,},
		{name = "farming:potato",
		chance = 10,
		min = 1,
		max = 1,},
		{name = "mobs_mc:zombie_head",
		chance = 10,
		min = 0,
		max = 1,},
	},
	animation = {
		speed_normal = 24,
		speed_run = 48,
		stand_start = 0,
		stand_end = 23,
		walk_start = 24,
		walk_end = 47,
		run_start = 48,
		run_end = 62,
		hurt_start = 64,
		hurt_end = 86,
		death_start = 88,
		death_end = 118,
	},
	drawtype = "front",
	water_damage = 1,
	lava_damage = 5,
	light_damage = 1,
	view_range = 16,
	attack_type = "dogfight",
})
mobs:register_spawn("mobs_mc:zombie", {"group:crumbly", "group:cracky", "group:choppy", "group:snappy"}, 7, -1, 5000, 4, 31000)


-- meat rotted
minetest.register_craftitem(":mobs:rotten_flesh", {
	description = "Rotten Flesh",
	inventory_image = "mobs_rotten_flesh.png",
	on_use = minetest.item_eat(4),
})


-- compatibility
mobs:alias_mob("mobs:zombie", "mobs_mc:zombie")

-- spawn eggs
mobs:register_egg("mobs_mc:zombie", "Zombie", "spawn_egg_zombie.png")


if minetest.settings:get("log_mods") then
	minetest.log("action", "MC Zombie loaded")
end