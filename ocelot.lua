--MCmobs v0.4
--maikerumine
--made for MC like Survival game
--License for code WTFPL and otherwise stated in readmes


--dofile(minetest.get_modpath("mobs").."/api.lua")


--###################
--################### OCELOT - CAT
--###################


--mcocelot
mobs:register_mob("mobs_mc:ocelot", {
	type = "animal",
	hp_min = 10,
	hp_max = 10,
	collisionbox = {-0.3, -0.01, -0.3, 0.3, 0.69, 0.3},
	rotate = -180,
	visual = "mesh",
	mesh = "cat.b3d",
	textures = {{"cat.png"},{"cat1.png"},{"cat2.png"},{"cat3.png"},{"cat4.png"}},
	visual_size = {x=2.0, y=2.0},
	makes_footstep_sound = true,
	walk_velocity = 1,
	run_velocity = 3,
	drawtype = "front",
	floats = 1,
	water_damage = 0,
	lava_damage = 4,
	light_damage = 0,
	fear_height = 4,
	sounds = {
		random = "mobs_kitten",
	},
	animation = {
		speed_normal = 25,		speed_run = 50,
		stand_start = 0,		stand_end = 0,
		walk_start = 0,		walk_end = 40,
		run_start = 0,		run_end = 40,
		distance = 16,
	},
	follow = mobs_mc.follow.ocelot,
	view_range = 12,
	passive = false,
	attack_type = "dogfight",
	pathfinding = 1,
	damage = 2,
	attack_animals = true,
	specific_attack = { "mobs_mc:chicken" },
})

--spawn
-- TODO: Increase spawn chance if polished
mobs:register_spawn("mobs_mc:ocelot", mobs_mc.spawn.jungle, minetest.LIGHT_MAX+1, 0, 20000, 2, 31000)

-- compatibility
mobs:alias_mob("mobs:kitten", "mobs_mc:ocelot")

-- spawn eggs
mobs:register_egg("mobs_mc:ocelot", "Ocelot", "cat_inv.png", 0)

if minetest.settings:get_bool("log_mods") then
	minetest.log("action", "MC Ocelot loaded")
end
