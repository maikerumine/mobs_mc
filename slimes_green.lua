--MCmobs v0.4
--maikerumine
--made for MC like Survival game
--License for code WTFPL and otherwise stated in readmes


--dofile(minetest.get_modpath("mobs").."/api.lua")


--###################
--################### SLIME
--###################
--[[
mobs:register_mob("mobs_mc:11slime", {
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
	mesh = "slime.b3d",
	textures = {
		{"slime.png"},
	},
	visual_size = {x=8, y=8},
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

mobs:register_egg("mobs_mc:11slime", "Slime", "slime_inv.png", 0)
]]

mobs:register_mob("mobs_mc:slimesmall", {
	type = "monster",
	pathfinding = true,
	group_attack = true,
	hp_max = 5,
	collisionbox = {-0.2, -0.4, -0.2, 0.2, 0.2, 0.2},
	visual_size = {x=0.5, y=0.5},
	textures = {
	{"green_slime_top.png", "green_slime_bottom.png", "green_slime_front.png", "green_slime_sides.png", "green_slime_sides.png", "green_slime_sides.png"}
	},
	visual = "cube",
	blood_texture ="green_slime_blood.png",
	rotate = 270,
	makes_footstep_sound = true,
	sounds = {
		jump = "green_slime_jump",
		death = "green_slime_death",
		damage = "green_slime_damage",
		attack = "green_slime_attack",
	},
	walk_velocity = .8,
	run_velocity = 2.6,
	damage = 1,
	armor = 100,
	drops = {
		{name = "mesecons_materials:glue 1",
		chance = 3,
		min = 1,
		max = 4,},
		{name = "default:grass",
		chance = 1,
		min = 1,
		max = 5,},
	},
	animation = {
		speed_normal = 24,
		speed_run = 48,
		stand_start = 0,
		stand_end = 23,
		walk_start = 24,
		walk_end = 47,
		run_start = 48,
		run_end = 62,
		hurt_start = 64,
		hurt_end = 86,
		death_start = 88,
		death_end = 118,
	},
	drawtype = "front",
	water_damage = 0,
	lava_damage = 10,
	light_damage = 0,
	fall_damage = 0,
	view_range = 16,
	attack_type = "dogfight",
	passive = false,
	jump = true,
	jump_height = 4,
	jump_chance = 98,
	fear_height = 12,	
})

mobs:register_mob("mobs_mc:slimemedium", {
	type = "monster",
	pathfinding = true,
	group_attack = true,
	hp_max = 10,
	collisionbox = {-0.55, -0.55, -0.55, 0.55, 0.55, 0.55},
	visual_size = {x=1.0, y=1.0},
	textures = {
	{"green_slime_top.png", "green_slime_bottom.png", "green_slime_front.png", "green_slime_sides.png", "green_slime_sides.png", "green_slime_sides.png"}
	},
	visual = "cube",
	blood_texture ="green_slime_blood.png",
	rotate = 270,
	makes_footstep_sound = true,
	sounds = {
		jump = "green_slime_jump",
		death = "green_slime_death",
		damage = "green_slime_damage",
		attack = "green_slime_attack",
	},
	walk_velocity = .8,
	run_velocity = 2.0,
	damage = 2,
	armor = 100,
	drops = {
		{name = "default:mossycobble",
		chance = 2,
		min = 1,
		max = 1,},
		{name = "default:leaves",
		chance = 1,
		min = 1,
		max = 5,},
	},
	animation = {
		speed_normal = 24,
		speed_run = 48,
		stand_start = 0,
		stand_end = 23,
		walk_start = 24,
		walk_end = 47,
		run_start = 48,
		run_end = 62,
		hurt_start = 64,
		hurt_end = 86,
		death_start = 88,
		death_end = 118,
	},
	drawtype = "front",
	water_damage = 0,
	lava_damage = 10,
	light_damage = 0,
	fall_damage = 0,
	view_range = 16,
	attack_type = "dogfight",
	passive = false,
	jump = true,
	jump_height = 8,
	jump_chance = 100,
	fear_height = 60,
	on_die =function(self, pos)
		lavasmall = minetest.add_entity(self.object:getpos(), "mobs_mc:greensmall")
		lavasmall = minetest.add_entity(self.object:getpos(), "mobs_mc:greensmall")
		lavasmall = minetest.add_entity(self.object:getpos(), "mobs_mc:greensmall")
		lavasmall = minetest.add_entity(self.object:getpos(), "mobs_mc:greensmall")
			ent = lavasmall:get_luaentity()
			end
})

mobs:register_mob("mobs_mc:slimebig", {
	type = "monster",
	pathfinding = true,
	group_attack = true,
	hp_max = 25,
	collisionbox = {-0.75, -0.75, -0.75, 0.75, 0.75, 0.75},
	visual_size = {x=1.5, y=1.5},
	textures = {
	{"green_slime_top.png", "green_slime_bottom.png", "green_slime_front.png", "green_slime_sides.png", "green_slime_sides.png", "green_slime_sides.png"}
	},
	visual = "cube",
	blood_texture ="green_slime_blood.png",
	rotate = 270,
	makes_footstep_sound = true,
	sounds = {
		jump = "green_slime_jump",
		death = "green_slime_death",
		damage = "green_slime_damage",
		attack = "green_slime_attack",
	},
	walk_velocity = .8,
	run_velocity = 1.6,
	damage = 3,
	armor = 100,
	drops = {
		{name = "default:leaves",
		chance = 2,
		min = 1,
		max = 1,},
		{name = "default:papyrus",
		chance = 1,
		min = 1,
		max = 5,},
	},
	animation = {
		speed_normal = 24,
		speed_run = 48,
		stand_start = 0,
		stand_end = 23,
		walk_start = 24,
		walk_end = 47,
		run_start = 48,
		run_end = 62,
		hurt_start = 64,
		hurt_end = 86,
		death_start = 88,
		death_end = 118,
	},
	drawtype = "front",
	water_damage = 0,
	lava_damage = 10,
	light_damage = 0,
	fall_damage = 0,
	view_range = 16,
	attack_type = "dogfight",
	passive = false,
	jump = true,
	jump_height = 8,
	jump_chance = 100,
	fear_height = 60,
	on_die =function(self, pos)
		lavasmall = minetest.add_entity(self.object:getpos(), "mobs_mc:slimemedium")
		lavasmall = minetest.add_entity(self.object:getpos(), "mobs_mc:slimemedium")
			ent = lavasmall:get_luaentity()
			end
})
mobs:register_spawn("mobs_mc:slimesmall", {"default:flowing_water", "default:mossycobble"}, 7, -1, 5000, 4, 31000)
mobs:register_spawn("mobs_mc:slimemedium", {"default:flowing_water", "default:mossycobble"}, 7, -1, 5000, 4, 31000)
mobs:register_spawn("mobs_mc:slimebig", {"default:flowing_water", "default:mossycobble"}, 7, -1, 5000, 4, 31000)



-- compatibility
mobs:alias_mob("mobs_mc:greensmall", "mobs_mc:slimesmall")
mobs:alias_mob("mobs_mc:greenmediuml", "mobs_mc:slimemedium")
mobs:alias_mob("mobs_mc:greenbig", "mobs_mc:slimebig")



-- spawn eggs
--mobs:register_egg("mobs_mc:greenbig", "Green Slime", "spawn_egg_slime.png")
mobs:register_egg("mobs_mc:slimebig", "Slime", "slime_inv.png", 0)

if minetest.setting_get("log_mods") then
	minetest.log("action", "MC Slimes loaded")
end