--MCmobs v0.2
--maikerumine
--made for MC like Survival game
--License for code WTFPL and otherwise stated in readmes


--dofile(minetest.get_modpath("mobs").."/api.lua")

--###################
--################### COW MOOSHROOM
--###################
--[[
mobs:register_mob("mobs_mc:mooshroom_cow", {
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
	mesh = "mooshroom.b3d",
	textures = {
		{"mooshroom.png"},
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

mobs:register_egg("mobs_mc:mooshroom_cow", "Mooshroom", "mooshroom_inv.png", 0)
]]

mobs:register_mob("mobs_mc:mooshroom_cow", {
	type = "animal",
	runaway = true,
    stepheight = 1.2,
	hp_max = 10,
	hp_min = 10,
    collisionbox = {-0.6, -0.01, -0.6, 0.6, 1.8, 0.6},
    rotate = -180,
	visual = "mesh",
	mesh = "mooshroom.b3d",
	textures = {
		{"mooshroom.png"},
	},
	visual_size = {x=3, y=3},
	makes_footstep_sound = true,
	walk_velocity = 1,
	drops = {
		{name = "mobs:beef_raw",
		chance = 1,
		min = 1,
		max = 3,},
		{name = "mobs:leather",
		chance = 1,
		min = 0,
		max = 2,},
	},
	drawtype = "front",
	water_damage = 1,
	lava_damage = 5,
	light_damage = 0,
	sounds = {
		random = "Cow1",
		death = "Cowhurt1",
		damage = "Cowhurt1",
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
	follow = "farming:wheat",
	view_range = 7,
	replace_rate = 10,
	replace_what = {"default:grass_3", "default:grass_4", "default:grass_5", "farming:wheat_8"},
	replace_with = "air",
	fear_height = 2,
	on_rightclick = function(self, clicker)

		-- feed or tame
		if mobs:feed_tame(self, clicker, 8, true, true) then
			return
		end

		local tool = clicker:get_wielded_item()

		-- milk cow with empty bucket
		if tool:get_name() == "default:bowl" then

			--if self.gotten == true
			if self.child == true then
				return
			end

			if self.gotten == true then
				minetest.chat_send_player(clicker:get_player_name(),
						"Cow already stewed!")
				return
			end

			local inv = clicker:get_inventory()

			inv:remove_item("main", "default:bowl")

			if inv:room_for_item("main", {name = "mcl_mushrooms:mushroom_stew"}) then
				clicker:get_inventory():add_item("main", "mcl_mushrooms:mushroom_stew")
			else
				local pos = self.object:getpos()
				pos.y = pos.y + 0.5
				minetest.add_item(pos, {name = "mcl_mushrooms:mushroom_stew"})
			end

			self.gotten = true -- milked

			return
		end

		mobs:capture_mob(self, clicker, 0, 5, 60, false, nil)
	end,	
})

mobs:register_spawn("mobs_mc:mooshroom_cow", {"default:mycelium_snow", "default:mycelium"}, 20, 8, 7000, 1, 31000)

--[[
-- beef
minetest.register_craftitem(":mobs:beef_raw", {
	description = "Raw Beef",
	inventory_image = "beef_raw.png",
	on_use = minetest.item_eat(3),
})

minetest.register_craftitem(":mobs:beef_cooked", {
	description = "Steak",
	inventory_image = "beef_cooked.png",
	on_use = minetest.item_eat(8),
})

minetest.register_craft({
	type = "cooking",
	output = "mobs:beef_cooked",
	recipe = "mobs:beef_raw",
	cooktime = 5,
})


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
]]

--[[
-- compatibility
mobs:alias_mob("mobs:cow", "mobs_mc:cow")
]]
-- spawn egg
--mobs:register_egg("mobs_mc:mooshroom_cow", "Mooshroom_Cow", "spawn_egg_mooshroom_cow.png")
mobs:register_egg("mobs_mc:mooshroom_cow", "Mooshroom", "mooshroom_inv.png", 0)

if minetest.settings:get_bool("log_mods") then
	minetest.log("action", "MC Cow loaded")
end
