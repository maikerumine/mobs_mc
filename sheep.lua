--License for code WTFPL and otherwise stated in readmes

local colors = {
	-- dyecolor = { woolcolor, textures }
	white = { "white", { "mobs_mc_sheep_white.png" } },
	brown = { "brown", { "mobs_mc_sheep_brown.png" } },
	grey = { "silver", { "mobs_mc_sheep_grey.png" } },
	dark_grey = { "grey", { "mobs_mc_sheep_dark_grey.png" } },
	blue = { "blue", { "mobs_mc_sheep_blue.png" } },
	dark_green = { "green", { "mobs_mc_sheep_dark_green.png" } },
	green = { "lime", { "mobs_mc_sheep_green.png" } },
	violet = { "purple", { "mobs_mc_sheep_violet.png" } },
	pink = { "pink", { "mobs_mc_sheep_pink.png" } },
	yellow = { "yellow", { "mobs_mc_sheep_yellow.png" } },
	orange = { "orange", { "mobs_mc_sheep_orange.png" } },
	red = { "red", { "mobs_mc_sheep_red.png" } },
	cyan  = { "cyan", { "mobs_mc_sheep_cyan.png" } },
	magenta = { "magenta", { "mobs_mc_sheep_magenta.png" } },
	black = { "black", { "mobs_mc_sheep_black.png" } },
}

if minetest.get_modpath("mcl_wool") ~= nil then
	colors["lightblue"] = { "light_blue", { "mobs_mc_sheep_light_blue.png" } }
end

--mcsheep
mobs:register_mob("mobs_mc:sheep", {
	type = "animal",
	hp_min = 8,
	hp_max = 8,

	collisionbox = {-0.45, -0.01, -0.45, 0.45, 1.29, 0.45},

	visual = "mesh",
	visual_size = {x=0.65, y=0.65},
	mesh = "mobs_sheep.x",
	textures = {
		{"mobs_mc_sheep_white.png"},--was sheep
	},
	gotten_texture = "mobs_mc_sheep_sheared.png",
	makes_footstep_sound = true,
	walk_velocity = 1,
	drops = {
		{name = "mobs_mc:mutton_raw",
		chance = 1,
		min = 1,
		max = 2,},
		{name = "wool:white",
		chance = 1,
		min = 1,
		max = 1,},
	},
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

	-- Eat grass
	replace_rate = 20,
	replace_what = {
		-- “Grass Block”
		{ "default:dirt_with_grass", "default:dirt", -1 },
		-- “Tall Grass”
		{ "default:grass_5", "air", 0 },
		{ "default:grass_4", "air", 0 },
		{ "default:grass_3", "air", 0 },
		{ "default:grass_2", "air", 0 },
		{ "default:grass_1", "air", 0 },
	},
	
	-- Set random color on spawn
	do_custom = function(self)
		if not self.initial_color_set then
			local r = math.random(0,100000)
			local textures
			if r <= 81836 then
				-- 81.836%
				self.color = colors["white"][1]
				self.base_texture = colors["white"][2]
			elseif r <= 81836 + 5000 then
				-- 5%
				self.color = colors["grey"][1]
				self.base_texture = colors["grey"][2]
			elseif r <= 81836 + 5000 + 5000 then
				-- 5%
				self.color = colors["dark_grey"][1]
				self.base_texture = colors["dark_grey"][2]
			elseif r <= 81836 + 5000 + 5000 + 5000 then
				-- 5%
				self.color = colors["black"][1]
				self.base_texture = colors["black"][2]
			elseif r <= 81836 + 5000 + 5000 + 5000 + 3000 then
				-- 3%
				self.color = colors["brown"][1]
				self.base_texture = colors["brown"][2]
			else
				-- 0.164%
				self.color = colors["pink"][1]
				self.base_texture = colors["pink"][2]
			end
			self.object:set_properties({ textures = self.base_texture })
			self.drops = {
				{name = "mobs_mc:mutton_raw",
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
				if not minetest.settings:get_bool("creative_mode") then
					item:take_item()
					clicker:set_wielded_item(item)
				end
				self.tamed = true
			elseif self.gotten then
				if not minetest.settings:get_bool("creative_mode") then
					item:take_item()
					clicker:set_wielded_item(item)
				end
				self.food = (self.food or 0) + 1
				if self.food >= 4 then
					self.food = 0
					self.gotten = false
					self.base_texture = colors[self.color][2]
					self.object:set_properties({
						textures = self.base_texture, --was sheep.png
					})
				end
			end
			return
		end
		if item:get_name() == "mobs:shears" and not self.gotten then
			self.gotten = true
			local pos = self.object:getpos()
			minetest.sound_play("shears", {pos = pos})
			pos.y = pos.y + 0.5
			if not self.color then
				minetest.add_item(pos, ItemStack("wool:white "..math.random(1,3)))
			else
				minetest.add_item(pos, ItemStack("wool:"..self.color.." "..math.random(1,3)))
			end
			-- FIXME: This is a workaround for the fact that Mobs Redo does not have on_replace
			self.color = "white"
			self.base_texture = {"mobs_mc_sheep_sheared.png"}
			self.object:set_properties({
				textures = self.base_texture,
			})
			if not minetest.settings:get_bool("creative_mode") then
				item:add_wear(300)
				clicker:get_inventory():set_stack("main", clicker:get_wield_index(), item)
			end
			self.drops = {
				{name = "mobs_mc:mutton_raw",
				chance = 1,
				min = 1,
				max = 2,},
			}
		end
		if minetest.get_item_group(item:get_name(), "dye") == 1 and not self.gotten then
			minetest.log("verbose", "[mobs_mc] " ..item:get_name() .. " " .. minetest.get_item_group(item:get_name(), "dye"))
			local name = item:get_name()
			local pname = name:split(":")[2]
			if colors[pname] then

				self.base_texture = colors[pname][2]
				self.object:set_properties({
					textures = self.base_texture,
				})
				self.color = pname
				self.drops = {
					{name = "mobs_mc:mutton_raw",
					chance = 1,
					min = 1,
					max = 2,},
					{name = "wool:"..self.color,
					chance = 1,
					min = 1,
					max = 1,},
				}
			end
		end
	end,
})
mobs:register_spawn("mobs_mc:sheep", {"default:dirt_with_grass"}, 20, 12, 15000, 3, 31000)


--mutton
minetest.register_craftitem("mobs_mc:mutton_raw", {
	description = "Raw Mutton",
	inventory_image = "mcl_mobitems_mutton_raw.png",
	on_use = minetest.item_eat(4),
})

minetest.register_craftitem("mobs_mc:mutton_cooked", {
	description = "Cooked Mutton",
	inventory_image = "mcl_mobitems_mutton_cooked.png",
	on_use = minetest.item_eat(8),
})

minetest.register_craft({
	type = "cooking",
	output = "mobs_mc:mutton_cooked",
	recipe = "mobs_mc:mutton_raw",
	cooktime = 5,
})

-- compatibility
mobs:alias_mob("mobs_animal:sheep", "mobs_mc:sheep")
-- spawn eggs
mobs:register_egg("mobs_mc:sheep", "Sheep", "mobs_mc_spawn_icon_sheep.png", 0)

if minetest.settings:get_bool("log_mods") then
	minetest.log("action", "MC Sheep loaded")
end
