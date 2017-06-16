--MCmobs v0.4
--maikerumine
--made for MC like Survival game
--License for code WTFPL and otherwise stated in readmes


--dofile(minetest.get_modpath("mobs").."/api.lua")
--###################
--################### ZOMBIE PIGMAN
--###################
--[[
mobs:register_mob("mobs_mc:51pigman", {
	type = "animal",
	passive = true,
    runaway = true,
    stepheight = 1.2,
	hp_min = 30,
	animation = {
		speed_normal = 25,		speed_run = 50,
		stand_start = 40,		stand_end = 80,
		walk_start = 0,		walk_end = 40,
		run_start = 0,		run_end = 40,
        punch_start = 90,		punch_end = 130,
	},
})

mobs:register_egg("mobs_mc:51pigman", "Zombie Pigman", "zombie_pigman_inv.png", 0)
]]

local pigman = {
--mobs:register_mob("mobs_mc:pigman", {
	type = "npc",--made npc to simulate they only attack when attacked first.
	hp_max = 60,
	armor = 150,
    collisionbox = {-0.35, -0.01, -0.35, 0.35, 2, 0.35},
    --rotate = -180,
	visual = "mesh",
	mesh = "zombie_pigman.b3d",
    textures = {{"zombie_pigman.png"}},
	visual_size = {x=1, y=1},
	walk_velocity = 0.6,
	run_velocity = 2,
	jump = true,
	hp_min = 20,
	hp_max = 20,
	collisionbox = {-0.3, -1.0, -0.3, 0.3, 0.8, 0.3},
	visual = "mesh",
	mesh = "3d_armor_character.b3d",
	textures = {{"mobs_zombie_pigman.png",
			"3d_armor_trans.png",
				minetest.registered_items["default:sword_mese"].inventory_image,
			}},

	makes_footstep_sound = true,
	walk_velocity = .8,
	run_velocity = 2.6,
	damage = 9,
	armor = 80,
	pathfinding = true,
	group_attack = true,
	passive = false,
	maxdrops = 2,
	drops = {
		{name = "mobs:rotten_flesh",
		chance = 1,
		min = 1,
		max = 1,},
		{name = "default:gold_nugget",
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
}

mobs:register_mob("mobs_mc:pigman", pigman)

-- Baby pigman.
-- A smaller and more dangerous variant of the pigman

local baby_pigman = table.copy(pigman)
baby_pigman.collisionbox = {-0.25, -0.01, -0.25, 0.25, 0.94, 0.25}
baby_pigman.visual_size = {x=0.5, y=0.5}
baby_pigman.textures = {{"mobs_zombie_pigman.png"}}
baby_pigman.walk_velocity = 1.2
baby_pigman.run_velocity = 2.4
baby_pigman.light_damage = 0

mobs:register_mob("mobs_mc:baby_pigman", baby_pigman)

-- Baby zombie is 20 times less likely than regular zombies
mobs:register_spawn("mobs_mc:baby_pigman", {"default:rack", "default:portal"}, 7, -1, 100000, 4, 31000)





mobs:register_spawn("mobs_mc:pigman", {"default:rack"},  17, -1, 1000, 3, -2000)
mobs:register_spawn("mobs_mc:pigman", {"default:portal"}, 15, -1, 500, 4, 31000)
--mobs:register_spawn("mobs_mc:pigman", {"default:obsidian"}, 17, -1, 1900, 1, 31000)
mobs:spawn_specific("mobs_mc:pigman", {"default:portal"},{"air"},0, 12, 20, 9000, 2, -31000, 31000)

-- meat rotted
minetest.register_craftitem(":mobs:rotten_flesh", {
	description = "Rotten Flesh",
	inventory_image = "mobs_rotten_flesh.png",
	on_use = minetest.item_eat(4),
})


-- compatibility
mobs:alias_mob("mobs:pigman", "mobs_mc:pigman")

-- spawn eggs
mobs:register_egg("mobs_mc:pigman", "Zombie Pigman", "zombie_pigman_inv.png", 0)

if minetest.settings:get_bool("log_mods") then
	minetest.log("action", "MC Pigmen loaded")
end
