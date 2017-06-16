--MCmobs v0.4
--maikerumine
--made for MC like Survival game
--License for code WTFPL and otherwise stated in readmes


--dofile(minetest.get_modpath("mobs").."/api.lua")


--###################
--################### COW
--###################
--[[
mobs:register_mob("mobs_mc:0acow", {
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
	mesh = "cow.b3d",
	textures = {
		{"cow.png"},
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

mobs:register_egg("mobs_mc:0acow", "Cow", "cow_inv.png", 0)
]]

mobs:register_mob("mobs_mc:cow", {
	type = "animal",
	hp_min = 10,
	hp_max = 10,
	collisionbox = {-0.45, -0.01, -0.45, 0.45, 1.39, 0.45},
	rotate = -180,
	visual = "mesh",
	mesh = "cow.b3d",
	textures = {
		{"cow.png"},
	},
	visual_size = {x=2.8, y=2.8},
	makes_footstep_sound = true,
	walk_velocity = 1,
	drops = {
		{name = "mobs_mc:beef_raw",
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
	fear_height = 3,
	runaway = true,
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
	follow = "farming:wheat",
	on_rightclick = function(self, clicker)
		local item = clicker:get_wielded_item()
		if item:get_name() == "bucket:bucket_empty" and clicker:get_inventory() then
			local inv = clicker:get_inventory()
			inv:remove_item("main", "bucket:bucket_empty")
			-- if room add bucket of milk to inventory, otherwise drop as item
			if inv:room_for_item("main", {name="mobs_mc:milk_bucket"}) then
				clicker:get_inventory():add_item("main", "mobs_mc:milk_bucket")
			else
				local pos = self.object:getpos()
				pos.y = pos.y + 0.5
				minetest.add_item(pos, {name = "mobs_mc:milk_bucket"})
			end
		end
		mobs:capture_mob(self, clicker, 0, 5, 60, false, nil)
	end,
	follow = "farming:wheat",
	view_range = 10,
	fear_height = 2,
})

mobs:register_spawn("mobs_mc:cow", {"default:dirt_with_grass"}, 20, 8, 17000, 2, 31000)


-- beef
minetest.register_craftitem("mobs_mc:beef_raw", {
	description = "Raw Beef",
	inventory_image = "beef_raw.png",
	on_use = minetest.item_eat(3),
})

minetest.register_craftitem("mobs_mc:beef_cooked", {
	description = "Steak",
	inventory_image = "beef_cooked.png",
	on_use = minetest.item_eat(8),
})

minetest.register_craft({
	type = "cooking",
	output = "mobs_mc:beef_cooked",
	recipe = "mobs_mc:beef_raw",
	cooktime = 5,
})

-- milk
minetest.register_craftitem("mobs_mc:milk_bucket", {
	description = "Milk",
	inventory_image = "mobs_bucket_milk.png",
	on_use = minetest.item_eat(1, "bucket:bucket_empty"),
	stack_max = 1,
})

-- compatibility
mobs:alias_mob("mobs_animal:cow", "mobs_mc:cow")

-- spawn egg
mobs:register_egg("mobs_mc:cow", "Cow", "cow_inv.png", 0)

if minetest.setting_get("log_mods") then
	minetest.log("action", "MC Cow loaded")
end
