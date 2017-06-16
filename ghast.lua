--MCmobs v0.4
--maikerumine
--made for MC like Survival game
--License for code WTFPL and otherwise stated in readmes


--dofile(minetest.get_modpath("mobs").."/api.lua")

--###################
--################### GHAST
--###################
--[[
mobs:register_mob("mobs_mc:15ghast", {
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
	mesh = "ghast.b3d",
	textures = {
		{"ghast.png"},
	},
	visual_size = {x=4, y=4},
	walk_velocity = 0.6,
	run_velocity = 2,
	jump = true,
	animation = {
		speed_normal = 25,		speed_run = 25,
		stand_start = 0,		stand_end = 40,
		walk_start = 0,		walk_end = 40,
		run_start = 0,		run_end = 40,
	},
})

mobs:register_egg("mobs_mc:15ghast", "Ghast", "ghast_inv.png", 0)
]]

mobs:register_mob("mobs_mc:ghast", {
	type = "monster",
	pathfinding = true,
	group_attack = true,
	hp_min = 10,
	hp_max = 10,
    collisionbox = {-0.35, -0.01, -0.35, 0.35, 2, 0.35},
    rotate = -180,
	visual = "mesh",
	mesh = "ghast.b3d",
	textures = {
		{"ghast.png"},
	},
	visual_size = {x=4, y=4},
	blood_texture ="mobs_blood.png",
	makes_footstep_sound = true,
	sounds = {
		shoot = "mobs_fireball",
		death = "zombiedeath",
		damage = "ghast_damage",
		attack = "mobs_fireball",
		random = "mobs_eerie",
	},
	walk_velocity = .8,
	run_velocity = 2.6,
	drops = {
		{name = "tnt:gunpowder",
		chance = 3,
		min = 0,
		max = 2,},
		{name = "mobs_mc:ghast_tear",
		chance = 11,
		min = 0,
		max = 1,},
		{name = "mobs_mc:ghast_head",
		chance = 50,
		min = 0,
		max = 1,},
	},
	animation = {
		speed_normal = 25,		speed_run = 25,
		stand_start = 0,		stand_end = 40,
		walk_start = 0,		walk_end = 40,
		run_start = 0,		run_end = 40,
	},
	drawtype = "front",
	water_damage = 10,
	lava_damage = 0,
	light_damage = 0,
	fall_damage = 0,
	view_range = 16,
	--attack_type = "dogshoot",
	attack_type = "dogshoot",
	arrow = "mobs_monster:fireball",
	shoot_interval = 3.5,
	shoot_offset = 1,
		--'dogshoot_switch' allows switching between shoot and dogfight modes inside dogshoot using timer (1 = shoot, 2 = dogfight)
	--'dogshoot_count_max' number of seconds before switching above modes.
	dogshoot_switch = 1,
	dogshoot_count_max =1,
	passive = false,
	jump = true,
	jump_height = 4,
	floats=1,
	fly = true,
	jump_chance = 98,
	fear_height = 120,	
})


--mobs:register_spawn("mobs_mc:ghast", {"default:flowing_lava", "nether:rack","air"}, 17, -1, 5000, 1, -2000)
mobs:spawn_specific("mobs_mc:ghast", {"default:flowing_lava", "nether:rack"},{"air"},0, 17, 20, 8000, 2, -3610, -2100)
-- fireball (weapon)
mobs:register_arrow(":mobs_monster:fireball", {
	visual = "sprite",
	visual_size = {x = 0.5, y = 0.5},
	textures = {"mcl_mobitems_fireball.png"},
	velocity = 6,

	-- direct hit, no fire... just plenty of pain
	hit_player = function(self, player)
		player:punch(self.object, 1.0, {
			full_punch_interval = 1.0,
			damage_groups = {fleshy = 8},
		}, nil)
	end,

	hit_mob = function(self, player)
		player:punch(self.object, 1.0, {
			full_punch_interval = 1.0,
			damage_groups = {fleshy = 8},
		}, nil)
	end,

	-- node hit, bursts into flame
	hit_node = function(self, pos, node)
		mobs:explosion(pos, 1, 1, 0)
	end
})

minetest.register_craftitem("mobs_mc:ghast_tear", {
	description = "Ghast Tear",
	_doc_items_longdesc = "A ghast tear is an item used in potion brewing. It is dropped from dead ghasts.",
	wield_image = "mcl_mobitems_ghast_tear.png",
	inventory_image = "mcl_mobitems_ghast_tear.png",
	groups = { brewitem = 1 },
	stack_max = 64,
})


-- spawn eggs
--mobs:register_egg("mobs_mc:ghast", "Ghast", "ghast_front.png")
mobs:register_egg("mobs_mc:ghast", "Ghast", "ghast_inv.png", 0)

if minetest.settings:get_bool("log_mods") then
	minetest.log("action", "MC Ghast loaded")
end
