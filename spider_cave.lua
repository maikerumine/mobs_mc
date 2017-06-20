--MCmobs v0.2
--maikerumine
--made for MC like Survival game
--License for code WTFPL and otherwise stated in readmes


--dofile(minetest.get_modpath("mobs").."/api.lua")

--###################
--################### CAVE SPIDER
--###################



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


-- spawn eggs
--mobs:register_egg("mobs_mc:spider", "Spider", "mobs_cobweb.png", 1)
mobs:register_egg("mobs_mc:cavespider", "Cave Spider", "cave_spider_inv.png", 0)

if minetest.setting_get("log_mods") then
	minetest.log("action", "MC Spiders loaded")
end
