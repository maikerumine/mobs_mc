
	
--###################
--################### ENDERDRAGON
--###################
--[[
mobs:register_mob("mobs_mc:12enderdragon", {
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
	mesh = "enderdragon.b3d",
	textures = {
		{"enderdragon.png"},
	},
	visual_size = {x=1, y=1},
	walk_velocity = 0.6,
	run_velocity = 2,
	jump = true,
	animation = {
		speed_normal = 25,		speed_run = 50,
		stand_start = 0,		stand_end = 20,
		walk_start = 0,		walk_end = 20,
		run_start = 0,		run_end = 20,
	},
})

mobs:register_egg("mobs_mc:12enderdragon", "Enderdragon", "enderdragon_inv.png", 0)	
]]
mobs:register_mob("mobs_mc:enderdragon", {
	type = "monster",
	pathfinding = 1,
	attacks_animals = true,
	walk_chance = 88,
	hp_max = 200,
	hp_min = 200,
	--collisionbox = {-0.35, 0.51, -0.35, 0.35, 1.61, 0.35},
	--collisionbox = {-0.5, 0.5, -0.5, 0.5, 1.2, 0.5},
	collisionbox = {-0.5, 0.01, -0.5, 0.5, 1.2, 0.5},
    rotate = -180,
	visual = "mesh",
	mesh = "enderdragon.b3d",
	textures = {
		{"enderdragon.png"},
	},
	visual_size = {x=1, y=1},
	makes_footstep_sound = true,
	view_range = 35,
	walk_velocity = 2,
	run_velocity = 4,
    sounds = {
		shoot_attack = "mesed",
		attack = "mese_dragon",
		distance = 60,
	},
	physical = true,
	damage = 10,
	jump = true,
	jump_height = 14,
	stepheight = 1.2,
	jump_chance = 100,
	fear_height = 120,	
	fly = true,
	fly_in = {'default:void', "air"},
	dogshoot_switch = 1,
	dogshoot_count_max =5,
	dogshoot_count2_max = 5,
	passive = false,
	attack_animals = true,
	--floats=1,
	floats=1,
	drops = {
		{name = "mobs_mc:dragon_egg",
		chance = 1,
		min = 1,
		max = 1},
		{name = "default:mese_crystal",
		chance = 1,
		min = 99,
		max = 99},

    },
	drawtype = "front",
	water_damage = 0,
	lava_damage = 0,
	light_damage = 0,
	on_rightclick = nil,
	attack_type = "dogshoot",
	--explosion_radius = 14,
	--dogshoot_stop = true,
	--arrow = "mobs:roar_of_the_dragon",
	--arrow = "mobs_mc:roar_of_the_dragon",
	--arrow = "mobs:fireball",
	arrow = "mobs_mc:fireball2",
	--reach = 5,
	shoot_interval = 0.5,
	shoot_offset = -1,
	animation = {
		speed_normal = 25,		speed_run = 50,
		stand_start = 0,		stand_end = 20,
		walk_start = 0,		walk_end = 20,
		run_start = 0,		run_end = 20,
	},
	replace_rate = 1,
	replace_what = {"default:torch","default:torch_wall", "default:obsidian"},
	replace_with = "air",
	replace_offset = -1,


})



