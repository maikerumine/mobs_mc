-- v1.1

--###################
--################### SQUID
--###################
--[[
mobs:register_mob("mobs_mc:28squid", {
	type = "animal",
	passive = true,
    runaway = true,
    stepheight = 1.2,
	hp_min = 30,
	hp_max = 60,
	armor = 150,
    collisionbox = {-0.35, -0.01, -0.35, 0.35, 2, 0.35},
    --rotate = 180,
	visual = "mesh",
	mesh = "squid.b3d",
	textures = {
		{"squid.png"},
	},
	visual_size = {x=3, y=3},
	walk_velocity = 0.6,
	run_velocity = 2,
	jump = true,
	animation = {
		speed_normal = 25,		speed_run = 50,
		stand_start = 0,		stand_end = 0,
		walk_start = 0,		walk_end = 50,
		run_start = 0,		run_end = 50,
	},
})
mobs:register_egg("mobs_mc:28squid", "Squid", "squid_inv.png", 0)
]]


mobs:register_mob("mobs_mc:squid", {
    type = "animal",
    passive = true,
    hp_min = 10,
    hp_max = 10,
    armor = 100,
    -- FIXME: If the squid is near the floor, it turns black
    collisionbox = {-0.4, 0.1, -0.4, 0.4, 0.9, 0.4},
    visual = "mesh",
    mesh = "mobs_squid.b3d",
    textures = {
        {"squid.png"}
    },
    sounds = {
		damage = "mobs_mc_squid_hurt",
	},
    animation = {
		stand_start = 1,
		stand_end = 60,
		walk_start = 1,
		walk_end = 60,
		run_start = 1,
		run_end = 60,
	},
    drops = {
		{name = "dye:black",
		chance = 1,
		min = 1,
		max = 3,},
	},
    rotate = 180,
    visual_size = {x=1.5, y=1.5},
    makes_footstep_sound = false,
    stepheight = 1.1,
    fly = true,
    fly_in = "default:water_source",
    fall_speed = -2,
    view_range = 16,
    fall_damage = 1,
    water_damage = 0,
    lava_damage = 4,
    light_damage = 0,
    runaway = true,
    
})

-- Spawn near the water surface

local water = tonumber(minetest.setting_get("water_level")) or 0
--name, nodes, neighbours, minlight, maxlight, interval, chance, active_object_count, min_height, max_height
mobs:spawn_specific("mobs_mc:squid", {"default:water_source"}, {"default:water_source"}, 0, minetest.LIGHT_MAX, 30, 6000, 3, water-16, water)

-- compatibility
mobs:alias_mob("mobs:squid", "mobs_mc:squid")

-- spawn eggs
--mobs:register_egg("mobs_mc:squid", "Spawn Squid", "spawn_egg_squid.png")
mobs:register_egg("mobs_mc:squid", "Squid", "squid_inv.png", 0)
