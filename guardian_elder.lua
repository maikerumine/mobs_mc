-- v1.1

--###################
--################### GUARDIAN ELDER
--###################

mobs:register_mob("mobs_mc:17guardian_elder", {
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
	mesh = "guardian.b3d",
	textures = {
		{"guardian_elder.png"},
	},
	visual_size = {x=4, y=4},
	walk_velocity = 0.6,
	run_velocity = 2,
	jump = true,
	animation = {
		speed_normal = 25,		speed_run = 50,
		stand_start = 0,		stand_end = 20,
		walk_start = 0,		walk_end = 20,
		run_start = 0,		run_end = 20,
	},
})

mobs:register_egg("mobs_mc:17guardian_elder", "Guardian Elder", "guardian_elder_inv.png", 0)

mobs:register_mob("mobs_mc:squid_mean", {
    type = "monster",
    passive = true,
    hp_min = 10,
    hp_max = 10,
    armor = 100,
    	passive = false,
	attack_type = "dogfight",
	pathfinding = true,
    view_range = 15,
	walk_velocity = 2,
	run_velocity = 4,
	damage = 2,
	group_attack = true,
    -- Note: This collision box is pretty generous because they can't be rotated yet, but at least it not confusing for the player.
    -- TODO: Make the hitbox smaller when Minetest supports rotation of collision boxes
    collisionbox = {-1.5, 1.3, -1.5, 1.5, 2.3, 1.5},
    visual = "mesh",
    mesh = "mobs_squid.b3d",
    textures = {
        {"mobs_squid.png^[colorize:purple:80"}
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
    visual_size = {x=4.5, y=4.5},
    makes_footstep_sound = false,
    stepheight = 0.1,
    fly = true,
    fly_in = "default:water_source",
    fall_speed = -3,
    view_range = 8,
    fall_damage = 1,
    water_damage = 0,
    lava_damage = 4,
    light_damage = 0,
    
})

--name, nodes, neighbours, minlight, maxlight, interval, chance, active_object_count, min_height, max_height
--mobs:spawn_specific("mobs_mc:squid", l_spawn_in, l_spawn_near, l_min_light, l_max_light, 30, 5000, 2, -31000, l_max_height )
mobs:register_spawn("mobs_mc:squid_mean",
	{"default:water_source"}, 20, -1, 5000, 2, -1000, true)
-- compatibility
mobs:alias_mob("mobs:squid", "mobs_mc:squid")

-- spawn eggs
mobs:register_egg("mobs_mc:squid_mean", "Spawn Mean Squid", "spawn_egg_squid.png")
