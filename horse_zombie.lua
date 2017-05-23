--MCmobs v0.2
--maikerumine
--made for MC like Survival game
--License for code WTFPL and otherwise stated in readmes


--dofile(minetest.get_modpath("mobs").."/api.lua")


--###################
--################### ZOMBIE HORSE
--###################
--[[
mobs:register_mob("mobs_mc:55horsezombie", {
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
	mesh = "horse.b3d",
    textures = {{"horsezombie.png"}},
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

mobs:register_egg("mobs_mc:55horsezombie", "Horse Zombie", "horsezombie_inv.png", 0)
]]

mobs:register_mob("mobs_mc:horsezombie", {
	type = "animal",
	hp_min = 5,
	hp_max = 10,
    collisionbox = {-0.35, -0.01, -0.35, 0.35, 2, 0.35},
    rotate = -180,
	visual = "mesh",
	mesh = "horse.b3d",
    textures = {{"horseskeleton.png"}},
	visual_size = {x=3, y=3},
	makes_footstep_sound = true,
	walk_velocity = 1,
	armor = 200,
	drops = {
		{name = "bonemeal:bone",
		chance = 1,
		min = 2,
		max = 3,},
	},
	drawtype = "front",
	water_damage = 1,
	lava_damage = 5,
	light_damage = 0,
	fear_height = 6,
	animation = {
		speed_normal = 15,
		stand_start = 25,		stand_end = 75,
		walk_start = 75,		walk_end = 100,
	},
	follow = "farming:wheat",
	view_range = 5,
--[[
	on_rightclick = function(self, clicker)
		local tool = clicker:get_wielded_item()
		if tool:get_name() == "mobs:saddle" then
			clicker:get_inventory():remove_item("main", "mobs:saddle")
			local pos = self.object:getpos()
			self.object:remove()
			minetest.add_entity(pos, "mobs_mc:horseh1")
		end
	end,
	
	]]
})


--mobs:register_spawn("mobs_mc:horsezombie", {"default:dirt_with_dry_grass","es:strange_grass","es:aiden_grass"}, 20, 12, 21000, 1, 12)
mobs:register_spawn("mobs_mc:horsezombie", {"default:dirt_with_dry_grass"}, 20, 12, 23000, 1, 31000)
mobs:register_spawn("mobs_mc:horsezombie", {"default:desert_sand"}, 20, 8, 7000, 1, 5)
mobs:register_spawn("mobs_mc:horsezombie", {"default:cobblestone"}, 5, -1, 17000, 1, 5)


mobs:register_egg("mobs_mc:horsezombie", "Horse Zombie", "horsezombie_inv.png", 0)



if minetest.setting_get("log_mods") then
	minetest.log("action", "MC Horse loaded")
end