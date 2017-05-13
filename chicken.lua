--MCmobs v0.2
--maikerumine
--made for MC like Survival game
--License for code WTFPL and otherwise stated in readmes


--dofile(minetest.get_modpath("mobs").."/api.lua")


mobs:register_mob("mobs_mc:chicken", {
	type = "animal",
	hp_max = 24,
	collisionbox = {-0.4, -0.01, -0.4, 0.4, 1, 0.4},
	
	visual = "mesh",
	mesh = "mobs_mc_chicken.x",
	textures = {
	{"mobs_mc_chicken.png"}
	},
	makes_footstep_sound = true,
	walk_velocity = 1,
	armor = 200,
	drops = {
		{name = "mobs:chicken_raw",
		chance = 1,
		min = 1,
		max = 1,},
		{name = "mobs:feather",
		chance = 1,
		min = 0,
		max = 2,},
	},
	drawtype = "front",
	water_damage = 1,
	lava_damage = 5,
	light_damage = 0,
	sounds = {
		random = "Chicken1",
		death = "Chickenhurt1",
		hurt = "Chickenhurt1",
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
		fly_start = 181,
		fly_end = 187,
	},
	--[[
	follow = "farming:seed_wheat",
	view_range = 5,
	on_rightclick = function(self, clicker)
		if clicker:get_inventory() then
			if minetest.registered_items[":mobs:egg"] then
				clicker:get_inventory():add_item("main", ItemStack(":mobs:egg 1"))
			end
		end
	end,
	
	do_custom = function(self)

		if self.child
		or math.random(1, 5000) > 1 then
			return
		end

		local pos = self.object:getpos()

		minetest.add_item(pos, ":mobs:egg")

		minetest.sound_play("default_place_node_hard", {
			pos = pos,
			gain = 1.0,
			max_hear_distance = 5,
		})
	end,
	]]
	--from mobs_animals
	follow = {"farming:seed_wheat", "farming:seed_cotton"},
	view_range = 5,

	on_rightclick = function(self, clicker)

		if mobs:feed_tame(self, clicker, 8, true, true) then
			return
		end

		mobs:capture_mob(self, clicker, 30, 50, 80, false, nil)
	end,

	do_custom = function(self)

		if self.child
		or math.random(1, 5000) > 1 then
			return
		end

		local pos = self.object:getpos()

		minetest.add_item(pos, "mobs:egg")

		minetest.sound_play("default_place_node_hard", {
			pos = pos,
			gain = 1.0,
			max_hear_distance = 5,
		})
	end,	
	
})

--mobs:register_spawn("mobs_mc:chicken", {"default:dirt_with_grass"}, 20, 8, 7000, 1, 31000)


-- chicken
minetest.register_craftitem(":mobs:chicken_raw", {
	description = "Raw Chicken",
	inventory_image = "chicken_raw.png",
	on_use = minetest.item_eat(2),
})

minetest.register_craftitem(":mobs:chicken_cooked", {
	description = "Cooked Chicken",
	inventory_image = "chicken_cooked.png",
	on_use = minetest.item_eat(6),
})

minetest.register_craft({
	type = "cooking",
	output = "mobs:chicken_cooked",
	recipe = "mobs:chicken_raw",
	cooktime = 5,
})


-- from mobs_redo
-- egg
minetest.register_node(":mobs:egg", {
	description = "Chicken Egg",
	tiles = {"mobs_chicken_egg.png"},
	inventory_image  = "mobs_chicken_egg.png",
	visual_scale = 0.7,
	drawtype = "plantlike",
	wield_image = "mobs_chicken_egg.png",
	paramtype = "light",
	walkable = false,
	is_ground_content = true,
	sunlight_propagates = true,
	selection_box = {
		type = "fixed",
		fixed = {-0.2, -0.5, -0.2, 0.2, 0, 0.2}
	},
	groups = {snappy = 2, dig_immediate = 3},
	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name = "mobs:egg", param2 = 1})
		end
	end,
	on_use = mobs_shoot_egg
})

-- fried egg
minetest.register_craftitem(":mobs:chicken_egg_fried", {
description = "Fried Egg",
	inventory_image = "mobs_chicken_egg_fried.png",
	on_use = minetest.item_eat(2),
})

minetest.register_craft({
	type  =  "cooking",
	recipe  = "mobs:egg",
	output = "mobs:chicken_egg_fried",
})

-- leather, feathers, etc.
minetest.register_craftitem(":mobs:feather", {
	description = "Feather",
	inventory_image = "mobs_feather.png",
})


-- compatibility
mobs:alias_mob("mobs:chicken", "mobs_mc:chicken")

-- spawn eggs
mobs:register_egg("mobs_mc:chicken", "Chicken", "spawn_egg_chicken.png")


if minetest.settings:get("log_mods") then
	minetest.log("action", "MC chicken loaded")
end