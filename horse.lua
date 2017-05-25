--MCmobs v0.2
--maikerumine
--made for MC like Survival game
--License for code WTFPL and otherwise stated in readmes


--dofile(minetest.get_modpath("mobs").."/api.lua")

--###################
--################### HORSE
--###################
--[[
mobs:register_mob("mobs_mc:52horse", {
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
	mesh = "horse.b3d",
    textures = {{"horse.png"},{"horse1.png"},{"horse2.png"},{"horse3.png"},{"horse4.png"},{"horse5.png"},{"horse6.png"}},
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

mobs:register_egg("mobs_mc:52horse", "Horse", "horse_inv.png", 0)
]]

--[[
Here is an example mob to show how the above functions work:


-- rideable horse
mobs:register_mob("mob_horse:horse", {
	type = "animal",
	visual = "mesh",
	visual_size = {x = 1.20, y = 1.20},
	mesh = "mobs_horse.x",
	collisionbox = {-0.4, -0.01, -0.4, 0.4, 1.25, 0.4},
	animation = { 
		speed_normal = 15,
		speed_run = 30,
		stand_start = 25,
		stand_end = 75,
		walk_start = 75,
		walk_end = 100,
		run_start = 75,
		run_end = 100,
	},
	textures = {
		{"mobs_horse.png"},
		{"mobs_horsepeg.png"},
		{"mobs_horseara.png"}
	},
	fear_height = 3,
	runaway = true,
	fly = false,
	walk_chance = 60,
	view_range = 5,
	follow = {"farming:wheat"},
	passive = true,
	hp_min = 12,
	hp_max = 16,
	armor = 200,
	lava_damage = 5,
	fall_damage = 5,
	water_damage = 1,
	makes_footstep_sound = true,
	drops = {
		{name = "mobs:meat_raw", chance = 1, min = 2, max = 3}
	},

	do_custom = function(self, dtime)

		-- set needed values if not already present
		if not self.v2 then
			self.v2 = 0
			self.max_speed_forward = 6
			self.max_speed_reverse = 2
			self.accel = 6
			self.terrain_type = 3
			self.driver_attach_at = {x = 0, y = 20, z = -2}
			self.driver_eye_offset = {x = 0, y = 3, z = 0}
			self.driver_scale = {x = 1, y = 1}
		end

		-- if driver present allow control of horse
		if self.driver then

			mobs.drive(self, "walk", "stand", false, dtime)

			return false -- skip rest of mob functions
		end

		return true
	end,

	on_die = function(self, pos)

		-- drop saddle when horse is killed while riding
		-- also detach from horse properly
		if self.driver then
			minetest.add_item(pos, "mobs:saddle")
			mobs.detach(self.driver, {x = 1, y = 0, z = 1})
		end

	end,

	on_rightclick = function(self, clicker)

		-- make sure player is clicking
		if not clicker or not clicker:is_player() then
			return
		end

		-- feed, tame or heal horse
		if mobs:feed_tame(self, clicker, 10, true, true) then
			return
		end

		-- make sure tamed horse is being clicked by owner only
		if self.tamed and self.owner == clicker:get_player_name() then

			local inv = clicker:get_inventory()

			-- detatch player already riding horse
			if self.driver and clicker == self.driver then

				mobs.detach(clicker, {x = 1, y = 0, z = 1})

				-- add saddle back to inventory
				if inv:room_for_item("main", "mobs:saddle") then
					inv:add_item("main", "mobs:saddle")
				else
					minetest.add_item(clicker.getpos(), "mobs:saddle")
				end

			-- attach player to horse
			elseif not self.driver
			and clicker:get_wielded_item():get_name() == "mobs:saddle" then

				self.object:set_properties({stepheight = 1.1})
				mobs.attach(self, clicker)

				-- take saddle from inventory
				inv:remove_item("main", "mobs:saddle")
			end
		end

		-- used to capture horse with magic lasso
		mobs:capture_mob(self, clicker, 0, 0, 80, false, nil)
	end
})

]]

-------------------------
--KPGMOBS HORSE
-------------------------
--By: KrupnovPavel
--Tweaked by: maikerumine
local function is_ground(pos)
	local nn = minetest.get_node(pos).name
	return minetest.get_item_group(nn, "crumbly") ~= 0 or
	minetest.get_item_group(nn, "choppy") ~= 0 or
	minetest.get_item_group(nn, "cracky") ~= 0  or
	--minetest.get_item_group(nn, "snappy") ~= 0  or
	minetest.get_item_group(nn, "leaves") ~= 0  or
	minetest.get_item_group(nn, "unbreakable") ~= 0  or
	minetest.get_item_group(nn, "immortal") ~= 0
end

local function get_sign(i)
	if i == 0 then
		return 0
	else
		return i/math.abs(i)
	end
end

local function get_velocity(v, yaw, y)
	local x = math.cos(yaw)*v
	local z = math.sin(yaw)*v
	return {x=x, y=y, z=z}
end

local function get_v(v)
	return math.sqrt(v.x^2+v.z^2)
end

function merge(a, b)
    if type(a) == 'table' and type(b) == 'table' then
        for k,v in pairs(b) do if type(v)=='table' and type(a[k] or false)=='table' then merge(a[k],v) else a[k]=v end end
    end
    return a
end

-- HORSE go go goooo :)
local horse = {
	physical = true,
	collisionbox = {-0.4, -0.01, -0.4, 0.4, 1, 0.4},
	visual = "mesh",
	stepheight = 1.1,
	--visual_size = {x=1,y=1},
	visual_size = {x=3, y=3},
	--mesh = "mobs_horseh1.x",
	mesh = "horse.b3d",
	rotate = -180,
	driver = nil,
		animation = {
		speed_normal = 25,		speed_run = 50,
		stand_start = 0,		stand_end = 0,
		walk_start = 0,		walk_end = 40,
		run_start = 0,		run_end = 40,
	},
	v = 0,

	on_rightclick = function(self, clicker)
		if not clicker or not clicker:is_player() then
			return
		end
		if self.driver and clicker == self.driver then
			self.driver = nil
			clicker:set_detach()
		elseif not self.driver then
			self.driver = clicker
			clicker:set_attach(self.object, "", {x=0,y=11,z=0}, {x=0,y=0,z=0})
			self.object:setyaw(clicker:get_look_yaw())
		end
	end,

	on_activate = function(self, staticdata, dtime_s)
		self.object:set_armor_groups({immortal=1})
		print (self.texture, self.jmp)
	end,

	on_punch = function(self, puncher, time_from_last_punch, tool_capabilities, direction)
		if puncher and puncher:is_player() then
			puncher:get_inventory():add_item("main", self.name)
			self.object:remove()
		end
	end,

	on_step = function(self, dtime)

		self.v = get_v(self.object:getvelocity())*get_sign(self.v)

		if self.driver then
			local ctrl = self.driver:get_player_control()
			if ctrl.up then
				self.v = self.v + self.jmp
			end
			if ctrl.down then
				self.v = self.v-0.1
			end
			if ctrl.left then
				self.object:setyaw(self.object:getyaw()+math.pi/120+dtime*math.pi/120)
			end
			if ctrl.right then
				self.object:setyaw(self.object:getyaw()-math.pi/120-dtime*math.pi/120)
			end
			if ctrl.jump then
				local p = self.object:getpos()
				p.y = p.y-0.5
				if is_ground(p) then
					local pos = self.object:getpos()
					pos.y = math.floor(pos.y)+4
					self.object:setpos(pos)
					self.object:setvelocity(get_velocity(self.v, self.object:getyaw(), 0))
				end
			end
		end

		local s = get_sign(self.v)
		self.v = self.v - 0.02*s
		if s ~= get_sign(self.v) then
			self.object:setvelocity({x=0, y=0, z=0})
			self.v = 0
			return
		end

		if math.abs(self.v) > 4.5 then
			self.v = 4.5*get_sign(self.v)
		end

		local p = self.object:getpos()
		p.y = p.y-0.5

		if not is_ground(p) then
			if minetest.registered_nodes[minetest.get_node(p).name].walkable then
				self.v = 0
			end
			self.object:setacceleration({x=0, y=-10, z=0})
			self.object:setvelocity(get_velocity(self.v, self.object:getyaw(), self.object:getvelocity().y))
		else
			p.y = p.y+1
			if is_ground(p) then
				self.object:setacceleration({x=0, y=3, z=0})
				local y = self.object:getvelocity().y
				if y > 2 then
					y = 2
				end
				if y < 0 then
					self.object:setacceleration({x=0, y=10, z=0})
				end
				self.object:setvelocity(get_velocity(self.v, self.object:getyaw(), y))
			else
				self.object:setacceleration({x=0, y=0, z=0})
				if math.abs(self.object:getvelocity().y) < 1 then
					local pos = self.object:getpos()
					pos.y = math.floor(pos.y)+0.5
					self.object:setpos(pos)
					self.object:setvelocity(get_velocity(self.v, self.object:getyaw(), 0))
				else
					self.object:setvelocity(get_velocity(self.v, self.object:getyaw(), self.object:getvelocity().y))
				end
			end
		end
	end,
}

--END HORSE
--[[
-- backup table
local hbak = horse

-- Brown Horse
local hrs = {
	textures = {"mobs_horseh1.png"},
	jmp = 2,
}
minetest.register_entity("mobs_mc:horseh1", merge(hrs, horse))

-- White Horse
horse = hbak
local peg = {
	textures = {"mobs_horsepegh1.png"},
	jmp = 2,
}
minetest.register_entity("mobs_mc:horsepegh1", merge(peg, horse))

-- Black Horse
horse = hbak
local ara = {
	textures = {"mobs_horsearah1.png"},
	jmp = 3,
}
minetest.register_entity("mobs_mc:horsearah1", merge(ara, horse))
]]

-- backup table
local hbak = horse

-- Saddled Horses
local hrs = {
	textures = {"horse.png"},
	jmp = 2,
}
minetest.register_entity("mobs_mc:horse_s", merge(hrs, horse))

local hrs = {
	textures = {"horse1.png"},
	jmp = 2,
}
minetest.register_entity("mobs_mc:horse_s1", merge(hrs, horse))

local hrs = {
	textures = {"horse2.png"},
	jmp = 2,
}
minetest.register_entity("mobs_mc:horse_s2", merge(hrs, horse))

local hrs = {
	textures = {"horse3.png"},
	jmp = 2,
}
minetest.register_entity("mobs_mc:horse_s3", merge(hrs, horse))

local hrs = {
	textures = {"horse4.png"},
	jmp = 2,
}
minetest.register_entity("mobs_mc:horse_s4", merge(hrs, horse))

local hrs = {
	textures = {"horse5.png"},
	jmp = 2,
}
minetest.register_entity("mobs_mc:horse_s5", merge(hrs, horse))

local hrs = {
	textures = {"horse6.png"},
	jmp = 2,
}
minetest.register_entity("mobs_mc:horse_s6", merge(hrs, horse))


mobs:register_mob("mobs_mc:horse", {
	type = "animal",
	passive = true,
    runaway = true,
    stepheight = 1.2,
	hp_min = 30,
	hp_max = 60,
    collisionbox = {-0.35, -0.01, -0.35, 0.35, 2, 0.35},
	textures = {"horse.png"},
	visual = "mesh",
	mesh = "horse.b3d",
	visual_size = {x=3, y=3},
	rotate = -180,
	makes_footstep_sound = true,
	walk_velocity = 1,
	armor = 200,
	drops = {
		{name = "mobs:meat_raw",
		chance = 1,
		min = 2,
		max = 3,},
	},
	drawtype = "front",
	water_damage = 1,
	lava_damage = 5,
	light_damage = 0,
	fear_height = 6,
	animation = {
		speed_normal = 25,		speed_run = 50,
		stand_start = 0,		stand_end = 0,
		walk_start = 0,		walk_end = 40,
		run_start = 0,		run_end = 40,
	},
	follow = "default:apple",
	view_range = 5,

	on_rightclick = function(self, clicker)
		local tool = clicker:get_wielded_item()
		if tool:get_name() == "mobs:saddle" then
			clicker:get_inventory():remove_item("main", "mobs:saddle")
			local pos = self.object:getpos()
			self.object:remove()
			minetest.add_entity(pos, "mobs_mc:horse_s")
		end
	end,
})

mobs:register_mob("mobs_mc:horse1", {
	type = "animal",
	passive = true,
    runaway = true,
    stepheight = 1.2,
	hp_min = 30,
	hp_max = 60,
    collisionbox = {-0.35, -0.01, -0.35, 0.35, 2, 0.35},
	textures = {"horse1.png"},
	visual = "mesh",
	mesh = "horse.b3d",
	visual_size = {x=3, y=3},
	rotate = -180,
	makes_footstep_sound = true,
	walk_velocity = 1,
	armor = 200,
	drops = {
		{name = "mobs:meat_raw",
		chance = 1,
		min = 2,
		max = 3,},
	},
	drawtype = "front",
	water_damage = 1,
	lava_damage = 5,
	light_damage = 0,
	fear_height = 6,
	animation = {
		speed_normal = 25,		speed_run = 50,
		stand_start = 0,		stand_end = 0,
		walk_start = 0,		walk_end = 40,
		run_start = 0,		run_end = 40,
	},
	follow = "default:apple",
	view_range = 5,

	on_rightclick = function(self, clicker)
		local tool = clicker:get_wielded_item()
		if tool:get_name() == "mobs:saddle" then
			clicker:get_inventory():remove_item("main", "mobs:saddle")
			local pos = self.object:getpos()
			self.object:remove()
			minetest.add_entity(pos, "mobs_mc:horse_s1")
		end
	end,
})

mobs:register_mob("mobs_mc:horse2", {
	type = "animal",
	passive = true,
    runaway = true,
    stepheight = 1.2,
	hp_min = 30,
	hp_max = 60,
    collisionbox = {-0.35, -0.01, -0.35, 0.35, 2, 0.35},
	textures = {"horse2.png"},
	visual = "mesh",
	mesh = "horse.b3d",
	visual_size = {x=3, y=3},
	rotate = -180,
	makes_footstep_sound = true,
	walk_velocity = 1,
	armor = 200,
	drops = {
		{name = "mobs:meat_raw",
		chance = 1,
		min = 2,
		max = 3,},
	},
	drawtype = "front",
	water_damage = 1,
	lava_damage = 5,
	light_damage = 0,
	fear_height = 6,
	animation = {
		speed_normal = 25,		speed_run = 50,
		stand_start = 0,		stand_end = 0,
		walk_start = 0,		walk_end = 40,
		run_start = 0,		run_end = 40,
	},
	follow = "default:apple",
	view_range = 5,

	on_rightclick = function(self, clicker)
		local tool = clicker:get_wielded_item()
		if tool:get_name() == "mobs:saddle" then
			clicker:get_inventory():remove_item("main", "mobs:saddle")
			local pos = self.object:getpos()
			self.object:remove()
			minetest.add_entity(pos, "mobs_mc:horse_s2")
		end
	end,
})

mobs:register_mob("mobs_mc:horse3", {
	type = "animal",
	passive = true,
    runaway = true,
    stepheight = 1.2,
	hp_min = 30,
	hp_max = 60,
    collisionbox = {-0.35, -0.01, -0.35, 0.35, 2, 0.35},
	textures = {"horse3.png"},
	visual = "mesh",
	mesh = "horse.b3d",
	visual_size = {x=3, y=3},
	rotate = -180,
	makes_footstep_sound = true,
	walk_velocity = 1,
	armor = 200,
	drops = {
		{name = "mobs:meat_raw",
		chance = 1,
		min = 2,
		max = 3,},
	},
	drawtype = "front",
	water_damage = 1,
	lava_damage = 5,
	light_damage = 0,
	fear_height = 6,
	animation = {
		speed_normal = 25,		speed_run = 50,
		stand_start = 0,		stand_end = 0,
		walk_start = 0,		walk_end = 40,
		run_start = 0,		run_end = 40,
	},
	follow = "default:apple",
	view_range = 5,

	on_rightclick = function(self, clicker)
		local tool = clicker:get_wielded_item()
		if tool:get_name() == "mobs:saddle" then
			clicker:get_inventory():remove_item("main", "mobs:saddle")
			local pos = self.object:getpos()
			self.object:remove()
			minetest.add_entity(pos, "mobs_mc:horse_s3")
		end
	end,
})

mobs:register_mob("mobs_mc:horse4", {
	type = "animal",
	passive = true,
    runaway = true,
    stepheight = 1.2,
	hp_min = 30,
	hp_max = 60,
    collisionbox = {-0.35, -0.01, -0.35, 0.35, 2, 0.35},
	textures = {"horse4.png"},
	visual = "mesh",
	mesh = "horse.b3d",
	visual_size = {x=3, y=3},
	rotate = -180,
	makes_footstep_sound = true,
	walk_velocity = 1,
	armor = 200,
	drops = {
		{name = "mobs:meat_raw",
		chance = 1,
		min = 2,
		max = 3,},
	},
	drawtype = "front",
	water_damage = 1,
	lava_damage = 5,
	light_damage = 0,
	fear_height = 6,
	animation = {
		speed_normal = 25,		speed_run = 50,
		stand_start = 0,		stand_end = 0,
		walk_start = 0,		walk_end = 40,
		run_start = 0,		run_end = 40,
	},
	follow = "default:apple",
	view_range = 5,

	on_rightclick = function(self, clicker)
		local tool = clicker:get_wielded_item()
		if tool:get_name() == "mobs:saddle" then
			clicker:get_inventory():remove_item("main", "mobs:saddle")
			local pos = self.object:getpos()
			self.object:remove()
			minetest.add_entity(pos, "mobs_mc:horse_s4")
		end
	end,
})

mobs:register_mob("mobs_mc:horse5", {
	type = "animal",
	passive = true,
    runaway = true,
    stepheight = 1.2,
	hp_min = 30,
	hp_max = 60,
    collisionbox = {-0.35, -0.01, -0.35, 0.35, 2, 0.35},
	textures = {"horse5.png"},
	visual = "mesh",
	mesh = "horse.b3d",
	visual_size = {x=3, y=3},
	rotate = -180,
	makes_footstep_sound = true,
	walk_velocity = 1,
	armor = 200,
	drops = {
		{name = "mobs:meat_raw",
		chance = 1,
		min = 2,
		max = 3,},
	},
	drawtype = "front",
	water_damage = 1,
	lava_damage = 5,
	light_damage = 0,
	fear_height = 6,
	animation = {
		speed_normal = 25,		speed_run = 50,
		stand_start = 0,		stand_end = 0,
		walk_start = 0,		walk_end = 40,
		run_start = 0,		run_end = 40,
	},
	follow = "default:apple",
	view_range = 5,

	on_rightclick = function(self, clicker)
		local tool = clicker:get_wielded_item()
		if tool:get_name() == "mobs:saddle" then
			clicker:get_inventory():remove_item("main", "mobs:saddle")
			local pos = self.object:getpos()
			self.object:remove()
			minetest.add_entity(pos, "mobs_mc:horse_s5")
		end
	end,
})

mobs:register_mob("mobs_mc:horse6", {
	type = "animal",
	passive = true,
    runaway = true,
    stepheight = 1.2,
	hp_min = 30,
	hp_max = 60,
    collisionbox = {-0.35, -0.01, -0.35, 0.35, 2, 0.35},
	textures = {"horse6.png"},
	visual = "mesh",
	mesh = "horse.b3d",
	visual_size = {x=3, y=3},
	rotate = -180,
	makes_footstep_sound = true,
	walk_velocity = 1,
	armor = 200,
	drops = {
		{name = "mobs:meat_raw",
		chance = 1,
		min = 2,
		max = 3,},
	},
	drawtype = "front",
	water_damage = 1,
	lava_damage = 5,
	light_damage = 0,
	fear_height = 6,
	animation = {
		speed_normal = 25,		speed_run = 50,
		stand_start = 0,		stand_end = 0,
		walk_start = 0,		walk_end = 40,
		run_start = 0,		run_end = 40,
	},
	follow = "default:apple",
	view_range = 5,

	on_rightclick = function(self, clicker)
		local tool = clicker:get_wielded_item()
		if tool:get_name() == "mobs:saddle" then
			clicker:get_inventory():remove_item("main", "mobs:saddle")
			local pos = self.object:getpos()
			self.object:remove()
			minetest.add_entity(pos, "mobs_mc:horse_s6")
		end
	end,
})

--===========================
--===========================
--===========================
--===========================
mobs:register_spawn("mobs_mc:horse", {"default:dirt_with_dry_grass","es:strange_grass","es:aiden_grass", "default:sand"}, 20, 12, 21000, 1, 12)
mobs:register_spawn("mobs_mc:horse1", {"default:dirt_with_dry_grass","es:strange_grass","es:aiden_grass", "default:sand"}, 20, 12, 21000, 1, 12)
mobs:register_spawn("mobs_mc:horse2", {"default:dirt_with_dry_grass","es:strange_grass","es:aiden_grass", "default:sand"}, 20, 12, 21000, 1, 12)
mobs:register_spawn("mobs_mc:horse3", {"default:dirt_with_dry_grass","es:strange_grass","es:aiden_grass", "default:sand"}, 20, 12, 21000, 1, 12)
mobs:register_spawn("mobs_mc:horse4", {"default:dirt_with_dry_grass","es:strange_grass","es:aiden_grass", "default:sand"}, 20, 12, 21000, 1, 12)
mobs:register_spawn("mobs_mc:horse5", {"default:dirt_with_dry_grass","es:strange_grass","es:aiden_grass", "default:sand"}, 20, 12, 21000, 1, 12)
mobs:register_spawn("mobs_mc:horse6", {"default:dirt_with_dry_grass","es:strange_grass","es:aiden_grass", "default:sand"}, 20, 12, 21000, 1, 12)
--mobs:register_spawn("mobs_mc:horse2", {"default:dirt_with_dry_grass"}, 20, 12, 23000, 1, 31000)
--mobs:register_spawn("mobs_mc:horse3", {"default:desert_sand"}, 20, 8, 17000, 1, 5)


-- saddle
minetest.register_craftitem(":mobs:saddle", {
	description = "Saddle",
	inventory_image = "saddle.png",
})

minetest.register_craft({
	output = "mobs:saddle",
	recipe = {
		{"mobs:leather", "mobs:leather", "mobs:leather"},
		{"farming:string", "", "farming:string"},
	{"default:steel_ingot", "", "default:steel_ingot"}
	},
})

-- compatibility
--[[
mobs:alias_mob("mobs:horse", "mobs_mc:horse")
mobs:alias_mob("mobs:horse2", "mobs_mc:horse2")
mobs:alias_mob("mobs:horse3", "mobs_mc:horse3")
]]
-- spawn eggs
mobs:register_egg("mobs_mc:horse", "Horse Brown", "horse_inv.png", 0)
mobs:register_egg("mobs_mc:horse_s", "Horse Brown Saddled", "horse_inv.png", 0)
mobs:register_egg("mobs_mc:horse1", "Horse Black", "horse_inv.png^[colorize:#000000:230", 0)
mobs:register_egg("mobs_mc:horse_s1", "Horse Black Saddled", "horse_inv.png^[colorize:#000000:230", 0)
mobs:register_egg("mobs_mc:horse2", "Horse Sienna", "horse_inv.png^[colorize:#FFFF00:130", 0)
mobs:register_egg("mobs_mc:horse_s2", "Horse Sienna Saddled", "horse_inv.png^[colorize:#FFFF00:130", 0)
mobs:register_egg("mobs_mc:horse3", "Horse Red Belly", "horse_inv.png^[colorize:#FF0000:130", 0)
mobs:register_egg("mobs_mc:horse_s3", "Horse Red Belly Saddled", "horse_inv.png^[colorize:#FF0000:130", 0)
mobs:register_egg("mobs_mc:horse4", "Horse Dark Brown", "horse_inv.png^[colorize:#FFCCDD:130", 0)
mobs:register_egg("mobs_mc:horse_s4", "Horse Dark Brown Saddled", "horse_inv.png^[colorize:#FFCCDD:130", 0)
mobs:register_egg("mobs_mc:horse5", "Horse Gray", "horse_inv.png^[colorize:#CCCCCC:130", 0)
mobs:register_egg("mobs_mc:horse_s5", "Horse Gray Saddled", "horse_inv.png^[colorize:#CCCCCC:130", 0)
mobs:register_egg("mobs_mc:horse6", "Horse White", "horse_inv.png^[colorize:#FFFFFF:130", 0)
mobs:register_egg("mobs_mc:horse_s6", "Horse White Saddled", "horse_inv.png^[colorize:#FFFFFF:130", 0)
-- KPV wild horse spawn eggs
--mobs:register_egg("mobs_mc:horse", "Brown Horse", "mobs_horse_inv.png", 0)
--mobs:register_egg("mobs_mc:horse2", "White Horse", "mobs_horse_peg_inv.png", 0)
--mobs:register_egg("mobs_mc:horse3", "Arabic Horse", "mobs_horse_ara_inv.png", 0)
-- KPV tamed horse spawn eggs
--mobs:register_egg("mobs_mc:horseh1", "Tamed Brown Horse", "mobs_horse_inv.png", 0)
--mobs:register_egg("mobs_mc:horsepegh1", "Tamed White Horse", "mobs_horse_peg_inv.png", 0)
--mobs:register_egg("mobs_mc:horsearah1", "Tamed Arabic Horse", "mobs_horse_ara_inv.png", 0)


if minetest.setting_get("log_mods") then
	minetest.log("action", "MC Horse loaded")
end