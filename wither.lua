--MCmobs v0.4
--maikerumine
--made for MC like Survival game
--License for code WTFPL and otherwise stated in readmes


--dofile(minetest.get_modpath("mobs").."/api.lua")

   
--###################
--################### WITHER
--###################
--[[
mobs:register_mob("mobs_mc:32wither", {
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
	mesh = "wither.b3d",
	textures = {
		{"wither.png"},
	},
	visual_size = {x=3, y=3},
	walk_velocity = 0.6,
	run_velocity = 2,
	jump = true,
	animation = {
		speed_normal = 12,		speed_run = 12,
		stand_start = 0,		stand_end = 20,
        walk_start = 0,		walk_end = 20,
		run_start = 0,		run_end = 20,
	},
})

mobs:register_egg("mobs_mc:32wither", "Wither", "wither_inv.png", 0)

]]

mobs:register_mob("mobs_mc:wither", {
	type = "monster",
	hp_max = 300,
	hp_min = 300,
    collisionbox = {-0.35, -0.01, -0.35, 0.35, 2, 0.35},
    rotate = -180,
	visual = "mesh",
	mesh = "wither.b3d",
	textures = {
		{"wither.png"},
	},
	visual_size = {x=3, y=3},
	makes_footstep_sound = true,
	view_range = 20,
	fear_height = 5,
	walk_velocity = 2,
	run_velocity = 4,
	stepheight = 1.2,
    sounds = {
		shoot_attack = "mesed",
		attack = "mese_dragon",
		distance = 60,
	},
	jump = true,
	jump_height = 10,
	jump_chance = 98,
	fear_height = 120,	
	--fly = true,
	dogshoot_switch = 1,
	dogshoot_count_max =1,
	--passive = false,
	attack_animals = true,
	floats=1,
	drops = {
		{name = "default:emeraldblock",
		chance = 1,
		min = 1,
		max = 3},
		{name = "default:mese_crystal",
		chance = 1,
		min = 99,
		max = 99},
		{name = "mobs_mc:skeleton2_head", chance = 1, min = 1, max = 1},
    },
	armor = 60,
	drawtype = "front",
	water_damage = 0,
	lava_damage = 0,
	light_damage = 0,
	on_rightclick = nil,
	attack_type = "dogshoot",
	explosion_radius = 3,
	explosion_fire = 0,
	dogshoot_stop = true,
	--arrow = "mobs_mc:roar_of_the_dragon",
	arrow = "mobs_mc:fireball",
	reach = 5,
	shoot_interval = 0.5,
	shoot_offset = -1,
	animation = {
		speed_normal = 12,		speed_run = 12,
		stand_start = 0,		stand_end = 20,
        walk_start = 0,		walk_end = 20,
		run_start = 0,		run_end = 20,
	},
})

mobs:register_arrow("mobs_mc:roar_of_the_dragon", {
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
			if name~="mobs_mc:roar_of_the_dragon" and name ~= "mobs_mc:wither" then
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
mobs:register_arrow(":mobs_mc:fireball", {
	visual = "sprite",
	visual_size = {x = 1.5, y = 1.5},
	--textures = {"mobs_fireball.png"},
	textures = {"mobs_skeleton2_front.png^[makealpha:255,255,255 "},
	velocity = 6,

	-- direct hit, no fire... just plenty of pain
	hit_player = function(self, player)
	minetest.sound_play("tnt_explode", {pos = pos, gain = 1.5, max_hear_distance = 2*64})
		player:punch(self.object, 1.0, {
			full_punch_interval = 0.5,
			damage_groups = {fleshy = 8},
		}, nil)

	end,

	hit_mob = function(self, player)
	minetest.sound_play("tnt_explode", {pos = pos, gain = 1.5, max_hear_distance = 2*64})
		player:punch(self.object, 1.0, {
			full_punch_interval = 0.5,
			damage_groups = {fleshy = 8},
		}, nil)
		
	end,

	-- node hit, bursts into flame
	hit_node = function(self, pos, node)
		mobs:explosion(pos, 3, 0, 1)
		--from tnt
		minetest.sound_play("tnt_explode", {pos = pos, gain = 1.5, max_hear_distance = 2*64})
		
	end
})
--Spawn egg
mobs:register_egg("mobs_mc:wither", "Wither", "wither_inv.png", 0)

--Spawn 
mobs:spawn_specific("mobs_mc:wither", {"default:bedrock"}, {"air"},
	0, 5, 60, 13000, 1, -31000, -50)
	
--Compatibility
mobs:alias_mob("nssm:mese_dragon", "mobs_mc:wither")	
