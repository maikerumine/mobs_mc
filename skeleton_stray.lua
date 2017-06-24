--MCmobs v0.4
--maikerumine
--made for MC like Survival game
--License for code WTFPL and otherwise stated in readmes


--dofile(minetest.get_modpath("mobs").."/api.lua")


--###################
--################### STRAY SKELETON
--###################



mobs:register_mob("mobs_mc:stray", {
	type = "monster",
	hp_min = 20,
	hp_max = 20,
	pathfinding = true,
	group_attack = true,
    collisionbox = {-0.35, -0.01, -0.35, 0.35, 2, 0.35},
    rotate = -180,
	visual = "mesh",
	mesh = "strayskeleton.b3d",
	textures = {
		{"stray.png"},
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
	damage = 2,
	drops = {
		{name = mobs_mc.items.arrow,
		chance = 1,
		min = 0,
		max = 2,},
		{name = mobs_mc.items.bow,
		chance = 11,
		min = 1,
		max = 1,},
		{name = mobs_mc.items.bone,
		chance = 1,
		min = 0,
		max = 2,},
		{name = "mobs_mc:skeleton_head",
		chance = 50,
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
	attack_type = "dogshoot",
	arrow = "mobs_mc:arrow_entity",
	shoot_interval = 2.5,
	shoot_offset = 1,
	--'dogshoot_switch' allows switching between shoot and dogfight modes inside dogshoot using timer (1 = shoot, 2 = dogfight)
	--'dogshoot_count_max' number of seconds before switching above modes.
	dogshoot_switch = 1,
	dogshoot_count_max =3,
})

--spawn
mobs:spawn_specific("mobs_mc:stray", mobs_mc.spawn.snow, {"air"}, minetest.LIGHT_MAX+1, minetest.LIGHT_MAX+1, 20, 9000, 2, -110, 31000)

-- spawn eggs
mobs:register_egg("mobs_mc:stray", "Stray", "stray_inv.png", 0)

if minetest.settings:get_bool("log_mods") then
	minetest.log("action", "MC Stray Skeleton loaded")
end
