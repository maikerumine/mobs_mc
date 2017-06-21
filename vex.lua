--MCmobs v0.4
--maikerumine
--made for MC like Survival game
--License for code WTFPL and otherwise stated in readmes


--dofile(minetest.get_modpath("mobs").."/api.lua")
--###################
--################### VEX
--###################



mobs:register_mob("mobs_mc:vex", {
	type = "monster",
	pathfinding = 1,
	passive = false,
	group_attack = true,
	attack_type = "dogfight",
	physical = false,
	hp_min = 14,
	hp_max = 14,
	--collisionbox = {-0.4, -0.01, -0.4, 0.4, 1.95, 0.4},
	collisionbox = {-0.2, 0.01, -0.2, 0.2, 0.7, 0.2},  --bat
	rotate = -180,
	visual = "mesh",
	mesh = "vex.b3d",
	textures = {
		{"vex.png"},
	},
	visual_size = {x=1.5, y=1.5},
	makes_footstep_sound = true,
	damage = 9,
	view_range = 16,
	walk_velocity = 3.2,
	run_velocity = 5.9,
		group_attack = true,
		attack_type = "dogfight",
	drops = {
		{name = "mobs_mc:totem",
		chance = 10,
		min = 0,
		max = 1,},
	},
	armor = 160,
		sounds = {
		random = "mobs_rat",
		death = "green_slime_death",
		},
	animation = {
		speed_normal = 25,		speed_run = 50,
		stand_start = 40,		stand_end = 80,
		walk_start = 0,		walk_end = 40,
		run_start = 0,		run_end = 40,
	},
	drawtype = "front",
	water_damage = 1,
	lava_damage = 5,
	light_damage = 0,
	--floats=1,
	fly = true,
	fly_in = {'default:void', "air"},
	jump_chance = 15,
	fear_height = 16,
	replace_rate = 4,
	replace_what = {"default:torch","mg_villages:torch", "default:torch_wall","mg_villages:torch_wall"},
	replace_with = "air",
	replace_offset = -1,

})


-- spawn eggs
mobs:register_egg("mobs_mc:vex", "Vex", "vex_inv.png", 0)


if minetest.settings:get_bool("log_mods") then
	minetest.log("action", "MC Vex loaded")
end
