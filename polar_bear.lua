--MCmobs v0.4
--maikerumine
--made for MC like Survival game
--License for code WTFPL and otherwise stated in readmes


--dofile(minetest.get_modpath("mobs").."/api.lua")

--###################
--################### POLARBEAR
--###################
--[[
mobs:register_mob("mobs_mc:2polarbear", {
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
	mesh = "polarbear.b3d",
	textures = {
		{"polarbear.png"},
	},
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

mobs:register_egg("mobs_mc:2polarbear", "Polarbear", "polarbear_inv.png", 0)
]]

mobs:register_mob("mobs_mc:polar_bear", {
	type = "animal",
    runaway = false,
   passive = false,
    stepheight = 1.2,
	hp_min = 30,
	hp_max = 30,
    --collisionbox = {-0.35, -0.01, -0.35, 0.35, 2, 0.35},
	collisionbox = {-0.45, -0.01, -0.45, 0.45, 1.09, 0.45},
    rotate = -180,
	visual = "mesh",
	mesh = "polarbear.b3d",
	textures = {
		{"polarbear.png"},
	},
	visual_size = {x=3, y=3},
	makes_footstep_sound = true,
	damage = 6,
	walk_velocity = 1.2,
	run_velocity = 2.4,
	group_attack = true,
	attack_type = "dogfight",
	drops = {
		{name = "fishing:fish_raw",
		chance = 5,
		min = 1,
		max = 2,},		
		{name = "fishing:pike_raw",
		chance = 5,
		min = 1,
		max = 2,},

	},
	drawtype = "front",
	water_damage = 1,
	lava_damage = 5,
	light_damage = 0,
	fear_height = 3,
	sounds = {
		random = "Cowhurt1",
	},
	animation = {
		speed_normal = 25,		speed_run = 50,
		stand_start = 0,		stand_end = 0,
		walk_start = 0,		walk_end = 40,
		run_start = 0,		run_end = 40,
	},
	--[[
	follow = "farming:wheat",
	view_range = 5,
	on_rightclick = function(self, clicker)
		local item = clicker:get_wielded_item()
		if item:get_name() == "bucket:bucket_empty" and clicker:get_inventory() then
			local inv = clicker:get_inventory()
			inv:remove_item("main", "bucket:bucket_empty")
			-- if room add bucket of milk to inventory, otherwise drop as item
			if inv:room_for_item("main", {name="mobs:bucket_milk"}) then
				clicker:get_inventory():add_item("main", "mobs:bucket_milk")
			else
				local pos = self.object:getpos()
				pos.y = pos.y + 0.5
				minetest.add_item(pos, {name = "mobs:bucket_milk"})
			end
		end
	end,
	]]
	--from mobs_animals
	follow = "fishing:clownfish_raw","fishing:fish_raw", "fishing:pike_raw", "fishing:shark_raw","fishing:perch_raw","fishing:exoticfish_raw","fishing:bluewhite_raw",
	view_range = 12,
	replace_rate = 10,
	replace_what = {"default:grass_3", "default:grass_4", "default:grass_5", "farming:wheat_8"},
	replace_with = "air",


})


-- compatibility
mobs:alias_mob("mobs_mc:polarbear", "mobs_mc:polar_bear")


mobs:register_spawn("mobs_mc:polar_bear", {"default:snowblock"}, 20, 8, 17000, 3, 31000)


-- spawn egg



mobs:register_egg("mobs_mc:polar_bear", "Polar bear", "polarbear_inv.png", 0)


if minetest.settings:get_bool("log_mods") then
	minetest.log("action", "MC Polar Bear loaded")
end
