

--###################
--################### RABBIT
--###################
--[[
mobs:register_mob("mobs_mc:23rabbit", {
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
	mesh = "rabbit.b3d",
    textures = {{"rabbit.png"},{"rabbit1.png"},{"rabbit2.png"},{"rabbit3.png"},{"rabbit4.png"},{"rabbit5.png"},{"rabbit6.png"},{"rabbit7.png"}},
	visual_size = {x=1.5, y=1.5},
	walk_velocity = 0.6,
	run_velocity = 2,
	jump = true,
	animation = {
		speed_normal = 25,		speed_run = 50,
		stand_start = 0,		stand_end = 0,
		walk_start = 0,		walk_end = 20,
		run_start = 0,		run_end = 20,
	},
})

mobs:register_egg("mobs_mc:23rabbit", "Rabbit", "rabbit_inv.png", 0)
]]


-- Bunny by ExeterDad

mobs:register_mob("mobs_mc:rabbit", {
	type = "animal",
	passive = true,
	reach = 1,
	hp_min = 1,
	hp_max = 4,
	armor = 150,
    collisionbox = {-0.35, -0.01, -0.35, 0.35, 2, 0.35},
    rotate = -180,
	visual = "mesh",
	mesh = "rabbit.b3d",
    textures = {{"rabbit.png"},{"rabbit1.png"},{"rabbit2.png"},{"rabbit3.png"},{"rabbit4.png"},{"rabbit5.png"},{"rabbit6.png"},{"rabbit7.png"}},
	visual_size = {x=1.5, y=1.5},
	sounds = {},
	makes_footstep_sound = false,
	walk_velocity = 1,
	run_velocity = 2,
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
	follow = {"farming:carrot", "farming_plus:carrot_item"},
	view_range = 8,
	replace_rate = 10,
	replace_what = {"farming:carrot_7", "farming:carrot_8", "farming_plus:carrot"},
	replace_with = "air",
	on_rightclick = function(self, clicker)

		-- feed or tame
		if mobs:feed_tame(self, clicker, 4, true, true) then
			return
		end

		-- Monty Python tribute
		local item = clicker:get_wielded_item()

		if item:get_name() == "mobs:lava_orb" then

			if not minetest.setting_getbool("creative_mode") then
				item:take_item()
				clicker:set_wielded_item(item)
			end

			self.object:set_properties({
				textures = {"mobs_bunny_evil.png"},
			})

			self.type = "monster"
			self.object:set_hp(20)

			return
		end

		mobs:capture_mob(self, clicker, 30, 50, 80, false, nil)
	end,

	attack_type = "dogfight",
	damage = 5,
})

mobs:register_spawn("mobs_mc:rabbit",
	{"default:dirt_with_grass", "ethereal:prairie_dirt"}, 20, 10, 15000, 2, 31000, true)

--mobs:register_egg("mobs_mc:bunny", S("Bunny"), "mobs_bunny_inv.png", 0)
mobs:register_egg("mobs_mc:rabbit", "Rabbit", "rabbit_inv.png", 0)
-- compatibility
mobs:alias_mob("mobs:bunny", "mobs_mc:bunny")
