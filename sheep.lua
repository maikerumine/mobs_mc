--License for code WTFPL and otherwise stated in readmes

-- intllib
local MP = minetest.get_modpath(minetest.get_current_modname())
local S, NS = dofile(MP.."/intllib.lua")

--dofile(minetest.get_modpath("mobs").."/api.lua")


--###################
--################### SHEEP
--###################


local colors = {
	-- group = { wool, textures }
	unicolor_white = { mobs_mc.items.wool_white, { "mobs_mc_sheep_white.png" } },
	unicolor_dark_orange = { mobs_mc.items.wool_brown, { "mobs_mc_sheep_brown.png" } },
	unicolor_grey = { mobs_mc.items.wool_light_grey, { "mobs_mc_sheep_grey.png" } },
	unicolor_darkgrey = { mobs_mc.items.wool_grey, { "mobs_mc_sheep_dark_grey.png" } },
	unicolor_blue = { mobs_mc.items.wool_blue, { "mobs_mc_sheep_blue.png" } },
	unicolor_dark_green = { mobs_mc.items.wool_green, { "mobs_mc_sheep_dark_green.png" } },
	unicolor_green = { mobs_mc.items.wool_lime, { "mobs_mc_sheep_green.png" } },
	unicolor_violet = { mobs_mc.items.wool_purple , { "mobs_mc_sheep_violet.png" } },
	unicolor_light_red = { mobs_mc.items.wool_pink, { "mobs_mc_sheep_pink.png" } },
	unicolor_yellow = { mobs_mc.items.wool_yellow, { "mobs_mc_sheep_yellow.png" } },
	unicolor_orange = { mobs_mc.items.wool_orange, { "mobs_mc_sheep_orange.png" } },
	unicolor_red = { mobs_mc.items.wool_red, { "mobs_mc_sheep_red.png" } },
	unicolor_cyan  = { mobs_mc.items.wool_cyan, { "mobs_mc_sheep_cyan.png" } },
	unicolor_red_violet = { mobs_mc.items.wool_magenta, { "mobs_mc_sheep_magenta.png" } },
	unicolor_black = { mobs_mc.items.wool_black, { "mobs_mc_sheep_black.png" } },
}

if minetest.get_modpath("mcl_wool") ~= nil then
	colors["unicolor_light_blue"] = { mobs_mc.items.wool_light_blue, { "mobs_mc_sheep_light_blue.png" } }
end

--mcsheep
mobs:register_mob("mobs_mc:sheep", {
	type = "animal",
	hp_min = 8,
	hp_max = 8,

	collisionbox = {-0.45, -0.01, -0.45, 0.45, 1.29, 0.45},

	visual = "mesh",
	visual_size = {x=0.65, y=0.65},
	-- TODO: Switch to AMC sheep mesh
	mesh = "mobs_sheep.x",
	textures = {
		{"mobs_mc_sheep_white.png"},--was sheep
	},
	gotten_texture = "mobs_mc_sheep_sheared.png",
	makes_footstep_sound = true,
	walk_velocity = 1,
	drops = {
		{name = mobs_mc.items.mutton_raw,
		chance = 1,
		min = 1,
		max = 2,},
		{name = colors["unicolor_white"][1],
		chance = 1,
		min = 1,
		max = 1,},
	},
	water_damage = 1,
	lava_damage = 4,
	light_damage = 0,
	fear_height = 4,
	sounds = {
		random = "mobs_sheep",
		death = "mobs_sheep",
		damage = "mobs_sheep",
		distance = 16,
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
	follow = mobs_mc.follow.sheep,
	view_range = 12,

	-- Eat grass
	replace_rate = 20,
	replace_what = mobs_mc.replace.sheep,

	-- Set random color on spawn
	do_custom = function(self)
		if not self.initial_color_set then
			local r = math.random(0,100000)
			local textures
			if r <= 81836 then
				-- 81.836%
				self.color = "unicolor_white"
			elseif r <= 81836 + 5000 then
				-- 5%
				self.color = "unicolor_grey"
			elseif r <= 81836 + 5000 + 5000 then
				-- 5%
				self.color = "unicolor_darkgrey"
			elseif r <= 81836 + 5000 + 5000 + 5000 then
				-- 5%
				self.color = "unicolor_black"
			elseif r <= 81836 + 5000 + 5000 + 5000 + 3000 then
				-- 3%
				self.color = "unicolor_dark_orange"
			else
				-- 0.164%
				self.color = "unicolor_light_red"
			end
			self.base_texture = colors[self.color][2]
			self.object:set_properties({ textures = self.base_texture })
			self.drops = {
				{name = mobs_mc.items.mutton_raw,
				chance = 1,
				min = 1,
				max = 2,},
				{name = colors[self.color][1],
				chance = 1,
				min = 1,
				max = 1,},
			}
			self.initial_color_set = true
		end
	end,
	
	on_rightclick = function(self, clicker)
		local item = clicker:get_wielded_item()
		if item:get_name() == mobs_mc.items.wheat then
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
		if item:get_name() == mobs_mc.items.shears and not self.gotten then
			self.gotten = true
			local pos = self.object:getpos()
			minetest.sound_play("shears", {pos = pos})
			pos.y = pos.y + 0.5
			if not self.color then
				self.color = "unicolor_white"
			end
			minetest.add_item(pos, ItemStack(colors[self.color][1].." "..math.random(1,3)))
			-- FIXME: This is a workaround for the fact that Mobs Redo does not have on_replace
			self.color = "unicolor_white"
			-- TODO: Use new mesh for sheared sheep (AMC)
			self.base_texture = {"mobs_mc_sheep_sheared.png"}
			self.object:set_properties({
				textures = self.base_texture,
			})
			if not minetest.settings:get_bool("creative_mode") then
				item:add_wear(300)
				clicker:get_inventory():set_stack("main", clicker:get_wield_index(), item)
			end
			self.drops = {
				{name = mobs_mc.items.mutton_raw,
				chance = 1,
				min = 1,
				max = 2,},
			}
		end
		-- Dye sheep
		if minetest.get_item_group(item:get_name(), "dye") == 1 and not self.gotten then
			minetest.log("verbose", "[mobs_mc] " ..item:get_name() .. " " .. minetest.get_item_group(item:get_name(), "dye"))
			for group, colordata in pairs(colors) do
				if minetest.get_item_group(item:get_name(), group) == 1 then
					self.base_texture = colordata[2]
					self.object:set_properties({
						textures = self.base_texture,
					})
					self.color = group
					self.drops = {
						{name = mobs_mc.items.mutton_raw,
						chance = 1,
						min = 1,
						max = 2,},
						{name = colordata[1],
						chance = 1,
						min = 1,
						max = 1,},
					}
					break
				end
			end
		end
	end,
})
mobs:register_spawn("mobs_mc:sheep", mobs_mc.spawn.grassland, minetest.LIGHT_MAX+1, 0, 5000, 3, 31000)

-- compatibility
mobs:alias_mob("mobs_animal:sheep", "mobs_mc:sheep")
-- spawn eggs
mobs:register_egg("mobs_mc:sheep", S("Sheep"), "mobs_mc_spawn_icon_sheep.png", 0)

if minetest.settings:get_bool("log_mods") then
	minetest.log("action", "MC Sheep loaded")
end
