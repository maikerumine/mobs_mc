--MCmobs v0.4
--maikerumine
--made for MC like Survival game
--License for code WTFPL and otherwise stated in readmes


--dofile(minetest.get_modpath("mobs").."/api.lua")
--###################
--################### VINDICATOR
--###################
--[[
mobs:register_mob("mobs_mc:61vindicator", {
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
	mesh = "villager.b3d",
    textures = {{"vindicator.png"}},
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

mobs:register_egg("mobs_mc:61vindicator", "Vindicator", "vindicator_inv.png", 0)
]]

mobs:register_mob("mobs_mc:vindicator", {
	type = "monster",
	physical = false,
	pathfinding = 1,
	hp_min = 35,
	hp_max = 75,
	collisionbox = {-0.4, -0.01, -0.4, 0.4, 1.95, 0.4},
    rotate = -180,
	visual = "mesh",
	mesh = "vindicator.b3d",
    textures = {
        {"vindicator.png^vindicator1.png"},
        --{"vindicator2.png^vindicator1.png"},
    },
	visual_size = {x=3, y=3},
	makes_footstep_sound = true,
	damage = 2,
	walk_velocity = 1.2,
	run_velocity = 2.4,
	damage = 1,
	group_attack = true,
	attack_type = "dogfight",
	drops = {
		{name = "default:emerald",
		chance = 1,
		min = 1,
		max = 1,},
		{name = "default:axe_steel",
		chance = 11,
		min = 0,
		max = 1,},
	},
	armor = 90,
	sounds = {
		random = "Villager1",
		death = "Villagerdead",
		damage = "Villagerhurt1",
	},
	animation = {
		speed_normal = 25,
		speed_run = 25,
		stand_start = 40,
		stand_end = 59,
        speed_stand = 5,
		walk_start = 0,
		walk_end = 40,
        --speed_walk = 50,
        punch_start = 90,
        punch_end = 110,
        die_start = 110,
        die_end = 130,
	},
	water_damage = 1,
	lava_damage = 5,
	light_damage = 0,
	view_range = 13,
	fear_height = 3,

})

--mobs:register_spawn("mobs_mc:vindicator", {"mg_villages:road"}, 20, 8, 500, 2, 31000)
mobs:spawn_specific("mobs_mc:evoker", {"default:acacia_tree"}, {"default:glass"}, 0, 20, 60, 1300, 1, -31000, 150,false)
mobs:spawn_specific("mobs_mc:evoker", {"default:aspen_tree"}, {"default:glass"}, 0, 20, 60, 1300, 1, -31000, 150,false)
mobs:spawn_specific("mobs_mc:evoker", {"default:tree"}, {"default:glass"}, 0, 20, 60, 1300, 1, -31000, 150,false)
mobs:spawn_specific("mobs_mc:evoker", {"default:jungletree"}, {"default:glass"}, 0, 20, 60, 1300, 1, -31000, 150,false)
mobs:spawn_specific("mobs_mc:evoker", {"default:pine_tree"}, {"default:glass"}, 0, 20, 60, 1300, 1, -31000, 150,false)

--mg_villages:torch
mobs:spawn_specific("mobs_mc:evoker", {"stairs:slab_junglewood"}, {"air"}, 0, 20, 30, 3000, 1, -31000, 150, false)
mobs:spawn_specific("mobs_mc:evoker", {"stairs:slab_acacia_wood"}, {"air"}, 0, 20, 30, 3000, 1, -31000, 150, false)
mobs:spawn_specific("mobs_mc:evoker", {"stairs:slab_pine_wood"}, {"air"}, 0, 20, 30, 3000, 1, -31000, 150, false)
mobs:spawn_specific("mobs_mc:evoker", {"stairs:slab_aspen_wood"}, {"air"}, 0, 20, 30, 3000, 1, -31000, 150, false)

-- spawn eggs
mobs:register_egg("mobs_mc:vindicator", "Vindicator", "vindicator_inv.png", 0)

if minetest.settings:get_bool("log_mods") then
	minetest.log("action", "MC vindicator loaded")
end
