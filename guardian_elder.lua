-- v1.4

--###################
--################### GUARDIAN
--###################

mobs:register_mob("mobs_mc:guardian_elder", {
    type = "monster",
    stepheight = 1.2,
	hp_min = 80,
	hp_max = 80,
    	passive = false,
	attack_type = "dogfight",
	pathfinding = true,
    view_range = 16,
	walk_velocity = 2,
	run_velocity = 4,
	damage = 8,
	group_attack = true,
    -- Note: This collision box is pretty generous because they can't be rotated yet, but at least it not confusing for the player.
    -- TODO: Make the hitbox smaller when Minetest supports rotation of collision boxes
    collisionbox = {-0.35, -0.01, -0.35, 0.35, 2, 0.35},
    rotate = -180,
	visual = "mesh",
	mesh = "mobs_mc_guardian.b3d",
	textures = {
		{"mobs_mc_guardian_elder.png"},
	},
	visual_size = {x=4, y=4},
    sounds = {
		damage = "mobs_mc_squid_hurt",
	},
	animation = {
		speed_normal = 25,		speed_run = 50,
		stand_start = 0,		stand_end = 20,
		walk_start = 0,		walk_end = 20,
		run_start = 0,		run_end = 20,
	},
    drops = {
		-- TODO: Implement correct drops
		{name = mobs_mc.items.black_dye,
		chance = 1,
		min = 1,
		max = 3,},
	},
    rotate = 180,
    visual_size = {x=4.5, y=4.5},
    makes_footstep_sound = false,
    stepheight = 2.1,
    fly = true,
	--floats=1,
    fly_in = mobs_mc.items.water_source,
    fall_speed = -2,
    view_range = 8,
    fall_damage = 1,
    water_damage = 0,
    lava_damage = 4,
    light_damage = 0,
    
})

mobs:register_spawn("mobs_mc:guardian_elder", mobs_mc.spawn.water, minetest.LIGHT_MAX+1, 0, 5000, 2, -1000, true)

-- spawn eggs
mobs:register_egg("mobs_mc:guardian_elder", "Guardian Elder", "mobs_mc_spawn_icon_guardian_elder.png", 0)

