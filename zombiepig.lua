--MCmobs v0.2
--maikerumine
--made for MC like Survival game
--License for code WTFPL and otherwise stated in readmes


--dofile(minetest.get_modpath("mobs").."/api.lua")


mobs:register_mob("mobs_mc:pigman", {
	type = "monster",
	hp_max = 35,
	collisionbox = {-0.4, -0.01, -0.4, 0.4, 1.9, 0.4},
	textures = {
	{"mobs_zombie_pigman.png"}
	},
	visual = "mesh",
	mesh = "mobs_zombie.x",
	
	--Tried to get a sword in pig hand
	--collisionbox = {-0.3, -1.0, -0.3, 0.3, 0.8, 0.3},
	--visual = "mesh",
	--mesh = "3d_armor_character.b3d",
	--textures = {"zombie_pigman.png",
	--		"3d_armor_trans.png",
	--			minetest.registered_items["default:sword_mese"].inventory_image,
	--		},

	makes_footstep_sound = true,
	walk_velocity = .8,
	run_velocity = 1.6,
	damage = 2,
	armor = 400,
	drops = {
		{name = "mobs:rotten_flesh",
		chance = 1,
		min = 1,
		max = 1,},
		{name = "default:gold_ingot",
		chance = 13,
		min = 0,
		max = 2,},
		{name = "default:sword_mese",
		chance = 8,
		min = 1,
		max = 1,},
	},
		sounds = {
		random = "Pig2",
		death = "Pigdeath",
		damage = "zombiehurt1",
		attack = "default_punch3",
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
mobs:register_spawn("mobs_mc:pigman", {"nether:rack"}, 15, -1, 5000, 4, -5000)
mobs:register_spawn("mobs_mc:pigman", {"nether:portal"}, 15, -1, 15000, 4, 31000)
mobs:register_spawn("mobs_mc:pigman", {"default:obsidian"}, 15, -1, 19000, 1, 31000)


-- meat rotted
minetest.register_craftitem(":mobs:rotten_flesh", {
	description = "Rotten Flesh",
	inventory_image = "mobs_rotten_flesh.png",
	on_use = minetest.item_eat(4),
})


-- compatibility
mobs:alias_mob("mobs:pigman", "mobs_mc:pigman")

-- spawn eggs
mobs:register_egg("mobs_mc:pigman", "Zombie Pigman", "spawn_egg_zombie_pigman.png")


if minetest.setting_get("log_mods") then
	minetest.log("action", "MC Pigmen loaded")
end