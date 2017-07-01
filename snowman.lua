--MCmobs v0.4
--maikerumine
--made for MC like Survival game
--License for code WTFPL and otherwise stated in readmes

mobs:register_mob("mobs_mc:snowman", {
	type = "npc",
	passive = true,
	hp_min = 4,
	hp_max = 4,
	pathfinding = 1,
	view_range = 16,
	fall_damage = 0,
	water_damage = 4,
	lava_damage = 20,
	attacks_monsters = true,
	collisionbox = {-0.35, -0.01, -0.35, 0.35, 1.89, 0.35},
	visual = "mesh",
	mesh = "mobs_mc_snowman.b3d",
	textures = {
		{"mobs_mc_snowman.png^mobs_mc_snowman_pumpkin.png"},
	},
	gotten_texture = "mobs_mc_snowman.png",
	drops = {{ name = mobs_mc.items.snowball, chance = 1, min = 0, max = 15 }},
	visual_size = {x=3, y=3},
	walk_velocity = 0.6,
	run_velocity = 2,
	jump = true,
	animation = {
		speed_normal = 25,
		speed_run = 50,
		stand_start = 20,
		stand_end = 40,
		walk_start = 0,
		walk_end = 20,
		run_start = 0,
		run_end = 20,
		die_start = 40,
		die_end = 50,
		die_loop = false,
	},
	blood_amount = 0,
})

mobs:register_egg("mobs_mc:snowman", "Snow Golem", "mobs_mc_spawn_icon_snowman.png", 0)

if minetest.settings:get_bool("log_mods") then
	minetest.log("action", "MC Snow Golem loaded")
end
