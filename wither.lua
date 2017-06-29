--MCmobs v0.4
--maikerumine
--made for MC like Survival game
--License for code WTFPL and otherwise stated in readmes


--dofile(minetest.get_modpath("mobs").."/api.lua")

   
--###################
--################### WITHER
--###################


mobs:register_mob("mobs_mc:wither", {
	type = "monster",
	hp_max = 300,
	hp_min = 300,
	armor = 80,
	-- This deviates from MC Wiki's size, which makes no sense
	collisionbox = {-0.9, 0.4, -0.9, 0.9, 2.45, 0.9},
    rotate = -180,
	visual = "mesh",
	mesh = "mobs_mc_wither.b3d",
	textures = {
		{"mobs_mc_wither.png"},
	},
	visual_size = {x=4, y=4},
	makes_footstep_sound = true,
	view_range = 16,
	fear_height = 4,
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
	fly = true,
	dogshoot_switch = 1,
	dogshoot_count_max =1,
	attack_animals = true,
	floats=1,
	drops = {
		{name = mobs_mc.items.emerald,
		chance = 1,
		min = 18,
		max = 21},
	},
	drawtype = "front",
	water_damage = 0,
	lava_damage = 0,
	light_damage = 0,
	attack_type = "dogshoot",
	explosion_radius = 3,
	explosion_fire = 0,
	dogshoot_stop = true,
	arrow = "mobs_mc:fireball",
	reach = 5,
	shoot_interval = 0.5,
	shoot_offset = -1,
	animation = {
		walk_speed = 12, run_speed = 12, stand_speed = 12,
		stand_start = 0,		stand_end = 20,
		walk_start = 0,		walk_end = 20,
		run_start = 0,		run_end = 20,
	},
})

mobs:register_arrow("mobs_mc:roar_of_the_dragon", {
	visual = "sprite",
	visual_size = {x = 1, y = 1},
	textures = {"blank.png"},
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
	textures = {"mobs_skeleton2_front.png^[makealpha:255,255,255 "},
	velocity = 6,

	-- direct hit, no fire... just plenty of pain
	hit_player = function(self, player)
	minetest.sound_play("tnt_explode", {pos = pos, gain = 1.5, max_hear_distance = 16})
		player:punch(self.object, 1.0, {
			full_punch_interval = 0.5,
			damage_groups = {fleshy = 8},
		}, nil)

	end,

	hit_mob = function(self, player)
	minetest.sound_play("tnt_explode", {pos = pos, gain = 1.5,max_hear_distance = 16})
		player:punch(self.object, 1.0, {
			full_punch_interval = 0.5,
			damage_groups = {fleshy = 8},
		}, nil)
		
	end,

	-- node hit, bursts into flame
	hit_node = function(self, pos, node)
		mobs:explosion(pos, 3, 0, 1)
		--from tnt
		minetest.sound_play("tnt_explode", {pos = pos, gain = 1.5, max_hear_distance = 16})
		
	end
})
--Spawn egg
mobs:register_egg("mobs_mc:wither", "Wither", "mobs_mc_spawn_icon_wither.png", 0)

--Compatibility
mobs:alias_mob("nssm:mese_dragon", "mobs_mc:wither")	
