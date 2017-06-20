--License for code WTFPL and otherwise stated in readmes

mobs:register_mob("mobs_mc:bat", {
	type = "animal",
	passive = true,
	hp_min = 6,
	hp_max = 6,
	collisionbox = {-0.25, -0.01, -0.25, 0.25, 0.89, 0.25},
	rotate = -180,
	visual = "mesh",
	mesh = "bat.b3d",
	textures = {
		{"bat.png"},
	},
	visual_size = {x=1, y=1},
	sounds = {
		random = "mobs_rat",
		distance = 16,
	},
	walk_velocity = 3,
	run_velocity = 3,
	animation = {
		speed_normal = 80,		speed_run = 80,
		stand_start = 0,		stand_end = 40,
		walk_start = 0,		walk_end = 40,
		run_start = 0,		run_end = 40,
	},

	water_damage = 1,
	lava_damage = 4,
	light_damage = 0,
	fall_damage = 0,
	view_range = 16,

	fly = true,
	fly_in = "air",
})


-- Spawn on solid blocks below Sea level and light level 3
mobs:spawn_specific("mobs_mc:bat", {"default:stone", "group:cracky", "group:crumbly"},{"air"},0, 3, 20, 5000, 2, -500, -1)


-- spawn eggs
mobs:register_egg("mobs_mc:bat", "Bat", "bat_inv.png", 0)


if minetest.setting_get("log_mods") then
	minetest.log("action", "MC Bat loaded")
end
