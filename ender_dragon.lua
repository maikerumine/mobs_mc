
	
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
	hp_max = 533,
	hp_min = 433,
    collisionbox = {-0.35, -0.01, -0.35, 0.35, 2, 0.35},
    rotate = -180,
	visual = "mesh",
	mesh = "enderdragon.b3d",
	textures = {
		{"enderdragon.png"},
	},
	visual_size = {x=1, y=1},
	makes_footstep_sound = true,
	view_range = 45,
	rotate = 270,
	fear_height = 5,
	walk_velocity = 2,
	run_velocity = 4,
    sounds = {
		shoot_attack = "mesed",
		attack = "mese_dragon",
		distance = 60,
	},
	damage = 16,
	jump = true,
	jump_height = 10,
	jump_chance = 98,
	fear_height = 120,	
	fly = true,
	dogshoot_switch = 1,
	dogshoot_count_max =1,
	passive = false,
	floats=1,
	drops = {
		{name = "mobs:mese_meteor",
		chance = 1,
		min = 1,
		max = 1},
		{name = "default:mese_crystal",
		chance = 1,
		min = 99,
		max = 99},

    },
	armor = 60,
	drawtype = "front",
	water_damage = 0,
	lava_damage = 0,
	light_damage = 0,
	on_rightclick = nil,
	attack_type = "dogshoot",
	explosion_radius = 14,
	dogshoot_stop = true,
	--arrow = "mobs:roar_of_the_dragon",
	--arrow = "mobs_mc:roar_of_the_dragon",
	--arrow = "mobs:fireball",
	arrow = "mobs_mc:fireball2",
	reach = 5,
	shoot_interval = 0.5,
	shoot_offset = -1,
	animation = {
		speed_normal = 25,		speed_run = 50,
		stand_start = 0,		stand_end = 20,
		walk_start = 0,		walk_end = 20,
		run_start = 0,		run_end = 20,
	},
    	--attacks_monsters = true,
	--peaceful = false,
	--group_attack = true,
	--},
--[[
	do_custom = function(self)
		--mobs:midas_ability(self, "default:mese_block", self.run_velocity,2, 3)
		mobs:midas_ability(self, "default:glass", self.run_velocity,2, 3)
	end,

	custom_attack = function(self)
		if self.timer > 1 then
			self.timer = 0
			self.attack_rip = self.attack_rip+1

			local s = self.object:getpos()
			local p = self.attack:getpos()

			p.y = p.y + 1.5
			s.y = s.y + 1.5

			if minetest.line_of_sight(p, s) == true then
				-- play attack sound
				if self.sounds.attack then
					minetest.sound_play(self.sounds.attack, {
						object = self.object,
						max_hear_distance = self.sounds.distance
					})
				end
				-- punch player
				self.attack:punch(self.object, 1.0,  {
					full_punch_interval=1.0,
					damage_groups = {fleshy=self.damage}
				}, nil)
			end
			if self.attack_rip>=8 then
				self.attack_rip =0
				set_animation("punch1")
				for dx = -17,17 do
					for dz= -17,17 do
						local k = {x = s.x+dx, y=s.y+20, z=s.z+dz}
						local n = minetest.env:get_node(k).name
						if n=="air" and math.random(1,23)==1 then
							minetest.env:set_node(k, {name="mobs_mc:mese_meteor"})
							nodeupdate(k)
						end
					end
				end
			end
		end
	end
	]]
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
	textures = {"mobs_fireball.png"},
	--textures = {"mobs_skeleton2_front.png^[makealpha:255,255,255 "},
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
		mobs:explosion(pos, 6, 1, 0)
		--from tnt
		minetest.sound_play("tnt_explode", {pos = pos, gain = 1.5, max_hear_distance = 2*64})
		
	end
})

mobs:spawn_specific("mobs_mc:enderdragon", {"default:bedrock","default:mese"}, {"air"},
	0, 20, 60, 300, 1, -31000, -5000)
	
mobs:register_egg("mobs_mc:enderdragon", "Enderdragon", "enderdragon_inv.png", 0)

