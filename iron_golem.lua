--MCmobs v0.4
--maikerumine
--made for MC like Survival game
--License for code WTFPL and otherwise stated in readmes


--dofile(minetest.get_modpath("mobs").."/api.lua")
--###################
--################### IRON GOLEM
--###################



mobs:register_mob("mobs_mc:iron_golem", {
	type = "npc",
	passive = true,
	hp_min = 100,
	hp_max = 100,
	collisionbox = {-0.7, -0.01, -0.7, 0.7, 2.69, 0.7},
    rotate = -180,
	visual = "mesh",
	mesh = "mobs_mc_iron_golem.b3d",
	textures = {
		{"mobs_mc_iron_golem.png"},
	},
	visual_size = {x=3, y=3},
	makes_footstep_sound = true,
	sounds = {
		-- TODO
		distance = 16,
	},
	view_range = 16,
	stepheight = 1.1,
	owner = "",
	order = "follow",
	floats = 0,
	walk_velocity = 0.6,
	run_velocity = 1.2,
	-- Approximation
	damage = 14,
	group_attack = true,
	attacks_monsters = true,
	attack_type = "dogfight",
	drops = {
		{name = mobs_mc.items.iron_ingot,
		chance = 1,
		min = 3,
		max = 5,},
		{name = mobs_mc.items.poppy,
		chance = 1,
		min = 0,
		max = 2,},
	},
	drawtype = "front",
	water_damage = 0,
	lava_damage = 4,
	light_damage = 0,
	fall_damage = 0,
	animation = {
		stand_speed = 15, walk_speed = 15, run_speed = 25, punch_speed = 15,
		stand_start = 0,		stand_end = 0,
		walk_start = 0,		walk_end = 40,
		run_start = 0,		run_end = 40,
		punch_start = 40,  punch_end = 50,
	},
	jump = true,
	blood_amount = 0,
})


-- spawn eggs
mobs:register_egg("mobs_mc:iron_golem", "Iron Golem", "mobs_mc_spawn_icon_iron_golem.png", 0)


if minetest.settings:get_bool("log_mods") then
	minetest.log("action", "MC Iron Golem loaded")
end
