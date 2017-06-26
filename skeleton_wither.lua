--MCmobs v0.4
--maikerumine
--made for MC like Survival game
--License for code WTFPL and otherwise stated in readmes


--dofile(minetest.get_modpath("mobs").."/api.lua")


--###################
--################### WITHER SKELETON
--###################



mobs:register_mob("mobs_mc:witherskeleton", {
	type = "monster",
	hp_min = 20,
	hp_max = 20,
	pathfinding = true,
	group_attack = true,
    collisionbox = {-0.35, -0.01, -0.35, 0.35, 2, 0.35},
    rotate = -180,
	visual = "mesh",
	mesh = "mobs_mc_wither_skeleton.b3d",
	textures = {
		{"witherskeleton.png"},
	},
	visual_size = {x=3, y=3},
	makes_footstep_sound = true,
	sounds = {
		random = "skeleton1",
		death = "skeletondeath",
		damage = "skeletonhurt1",
	},
	walk_velocity = 1.2,
	run_velocity = 2.4,
	damage = 7,
	drops = {
		{name = mobs_mc.items.coal,
		chance = 1,
		min = 0,
		max = 1,},
		{name = mobs_mc.items.bone,
		chance = 1,
		min = 0,
		max = 2,},
		{name = "mobs_mc:skeleton_head2",
		chance = 200,
		min = 0,
		max = 1,},
	},
	animation = {
		stand_start = 0,
		stand_end = 40,
        speed_stand = 5,
		walk_start = 40,
		walk_end = 60,
        speed_walk = 50,
        shoot_start = 70,
        shoot_end = 90,
        punch_start = 70,
        punch_end = 90,
        die_start = 120,
        die_end = 130,
        speed_die = 5,
        hurt_start = 100,
		hurt_end = 120,
	},
	drawtype = "front",
	water_damage = 1,
	lava_damage = 5,
	light_damage = 1,
	view_range = 16,
	attack_type = "dogfight",
	arrow = "mobs_mc:arrow_entity",
	shoot_interval = 2.5,
	shoot_offset = 1,
	--'dogshoot_switch' allows switching between shoot and dogfight modes inside dogshoot using timer (1 = shoot, 2 = dogfight)
	--'dogshoot_count_max' number of seconds before switching above modes.
	dogshoot_switch = 1,
	dogshoot_count_max =0.5,
})

--spawn
mobs:register_spawn("mobs_mc:witherskeleton", mobs_mc.spawn.nether_fortress, 7, 0, 5000, 3, -3000, true)
-- spawn eggs
mobs:register_egg("mobs_mc:witherskeleton", "Wither Skeleton", "witherskeleton_inv.png", 0)

if minetest.settings:get_bool("log_mods") then
	minetest.log("action", "MC Wither Skeleton loaded")
end
