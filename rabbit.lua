--License for code WTFPL and otherwise stated in readmes

local rabbit = {
	type = "animal",
	passive = true,
	reach = 2,

	hp_min = 3,
	hp_max = 3,
	collisionbox = {-0.2, -0.01, -0.2, 0.2, 0.49, 0.2},

	rotate = -180,
	visual = "mesh",
	mesh = "rabbit.b3d",
	textures = {
        {"mobs_mc_rabbit_brown.png"},
        {"mobs_mc_rabbit_gold.png"},
        {"mobs_mc_rabbit_white.png"},
        {"mobs_mc_rabbit_white_splotched.png"},
        {"mobs_mc_rabbit_salt.png"},
        {"mobs_mc_rabbit_black.png"},
	},
	visual_size = {x=1.5, y=1.5},
	sounds = {},
	makes_footstep_sound = false,
	walk_velocity = 1,
	run_velocity = 3.7,
	floats = 1,
	runaway = true,
	jump = true,
	drops = {
		{name = "mobs:meat_raw", chance = 1, min = 1, max = 1},
	},
	water_damage = 1,
	lava_damage = 4,
	light_damage = 0,
	fear_height = 2,
	animation = {
		speed_normal = 25,		speed_run = 50,
		stand_start = 0,		stand_end = 0,
		walk_start = 0,		walk_end = 20,
		run_start = 0,		run_end = 20,
	},
	-- Follow (yellow) dangelions, carrots and golden carrots
	follow = {
		"flowers:dandelion_yellow", -- Minetest Game
		"farming:carrot", "farming:carrot_gold", -- Farming Redo
		"farming_plus:carrot_item", -- Farming Plus
	},
	view_range = 8,
	-- Eat carrots and reduce their growth stage by 1
	replace_rate = 10,
	replace_what = {
		-- Farming Redo carrots
		{"farming:carrot_8", "farming:carrot_7", 0},
		{"farming:carrot_7", "farming:carrot_6", 0},
		{"farming:carrot_6", "farming:carrot_5", 0},
		{"farming:carrot_5", "farming:carrot_4", 0},
		{"farming:carrot_4", "farming:carrot_3", 0},
		{"farming:carrot_3", "farming:carrot_2", 0},
		{"farming:carrot_2", "farming:carrot_1", 0},
		{"farming:carrot_1", "air", 0},
		-- Farming Plus carrots
		{"farming_plus:carrot", "farming_plus:carrot_7", 0},
		{"farming_plus:carrot_6", "farming_plus:carrot_5", 0},
		{"farming_plus:carrot_5", "farming_plus:carrot_4", 0},
		{"farming_plus:carrot_4", "farming_plus:carrot_3", 0},
		{"farming_plus:carrot_3", "farming_plus:carrot_2", 0},
		{"farming_plus:carrot_2", "farming_plus:carrot_1", 0},
		{"farming_plus:carrot_1", "air", 0},
	},
	on_rightclick = function(self, clicker)

		-- feed or tame
		if mobs:feed_tame(self, clicker, 4, true, true) then
			return
		end

		mobs:capture_mob(self, clicker, 30, 50, 80, false, nil)
	end,
	do_custom = function(self)
		-- Easter egg: Change texture if rabbit is named “Toast”
		if self.nametag == "Toast" and not self._has_toast_texture then
			self._original_rabbit_texture = self.base_texture
			self.base_texture = { "mobs_mc_rabbit_toast.png" }
			self.object:set_properties({ textures = self.base_texture })
			self._has_toast_texture = true
		elseif self.nametag ~= "Toast" and self._has_toast_texture then
			self.base_texture = self._original_rabbit_texture
			self.object:set_properties({ textures = self.base_texture })
			self._has_toast_texture = false
		end
	end,
}

mobs:register_mob("mobs_mc:rabbit", rabbit)

-- The killer bunny (Only with spawn egg)
local killer_bunny = table.copy(rabbit)
killer_bunny.type = "monster"
killer_bunny.attack_type = "dogfight"
killer_bunny.specific_attack = { "player", "mobs_mc:wolf", "mobs_mc:dog" }
killer_bunny.damage = 8
killer_bunny.passive = false
-- 8 armor points
killer_bunny.armor = 50
killer_bunny.textures = { "mobs_mc_rabbit_caerbannog.png" }
killer_bunny.view_range = 16
killer_bunny.replace_rate = nil
killer_bunny.replace_what = nil
killer_bunny.on_rightclick = nil
killer_bunny.run_velocity = 6
killer_bunny.do_custom = function(self)
	if not self._killer_bunny_nametag_set then
		self.nametag = "The Killer Bunny"
		self._killer_bunny_nametag_set = true
	end
end

mobs:register_mob("mobs_mc:killer_bunny", killer_bunny)

--spawn
mobs:register_spawn("mobs_mc:rabbit",
	{"default:dirt_with_grass", "ethereal:prairie_dirt", "default:snowblock", "default:sand"}, 20, 10, 15000, 2, 31000, true)

-- Spawn egg
mobs:register_egg("mobs_mc:rabbit", "Rabbit", "rabbit_inv.png", 0)

-- TODO: Update inventory image
-- Note: This spawn egg does not exist in Minecraft
mobs:register_egg("mobs_mc:killer_bunny", "Killer Bunny", "rabbit_inv.png", 0)

-- compatibility
mobs:alias_mob("mobs:bunny", "mobs_mc:rabbit")

if minetest.setting_get("log_mods") then
	minetest.log("action", "MC Bunny loaded")
end
