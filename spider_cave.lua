--MCmobs v0.2
--maikerumine
--made for MC like Survival game
--License for code WTFPL and otherwise stated in readmes


--dofile(minetest.get_modpath("mobs").."/api.lua")

--###################
--################### CAVE SPIDER
--###################
--[[
mobs:register_mob("mobs_mc:38cavespider", {
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
	mesh = "spider.b3d",
	textures = {
		{"cave_spider.png"},
	},
	visual_size = {x=2, y=2},
	walk_velocity = 0.6,
	run_velocity = 2,
	jump = true,
	animation = {
		speed_normal = 25,		speed_run = 50,
		stand_start = 40,		stand_end = 80,
		walk_start = 0,		walk_end = 40,
		run_start = 0,		run_end = 40,
	},
})

mobs:register_egg("mobs_mc:38cavespider", "Cave Spider", "cave_spider_inv.png", 0)
]]


-- Spider by AspireMint (fishyWET (CC-BY-SA 3.0 license for texture)
mobs:register_mob("mobs_mc:cavespider", {
	type = "monster",
	passive = false,
	attack_type = "dogfight",
	pathfinding = true,
	damage = 2,
	hp_min = 12,
	hp_max = 12,
	collisionbox = {-0.9, -0.01, -0.7, 0.7, 0.6, 0.7},
    rotate = -180,
	visual = "mesh",
	mesh = "spider.b3d",
	textures = {
		{"cave_spider.png"},
	},
	visual_size = {x=2, y=2},
	makes_footstep_sound = false,
	sounds = {
		random = "mobs_spider",
		attack = "mobs_spider",
	},
	walk_velocity = 1.7,
	run_velocity = 3.3,
	jump = true,
	view_range = 16,
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
		{name = "mobs_mc:spider_eye",
		chance = 1, min = 0, max = 1,},
		{name = "mobs_mc:spider_head",
		chance = 50,
		min = 0,
		max = 1,},
	},
	water_damage = 5,
	lava_damage = 50,
	light_damage = 0,
	fear_height = 14,
	animation = {
		speed_normal = 25,		speed_run = 50,
		stand_start = 40,		stand_end = 80,
		walk_start = 0,		walk_end = 40,
		run_start = 0,		run_end = 40,
	},
})
mobs:register_spawn("mobs_mc:cavespider", {"default:mossycobble" ,"default:wood","default:cobble"}, 4, -1, 17000, 2, -35)

--[[
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

minetest.register_craftitem("mobs_mc:spider_eye", {
	description = "Spider Eye",
	_doc_items_longdesc = "Spider eyes are used mainly in crafting and brewing. If you're really desperate, you can eat a spider eye for 2 hunger points, but it will poison you.",
	inventory_image = "mcl_mobitems_spider_eye.png",
	wield_image = "mcl_mobitems_spider_eye.png",
	on_place = minetest.item_eat(2),
	on_secondary_use = minetest.item_eat(2),
	groups = { food = 2, eatable = 2 },
	stack_max = 64,
})
]]


-- spawn eggs
--mobs:register_egg("mobs_mc:spider", "Spider", "mobs_cobweb.png", 1)
mobs:register_egg("mobs_mc:cavespider", "Cave Spider", "cave_spider_inv.png", 0)

if minetest.settings:get_bool("log_mods") then
	minetest.log("action", "MC Spiders loaded")
end
