--MCmobs v0.2
--maikerumine
--made for MC like Survival game
--License for code WTFPL and otherwise stated in readmes


--dofile(minetest.get_modpath("mobs").."/api.lua")


--###################
--################### SHEEP
--###################
--[[
mobs:register_mob("mobs_mc:24sheep", {
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
	mesh = "sheep.b3d",
	textures = {
		{"sheep.png"},
	},
    gotten_texture = {"sheeps.png"},
    gotten_mesh = "sheeps.b3d",
	visual_size = {x=3, y=3},
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

mobs:register_egg("mobs_mc:24sheep", "Sheep", "sheep_inv.png", 0)
]]
local colors = {
	-- dyecolor = { woolcolor, textures }
	white = { "white", { "mobs_sheep.png" } },
	brown = { "brown", { "mobs_sheep_brown.png" } },
	grey = { "silver", { "mobs_sheep_grey.png" } },
	dark_grey = { "grey", { "mobs_sheep_dark_grey.png" } },
	blue = { "blue", { "mobs_sheep_blue.png" } },
	lightblue = { "light_blue", { "mobs_sheep_lightblue.png" } },
	dark_green = { "green", { "mobs_sheep_dark_green.png" } },
	green = { "lime", { "mobs_sheep_green.png" } },
	violet = { "purple", { "mobs_sheep_violet.png" } },
	pink = { "pink", { "mobs_sheep_pink.png" } },
	yellow = { "yellow", { "mobs_sheep_yellow.png" } },
	orange = { "orange", { "mobs_sheep_orange.png" } },
	red = { "red", { "mobs_sheep_red.png" } },
	cyan  = { "cyan", { "mobs_sheep_cyan.png" } },
	magenta = { "magenta", { "mobs_sheep_magenta.png" } },
	black = { "black", { "mobs_sheep_black.png" } },
}

--mcsheep
mobs:register_mob("mobs_mc:sheep", {
	type = "animal",
	hp_min = 8,
	hp_max = 8,

	collisionbox = {-0.5, -0.01, -0.5, 0.5, 1.5, 0.5},
	--collisionbox = {-0.5, -1, -0.5, 0.5, 0.3, 0.5},
    rotate = -180,

	visual = "mesh",
	visual_size = {x=0.6, y=0.6},
	--mesh = "sheep.b3d",
	mesh = "mobs_sheep.x",
	textures = {
		{"mobs_sheep.png"},--was sheep
	},
    --gotten_texture = {"sheeps.png"},
    --gotten_mesh = "sheeps.b3d",
	--visual_size = {x=3, y=3},
	makes_footstep_sound = true,
	walk_velocity = 1,

	--[[

	drops = {
		{name = "mobs:mutton_raw",
		chance = 1,
		min = 1,
		max = 2,},
		{name = "wool:white",
		chance = 1,
		min = 1,
		max = 1,},
	},
	]]
	drawtype = "front",
	water_damage = 1,
	lava_damage = 5,
	light_damage = 0,
	fear_height = 3,
	sounds = {
		random = "Sheep3",
		death = "Sheep3",
		damage = "Sheep3",
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
	follow = "farming:wheat",
	view_range = 12,
	
	replace_rate = 10,
	replace_what = "default:dirt_with_grass",
	replace_with = "default:dirt",
	
		--Wuzzy code for color keep
		do_custom = function(self)
		if not self.initial_color_set then
			local r = math.random(0,100000)
			local textures
			if r <= 81836 then
				-- 81.836%
				self.color = colors["white"][1]
				textures = colors["white"][2]
				self.base_texture = colors["white"][2]
			elseif r <= 81836 + 5000 then
				-- 5%
				self.color = colors["grey"][1]
				textures = colors["grey"][2]
				self.base_texture = colors["grey"][2]
			elseif r <= 81836 + 5000 + 5000 then
				-- 5%
				self.color = colors["dark_grey"][1]
				textures = colors["dark_grey"][2]
				self.base_texture = colors["dark_grey"][2]
			elseif r <= 81836 + 5000 + 5000 + 5000 then
				-- 5%
				self.color = colors["black"][1]
				textures = colors["black"][2]
				self.base_texture = colors["black"][2]
			elseif r <= 81836 + 5000 + 5000 + 5000 + 3000 then
				-- 3%
				self.color = colors["brown"][1]
				textures = colors["brown"][2]
				self.base_texture = colors["brown"][2]
			else
				-- 0.164%
				self.color = colors["pink"][1]
				textures = colors["pink"][2]
				self.base_texture = colors["pink"][2]
			end
			self.textures = { textures },
			self.object:set_properties({ textures = textures })
			self.drops = {
				{name = "mcl_mobitems:mutton",
				chance = 1,
				min = 1,
				max = 2,},
				{name = "mcl_wool:"..self.color,
				chance = 1,
				min = 1,
				max = 1,},
				
				{name = "mobs:mutton",
				chance = 1,
				min = 1,
				max = 2,},
				{name = "wool:"..self.color,
				chance = 1,
				min = 1,
				max = 1,},
			}
			self.initial_color_set = true
		end
	end,
	
	on_rightclick = function(self, clicker)
		local item = clicker:get_wielded_item()
		if item:get_name() == "farming:wheat" then
			if not self.tamed then
				if not minetest.setting_getbool("creative_mode") then
					item:take_item()
					clicker:set_wielded_item(item)
				end
				self.tamed = true
			elseif self.naked then
				if not minetest.setting_getbool("creative_mode") then
					item:take_item()
					clicker:set_wielded_item(item)
				end
				self.food = (self.food or 0) + 1
				if self.food >= 4 then
					self.food = 0
					self.naked = false
					self.object:set_properties({
						textures = {"mobs_sheep_"..pname..".png"}, --was sheep.png
					})
				end
			end
			return
		end
		if item:get_name() == "mobs:shears" and not self.naked then
			self.naked = true
			local pos = self.object:getpos()
			minetest.sound_play("shears", {pos = pos})
			pos.y = pos.y + 0.5
			if not self.color then
				minetest.add_item(pos, ItemStack("wool:white "..math.random(1,3)))
			else
				minetest.add_item(pos, ItemStack("wool:"..self.color.." "..math.random(1,3)))
			end
			self.object:set_properties({
				textures = {"mobs_sheep_sheared.png"},
				--textures = {"sheeps.png"},
				--mesh = "sheeps.b3d",
			})
			if not minetest.setting_getbool("creative_mode") then
				item:add_wear(300)
				clicker:get_inventory():set_stack("main", clicker:get_wield_index(), item)
			end
		end
		if minetest.get_item_group(item:get_name(), "dye") == 1 and not self.naked then
		print(item:get_name(), minetest.get_item_group(item:get_name(), "dye"))
			local name = item:get_name()
			local pname = name:split(":")[2]

			self.object:set_properties({
				textures = {"mobs_sheep_"..pname..".png"},
				--mesh = "sheeps.b3d",
			})
			self.color = pname
			self.drops = {
				{name = "mobs:mutton_raw",
				chance = 1,
				min = 1,
				max = 2,},
				{name = "wool:"..self.color,
				chance = 1,
				min = 1,
				max = 1,},
			}
		end
	end,
})
mobs:register_spawn("mobs_mc:sheep", {"default:dirt_with_grass"}, 20, 12, 15000, 3, 31000)


--mutton
minetest.register_craftitem(":mobs:mutton_raw", {
	description = "Raw Mutton",
	inventory_image = "mutton_raw.png",
	on_use = minetest.item_eat(4),
})

minetest.register_craftitem(":mobs:mutton_cooked", {
	description = "Cooked Mutton",
	inventory_image = "mutton_cooked.png",
	on_use = minetest.item_eat(8),
})

minetest.register_craft({
	type = "cooking",
	output = "mobs:mutton_cooked",
	recipe = "mobs:mutton_raw",
	cooktime = 5,
})

--[[
-- compatibility
mobs:alias_mob("mobs:sheep", "mobs_mc:sheep")
]]
mobs:alias_mob("mobs_animal:sheep", "mobs_mc:sheep")
-- spawn eggs
--mobs:register_egg("mobs_mc:sheep", "Sheep", "spawn_egg_sheep.png")
mobs:register_egg("mobs_mc:sheep", "Sheep", "sheep_inv.png", 0)

if minetest.setting_get("log_mods") then
	minetest.log("action", "MC Sheep loaded")
end
