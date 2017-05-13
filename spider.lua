--MCmobs v0.2
--maikerumine
--made for MC like Survival game
--License for code WTFPL and otherwise stated in readmes


--dofile(minetest.get_modpath("mobs").."/api.lua")

-- Spider by AspireMint (fishyWET (CC-BY-SA 3.0 license for texture)
mobs:register_mob("mobs_mc:spider", {
	type = "monster",
	passive = false,
	attack_type = "dogfight",
	pathfinding = true,
	damage = 2,
	hp_min = 12,
	hp_max = 20,
	armor = 100,
	collisionbox = {-0.9, -0.01, -0.7, 0.7, 0.6, 0.7},
	visual = "mesh",
	mesh = "mobs_spider.x",
	textures = {
		{"mobs_spider.png"}
	},
	visual_size = {x=5,y=5},
	makes_footstep_sound = false,
	sounds = {
		random = "mobs_spider",
		attack = "mobs_spider",
	},
	walk_velocity = 1.7,
	run_velocity = 3.3,
	jump = true,
	view_range = 15,
	floats = 0,
	group_attack = true,
		replace_rate = 5,
	replace_what = {"default:torch"},
	replace_with = "air",
	replace_offset = -1,
	peaceful = false,
    drops = {
		{name = "farming:string",
		chance = 1, min = 1, max = 5,},
		{name = "mobs:meat_raw",
		chance = 1, min = 0, max = 1,},
		{name = "mobs_mc:spider_head",
		chance = 10,
		min = 0,
		max = 1,},
	},
	water_damage = 5,
	lava_damage = 50,
	light_damage = 0,
	fear_height = 14,
	animation = {
		speed_normal = 15,		speed_run = 15,
		stand_start = 1,		stand_end = 1,
		walk_start = 20,		walk_end = 40,
		run_start = 20,			run_end = 40,
		punch_start = 50,		punch_end = 90,
	},
})
mobs:register_spawn("mobs_mc:spider", {"default:stone" ,"default:gravel","default:cobble","group:crumbly", "group:cracky", "group:choppy", "group:snappy"}, 4, -1, 17000, 2, 3000)


-- Cobweb
minetest.register_node(":mobs:cobweb", {
	description = "Cobweb",
	drawtype = "plantlike",
	visual_scale = 1.1,
	tiles = {"mobs_cobweb.png"},
	inventory_image = "mobs_cobweb.png",
	paramtype = "light",
	sunlight_propagates = true,
	liquid_viscosity = 11,
	liquidtype = "source",
	liquid_alternative_flowing = "mobs:cobweb",
	liquid_alternative_source = "mobs:cobweb",
	liquid_renewable = false,
	liquid_range = 0,
	walkable = false,
	groups = {snappy=1,liquid=3},
	drop = "farming:cotton",
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_craft({
	output = "mobs:cobweb",
	recipe = {
		{"farming:string", "", "farming:string"},
		{"", "farming:string", ""},
		{"farming:string", "", "farming:string"},
	}
})


-- compatibility
mobs:alias_mob("mobs:spider", "mobs_mc:spider")
mobs:alias_mob("esmobs:spider", "mobs_mc:spider")

-- spawn eggs
mobs:register_egg("mobs_mc:spider", "Spider", "mobs_cobweb.png", 1)


if minetest.settings:get("log_mods") then
	minetest.log("action", "MC Spiders loaded")
end