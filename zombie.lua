--MCmobs v0.4
--maikerumine
--made for MC like Survival game
--License for code WTFPL and otherwise stated in readmes


--dofile(minetest.get_modpath("mobs").."/api.lua")


--###################
--################### ZOMBIE
--###################
--[[
mobs:register_mob("mobs_mc:22zombie", {
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
	mesh = "zombie.b3d",
	textures = {
		{"zombie.png"},
	},
	visual_size = {x=3.5, y=3.5},
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

mobs:register_egg("mobs_mc:22zombie", "Zombie", "zombie_inv.png", 0)
]]

local zombie = {
	type = "monster",
	hp_min = 20,
	hp_max = 20,
    collisionbox = {-0.35, -0.01, -0.35, 0.35, 2, 0.35},
	--collisionbox = {-0.5, -0.01, -0.5, 0.5, 1.9, 0.5},
    --rotate = -180,
	visual = "mesh",
	--mesh = "zombie.b3d",  new
	mesh = "mobs_zombie.x",
	textures = {
		--{"zombie.png"},
		{"mobs_zombie.png"},
	},
	visual_size = {x=1, y=1},
	makes_footstep_sound = true,
	sounds = {
		random = "zombie1",
		death = "zombiedeath",
		damage = "zombiehurt1",
		attack = "default_punch3",
	},
	walk_velocity = .8,
	run_velocity = 1.6,
	damage = 3,
	fear_height = 8,
	pathfinding = 1,
	jump = true,
	--jump_height = 3,
	group_attack = true,
	drops = {
		{name = "mobs:rotten_flesh",
		chance = 1,
		min = 0,
		max = 2,},
		{name = "default:iron_ingot",
		-- approximation to 8.5%
		chance = 11,
		min = 1,
		max = 1,},
		{name = "farming:carrot",
		-- approximation to 8.5%
		chance = 11,
		min = 1,
		max = 1,},
		{name = "farming:potato",
		-- approximation to 8.5%
		chance = 11,
		min = 1,
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
	lava_damage = 5,
	-- TODO: Burn mob only when in direct sunlight
	light_damage = 2,
	view_range = 17,
	attack_type = "dogfight",
}

mobs:register_mob("mobs_mc:zombie", zombie)

-- Baby zombie.
-- A smaller and more dangerous variant of the zombie

local baby_zombie = table.copy(zombie)
baby_zombie.collisionbox = {-0.25, -0.01, -0.25, 0.25, 0.94, 0.25}
baby_zombie.visual_size = {x=0.5, y=0.5}
baby_zombie.walk_velocity = 1.2
baby_zombie.run_velocity = 2.4
baby_zombie.light_damage = 0

mobs:register_mob("mobs_mc:baby_zombie", baby_zombie)

-- Husk.
-- Desert variant of the zombie
local husk = table.copy(zombie)
husk.textures = {{"mobs_mc_husk.png"}}
husk.light_damage = 0
husk.water_damage = 3
-- TODO: Husks avoid water

mobs:register_mob("mobs_mc:husk", husk)

-- Baby husk.
-- A smaller and more dangerous variant of the husk
local baby_husk = table.copy(husk)
baby_husk.collisionbox = {-0.25, -0.01, -0.25, 0.25, 0.94, 0.25}
baby_husk.visual_size = {x=0.5, y=0.5}
baby_husk.walk_velocity = 1.2
baby_husk.run_velocity = 2.4

mobs:register_mob("mobs_mc:baby_husk", baby_husk)


-- Spawning

mobs:register_spawn("mobs_mc:zombie", {"default:dirt_with_grass", "default:dirt_with_dry_grass","default:stone","default:dirt","default:coarse_dirt", "default:sand"}, 7, -1, 8000, 4, 31000)
-- Baby zombie is 20 times less likely than regular zombies
mobs:register_spawn("mobs_mc:baby_zombie", {"default:dirt_with_grass", "default:dirt_with_dry_grass","default:stone","default:dirt","default:coarse_dirt", "default:sand"}, 7, -1, 100000, 4, 31000)
mobs:register_spawn("mobs_mc:husk", {"default:sand", "default:redsand", "default:sandstone", "default:redsandstone"}, 7, -1, 8090, 4, 31000)
mobs:register_spawn("mobs_mc:baby_husk", {"default:sand", "default:redsand", "default:sandstone", "default:redsandstone"}, 7, -1, 100000, 4, 31000)


-- Compatibility
mobs:alias_mob("mobs:zombie", "mobs_mc:zombie")

-- Spawn eggs
mobs:register_egg("mobs_mc:zombie", "Spawn Zombie", "spawn_egg_zombie.png")
mobs:register_egg("mobs_mc:baby_zombie", "Spawn Baby Zombie", "spawn_egg_baby_zombie.png") -- TODO: To be removed
mobs:register_egg("mobs_mc:husk", "Spawn Husk", "spawn_egg_husk.png") -- TODO: To be removed
mobs:register_egg("mobs_mc:baby_husk", "Spawn Baby Husk", "spawn_egg_baby_husk.png") -- TODO: To be removed
mobs:register_egg("mobs_mc:zombie", "Zombie", "zombie_inv.png", 0)

if minetest.settings:get_bool("log_mods") then
	minetest.log("action", "MC Zombie loaded")
end
