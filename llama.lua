--MCmobs v0.2
--maikerumine
--made for MC like Survival game
--License for code WTFPL and otherwise stated in readmes


--dofile(minetest.get_modpath("mobs").."/api.lua")

--###################
--################### LLAMA
--###################
--[[
mobs:register_mob("mobs_mc:20llama", {
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
	mesh = "llama.b3d",
    textures = {{"llama.png"},{"llama1.png"},{"llama2.png"},{"llama3.png"},{"llama4.png"}},
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

mobs:register_egg("mobs_mc:20llama", "llama", "llama_inv.png", 0)
]]

mobs:register_mob("mobs_mc:llama", {
	type = "animal",
	hp_max = 25,
	collisionbox = {-0.4, -0.01, -0.4, 0.4, 1, 0.4},
    rotate = -180,
	visual = "mesh",
	mesh = "llama.b3d",
    textures = {{"llama.png"},{"llama1.png"},{"llama2.png"},{"llama3.png"},{"llama4.png"}},
	visual_size = {x=3, y=3},
	makes_footstep_sound = true,
	walk_velocity = 1,
	armor = 200,
	drops = {
		{name = "mobs:pork_raw",
		chance = 1,
		min = 1,
		max = 3,},
	},
	drawtype = "front",
	water_damage = 1,
	lava_damage = 5,
	light_damage = 0,
	fear_height = 3,
	sounds = {
		random = "Sheep3",
		death = "Sheep3",
		damage = "mobs_sheep",
	},
	animation = {
		speed_normal = 24,
		stand_start = 0,
		stand_end = 23,
		walk_start = 24,
		walk_end = 49,
		hurt_start = 118,
		hurt_end = 154,
		death_start = 154,
		death_end = 179,
		eat_start = 49,
		eat_end = 78,
		look_start = 78,
		look_end = 108,
	},
	follow = {"default:apple", "farming:potato", "farming:carrot"},
	view_range = 5,
	on_rightclick = function(self, clicker)
		if not clicker or not clicker:is_player() then
			return
		end
	
		local item = clicker:get_wielded_item()
		if item:get_name() == "mobs:saddle" and self.saddle ~= "yes" then
			self.object:set_properties({
				textures = {"llama.png"},
			})
			self.saddle = "yes"
			self.tamed = true
			self.drops = {
				{name = "mobs:pork_raw",
				chance = 1,
				min = 1,
				max = 3,},
				{name = "mobs:saddle",
				chance = 1,
				min = 1,
				max = 1,},
			}
			if not minetest.setting_getbool("creative_mode") then
				local inv = clicker:get_inventory()
				local stack = inv:get_stack("main", clicker:get_wield_index())
				stack:take_item()
				inv:set_stack("main", clicker:get_wield_index(), stack)
			end
			return
		end
	-- from boats mod
	local name = clicker:get_player_name()

	if self.driver and clicker == self.driver then
		self.driver = nil
		clicker:set_detach()
		default.player_attached[name] = false
		default.player_set_animation(clicker, "stand" , 30)
	elseif not self.driver and self.saddle == "yes" then
		self.driver = clicker
		clicker:set_attach(self.object, "", {x = 0, y = 19, z = 0}, {x = 0, y = 0, z = 0})
		default.player_attached[name] = true
		minetest.after(0.2, function()
			default.player_set_animation(clicker, "sit" , 30)
		end)
		----[[
			-- ridable pigs
		if self.name == "mobs_mc:llama" and self.saddle == "yes" and self.driver then
			local item = self.driver:get_wielded_item()
			if item:get_name() == "mobs:carrotstick" then
				local yaw = self.driver:get_look_yaw() - math.pi / 2
				local velo = self.object:getvelocity()
				local v = 1.5
				if math.abs(velo.x) + math.abs(velo.z) < .6 then velo.y = 5 end
				self.state = "walk"
				self:set_animation("walk")
				self.object:setyaw(yaw)
				self.object:setvelocity({x = -math.sin(yaw) * v, y = velo.y, z = math.cos(yaw) * v})

				local inv = self.driver:get_inventory()
				local stack = inv:get_stack("main", self.driver:get_wield_index())
				stack:add_wear(100)
				if stack:get_wear() > 65400 then
					stack = {name = "fishing:pole", count = 1}
				end
				inv:set_stack("main", self.driver:get_wield_index(), stack)
				return
			end
			end
			--]]
		--self.object:setyaw(clicker:get_look_yaw() - math.pi / 2)
	end
	--from mobs_animals
		if mobs:feed_tame(self, clicker, 8, true, true) then
			return
		end
		mobs:capture_mob(self, clicker, 0, 5, 50, false, nil)
	end,
})

mobs:register_spawn("mobs_mc:llama", {"default:dirt_with_dry_grass"}, 20, 12, 5000, 1, 31000)


-- spawn eggs
mobs:register_egg("mobs_mc:llama", "llama", "llama_inv.png", 0)


if minetest.setting_get("log_mods") then
	minetest.log("action", "MC Llama loaded")
end