--MCmobs v0.2
--maikerumine
--made for MC like Survival game
--License for code WTFPL and otherwise stated in readmes


--dofile(minetest.get_modpath("mobs").."/api.lua")
--###################
--################### ZOMBIE PIGMAN
--###################

mobs:register_mob("mobs_mc:51pigman", {
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
	mesh = "zombie_pigman.b3d",
    textures = {{"zombie_pigman.png"}},
	visual_size = {x=3, y=3},
	walk_velocity = 0.6,
	run_velocity = 2,
	jump = true,
	animation = {
		speed_normal = 25,		speed_run = 50,
		stand_start = 40,		stand_end = 80,
		walk_start = 0,		walk_end = 40,
		run_start = 0,		run_end = 40,
        punch_start = 90,		punch_end = 130,
	},
})

mobs:register_egg("mobs_mc:51pigman", "Zombie Pigman", "zombie_pigman_inv.png", 0)



mobs:register_mob("mobs_mc:pigman", {
	type = "monster",
	hp_max = 75,
	--old zombie mesh code
	--collisionbox = {-0.4, -0.01, -0.4, 0.4, 1.9, 0.4},
	--textures = {
	--{"mobs_zombie_pigman.png"}
	--},
	--visual = "mesh",
	--mesh = "mobs_zombie.x",
	
	--Tried to get a sword in pig hand
	--http://minetest.fensta.bplaced.net/#page=20
	--Author: Fedora P 
	--License: CC BY-SA 3.0
	collisionbox = {-0.3, -1.0, -0.3, 0.3, 0.8, 0.3},
	visual = "mesh",
	mesh = "3d_armor_character.b3d",
	textures = {{"Original_Zombiepig_Man_by_Fedora_P.png",
			"3d_armor_trans.png",
				minetest.registered_items["default:sword_mese"].inventory_image,
			}},

	makes_footstep_sound = true,
	walk_velocity = .8,
	run_velocity = 2.6,
	damage = 2,
	armor = 80,
	pathfinding = true,
	group_attack = true,
	drops = {
		{name = "mobs:rotten_flesh",
		chance = 1,
		min = 1,
		max = 1,},
		{name = "default:gold_ingot",
		chance = 13,
		min = 0,
		max = 2,},
		{name = "default:sword_gold",
		chance = 8,
		min = 1,
		max = 1,},
		{name = "default:sword_mese",
		chance = 8,
		min = 1,
		max = 1,},
		{name = "mobs_mc:zombiepig_head",
		chance = 50,
		min = 0,
		max = 1,},
	},
		sounds = {
		random = "Pig2",
		death = "Pigdeath",
		damage = "zombiehurt1",
		attack = "default_punch3",
	},
	--[[
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
	]]
	animation = {
		speed_normal = 30,		speed_run = 30,
		stand_start = 0,		stand_end = 79,
		walk_start = 168,		walk_end = 187,
		run_start = 168,		run_end = 187,
		punch_start = 200,		punch_end = 219,
	},
	drawtype = "front",
	water_damage = 1,
	lava_damage = 5,
	light_damage = 0,
	fear_height = 3,
	view_range = 16,
	attack_type = "dogfight",
})
mobs:register_spawn("mobs_mc:pigman", {"nether:rack"},  17, -1, 5000, 3, -2000)
mobs:register_spawn("mobs_mc:pigman", {"nether:portal"}, 15, -1, 500, 4, 31000)
mobs:register_spawn("mobs_mc:pigman", {"default:obsidian"}, 17, -1, 1900, 1, 31000)
mobs:spawn_specific("mobs_mc:pigman", {"group:crumbly", "group:cracky", "group:choppy", "group:snappy"},{"air"},0, 12, 20, 9000, 2, -3510, -2100)

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