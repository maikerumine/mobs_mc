--MCmobs v0.2
--maikerumine
--made for MC like Survival game
--License for code WTFPL and otherwise stated in readmes


--dofile(minetest.get_modpath("mobs").."/api.lua")

--###################
--################### WITCH
--###################
--[[
mobs:register_mob("mobs_mc:62witch", {
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
	mesh = "witch.b3d",
	textures = {
		{"witch.png"},
	},
	visual_size = {x=3, y=3},
	walk_velocity = 0.6,
	run_velocity = 2,
	jump = true,
	animation = {
		speed_normal = 25,		speed_run = 50,
		stand_start = 0,		stand_end = 0,
		walk_start = 0,		walk_end = 40,
		run_start = 0,		run_end = 40,
	},
})
]]



mobs:register_mob("mobs_mc:witch", {
	type = "monster",
	hp_min = 35,
	hp_max = 75,
    collisionbox = {-0.35, -0.01, -0.35, 0.35, 2, 0.35},
    rotate = -180,
	visual = "mesh",
	mesh = "witch.b3d",
	textures = {
		{"witch.png"},
	},
	visual_size = {x=3, y=3},
	makes_footstep_sound = true,
	damage = 2,
	walk_velocity = 1.2,
	run_velocity = 2.4,
	damage = 1,
		group_attack = true,
		attack_type = "dogfight",
	drops = {
		{name = "default:apple",
		chance = 10,
		min = 1,
		max = 2,},
	},
	armor = 90,
	sounds = {
		random = "Villager1",
		death = "Villagerdead",
		damage = "Villagerhurt1",
	},
	animation = {
		speed_normal = 30,
		speed_run = 60,
		stand_start = 0,
		stand_end = 23,
		walk_start = 24,
		walk_end = 49,
		run_start = 24,
		run_end = 49,
		hurt_start = 85,
		hurt_end = 115,
		death_start = 117,
		death_end = 145,
		shoot_start = 50,
		shoot_end = 82,
	},
	drawtype = "front",
	water_damage = 1,
	lava_damage = 5,
	light_damage = 0,
	view_range = 16,
	fear_height = 5,

})

mobs:register_spawn("mobs_mc:witch", {"default:dirt_with_rainforest_litter"}, 20, 8, 9500, 2, 31000)


-- compatibility


-- spawn eggs
--mobs:register_egg("mobs_mc:witch", "Villager", "spawn_egg_villager.png")
mobs:register_egg("mobs_mc:witch", "Witch", "witch_inv.png", 0)

if minetest.setting_get("log_mods") then
	minetest.log("action", "MC mobs loaded")
end