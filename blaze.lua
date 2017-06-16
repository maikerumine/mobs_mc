-- daufinsyd
-- My work is under the LGPL terms
-- Model and mobs_blaze.png see https://github.com/22i/minecraft-voxel-blender-models
-- blaze.lua partial copy of mobs_mc/ghast.lua



--dofile(minetest.get_modpath("mobs").."/api.lua")
--###################
--################### BLAZE
--###################
--[[
mobs:register_mob("mobs_mc:3blaze", {
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
	mesh = "blaze.b3d",
	textures = {
		{"blaze.png"},
	},
	visual_size = {x=3, y=3},
	walk_velocity = 0.6,
	run_velocity = 2,
	jump = true,
	animation = {
		speed_normal = 25,		speed_run = 50,
		stand_start = 0,		stand_end = 100,
        walk_start = 0,		walk_end = 100,
		run_start = 0,		run_end = 100,
	},
})

mobs:register_egg("mobs_mc:3blaze", "Blaze", "blaze_inv.png", 0)

]]


mobs:register_mob("mobs_mc:blaze", {
	type = "monster",
	hp_min = 20,
	hp_max = 20,
    collisionbox = {-0.35, -0.01, -0.35, 0.35, 2, 0.35},
    rotate = -180,
	visual = "mesh",
	mesh = "blaze.b3d",
	textures = {
		{"blaze.png"},
	},
	visual_size = {x=3, y=3},
	makes_footstep_sound = true,
	sounds = {
		random = "blaze_breath",
		death = "blaze_died",
		damage = "blaze_hurt1",
		attack = "default_punch3",
	},
	walk_velocity = .8,
	run_velocity = 1.6,
	damage = 6,
	pathfinding = 1,
	group_attack = true,
	drops = {
		{name = "mobs_mc:blaze_rod",
		chance = 1,
		min = 0,
		max = 1,},
	},
	animation = {
		stand_start = 1,
		stand_end = 40,
		walk_start = 1,
		walk_end = 40,
		run_start = 1,
		run_end = 40,
        shoot_start = 1,
        shoot_end = 40,
	},
	drawtype = "front",
	-- MC Wiki: 1 damage every half second
	water_damage = 2,
	lava_damage = 0,
	fall_damage = 0,
	light_damage = 0,
	view_range = 16,
	attack_type = "shoot",
    arrow = "mobs_mc:blaze_fireball",
    shoot_interval = 3.5,
    passive = false,
    jump = true,
	jump_height = 4,
    floats = 1,
    fly = true,
    jump_chance = 98,
    fear_height = 120,
})

--mobs:register_spawn("mobs_mc:blaze", {"mcl_core:lava_flowing", "mcl_nether:netherrack","air"}, 30, -1, 5000, 1, -1000)
mobs:register_spawn("mobs_mc:blaze",
	{"default:nitherbrick"}, 20, -1, 5000, 1, -1000, true)
	
-- Blaze fireball
mobs:register_arrow("mobs_mc:blaze_fireball", {
	visual = "sprite",
	visual_size = {x = 0.3, y = 0.3},
	textures = {"mcl_fire_fire_charge.png"},
	velocity = 12,

	-- Direct hit, no fire... just plenty of pain
	hit_player = function(self, player)
		player:punch(self.object, 1.0, {
			full_punch_interval = 1.0,
			damage_groups = {fleshy = 5},
		}, nil)
	end,

	hit_mob = function(self, player)
		player:punch(self.object, 1.0, {
			full_punch_interval = 1.0,
			damage_groups = {fleshy = 5},
		}, nil)
	end,

	-- Node hit, make fire
	hit_node = function(self, pos, node)
		local pos_above = {x=pos.x, y=pos.y+1, z=pos.z}
		if minetest.registered_nodes[minetest.get_node(pos_above).name].buildable_to then
			minetest.set_node(pos_above, {name="default:basic_flame"})
		end
	end
})

-- spawn eggs
--mobs:register_egg("mobs_mc:blaze", "Spawn Blaze", "spawn_egg_blaze.png")
mobs:register_egg("mobs_mc:blaze", "Blaze", "blaze_inv.png", 0)


minetest.register_craftitem("mobs_mc:blaze_rod", {
	description = "Blaze Rod",
	_doc_items_longdesc = "This is a crafting component dropped from dead blazes.",
	wield_image = "mcl_mobitems_blaze_rod.png",
	inventory_image = "mcl_mobitems_blaze_rod.png",
	groups = { craftitem = 1 },
	stack_max = 64,
})

minetest.register_craftitem("mobs_mc:blaze_powder", {
	description = "Blaze Powder",
	_doc_items_longdesc = "This item is mainly used for brewing potions and crafting.",
	wield_image = "mcl_mobitems_blaze_powder.png",
	inventory_image = "mcl_mobitems_blaze_powder.png",
	groups = { brewitem = 1 },
	stack_max = 64,
})



if minetest.settings:get_bool("log_mods") then
	minetest.log("action", "MC Blaze loaded")
end