mobs:register_arrow("mobs_mc:roar_of_the_dragon2", {
	visual = "sprite",
	visual_size = {x = 1, y = 1},
	--textures = {"transparent.png"},
	textures = {"mese_egg.png"},
	velocity = 10,

	on_step = function(self, dtime)

		local pos = self.object:getpos()

		local n = minetest.env:get_node(pos).name

		if self.timer == 0 then
			self.timer = os.time()
		end

		if os.time() - self.timer > 8 or minetest.is_protected(pos, "") then
			self.object:remove()
		end

		local objects = minetest.env:get_objects_inside_radius(pos, 1)
	    for _,obj in ipairs(objects) do
			local name = obj:get_entity_name()
			if name~="mobs_mc:roar_of_the_dragon2" and name ~= "mobs_mc:enderdragon" then
		        obj:set_hp(obj:get_hp()-0.05)
		        if (obj:get_hp() <= 0) then
		            if (not obj:is_player()) and name ~= self.object:get_luaentity().name then
		                obj:remove()
		            end
		        end
			end
	    end

		minetest.env:set_node(pos, {name="air"})
		if math.random(1,2)==1 then
			dx = math.random(-1,1)
			dy = math.random(-1,1)
			dz = math.random(-1,1)
			local p = {x=pos.x+dx, y=pos.y+dy, z=pos.z+dz}
			minetest.env:set_node(p, {name="air"})
		end
	end
})
--GOOD LUCK LOL!
-- fireball (weapon)
mobs:register_arrow(":mobs_mc:fireball2", {
	visual = "sprite",
	visual_size = {x = 1.5, y = 1.5},
	textures = {"fire_basic_flame.png"},
	--textures = {"mobs_skeleton2_front.png^[makealpha:255,255,255 "},
	velocity = 6,

	-- direct hit, no fire... just plenty of pain
	hit_player = function(self, player)
	minetest.sound_play("tnt_explode", {pos = pos, gain = 1.5, max_hear_distance = 2*64})
		player:punch(self.object, 1.0, {
			full_punch_interval = 0.5,
			damage_groups = {fleshy = 6},
		}, nil)

	end,

	hit_mob = function(self, player)
	minetest.sound_play("tnt_explode", {pos = pos, gain = 1.5, max_hear_distance = 2*64})
		player:punch(self.object, 1.0, {
			full_punch_interval = 0.5,
			damage_groups = {fleshy = 12},
		}, nil)
		
	end,

	-- node hit, bursts into flame
	hit_node = function(self, pos, node)
		mobs:explosion(pos, 3, 1, 1)
		--from tnt
		minetest.sound_play("tnt_explode", {pos = pos, gain = 1.5, max_hear_distance = 2*64})
		
	end
})

minetest.register_node("mobs_mc:dragon_egg", {
	description = "Dragon Egg",
	tiles = {
		"mcl_end_dragon_egg.png",
		"mcl_end_dragon_egg.png",
		"mcl_end_dragon_egg.png",
		"mcl_end_dragon_egg.png",
		"mcl_end_dragon_egg.png",
		"mcl_end_dragon_egg.png",
	},
	drawtype = "nodebox",
	is_ground_content = false,
	paramtype = "light",
	light_source = 1,
	node_box = {
		type = "fixed",
		fixed = {
			{-0.375, -0.5, -0.375, 0.375, -0.4375, 0.375},
			{-0.5, -0.4375, -0.5, 0.5, -0.1875, 0.5},
			{-0.4375, -0.1875, -0.4375, 0.4375, 0, 0.4375},
			{-0.375, 0, -0.375, 0.375, 0.125, 0.375},
			{-0.3125, 0.125, -0.3125, 0.3125, 0.25, 0.3125},
			{-0.25, 0.25, -0.25, 0.25, 0.3125, 0.25},
			{-0.1875, 0.3125, -0.1875, 0.1875, 0.375, 0.1875},
			{-0.125, 0.375, -0.125, 0.125, 0.4375, 0.125},
			{-0.0625, 0.4375, -0.0625, 0.0625, 0.5, 0.0625},
		}
	},
	selection_box = {
		type = "regular",
	},
	groups = {snappy = 1, falling_node = 1, deco_block = 1, not_in_creative_inventory = 1, dig_by_piston = 1 },
	sounds = default.node_sound_stone_defaults(),
	-- TODO: Make dragon egg teleport on punching
})


mobs:spawn_specific("mobs_mc:enderdragon", {"default:obsidian"}, {"default:end_stone"},
	12, 20, 5, 3, 1, -31000, -5000)
	
mobs:register_egg("mobs_mc:enderdragon", "Ender Dragon", "enderdragon_inv.png", 0)

