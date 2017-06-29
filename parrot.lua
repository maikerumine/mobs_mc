--MCmobs v0.4
--maikerumine
--made for MC like Survival game
--License for code WTFPL and otherwise stated in readmes


--dofile(minetest.get_modpath("mobs").."/api.lua")


--###################
--################### PARROT
--###################



mobs:register_mob("mobs_mc:parrot", {
	type = "npc",
	pathfinding = true,
	hp_min = 6,
	hp_max = 6,
    collisionbox = {-0.25, -0.01, -0.25, 0.25, 0.6, 0.25},
	visual = "mesh",
	mesh = "mobs_mc_parrot.b3d",
	textures = {{"mobs_mc_parrot_blue.png"},{"mobs_mc_parrot_green.png"},{"mobs_mc_parrot_grey.png"},{"mobs_mc_parrot_red_blue.png"},{"mobs_mc_parrot_yellow_blue.png"}},
	visual_size = {x=3, y=3},
	makes_footstep_sound = true,
	walk_velocity = .8,
	run_velocity = 2.6,
	drops = {
		{name = mobs_mc.items.feather,
		chance = 1,
		min = 1,
		max = 2,},
	},
    	animation = {
		speed_normal = 50,
		speed_run = 50,
		stand_start = 0,
		stand_end = 0,
		walk_start = 0,
		walk_end = 130,
		--run_start = 0,
		--run_end = 20,
		--fly_start = 30,
		--fly_end = 45,
	},
	drawtype = "front",
	water_damage = 10,
	lava_damage = 2,
	light_damage = 0,
	fall_damage = 0,
	view_range = 16,
	attack_type = "dogfight",
	attacks_monsters = true,
	jump = true,
	jump_height = 4,
	stepheight = 1.2,
	floats=1,
	physical = true,
	fly = true,
	fly_in = {"air"},
	jump_chance = 98,
	fear_height = 120,	
	view_range = 25,

	on_rightclick = function(self, clicker)

		if mobs:feed_tame(self, clicker, 8, true, true) then
			return
		end

		mobs:capture_mob(self, clicker, 30, 50, 80, false, nil)
	end,

})


--spawn
-- TODO: Increase spawn chance if polished
mobs:spawn_specific("mobs_mc:parrot", mobs_mc.spawn.jungle, {"air"}, 0, minetest.LIGHT_MAX+1, 20, 20000, 2, 15, 20)

-- spawn eggs
mobs:register_egg("mobs_mc:parrot", "Parrot", "mobs_mc_spawn_icon_parrot.png", 0)

if minetest.settings:get_bool("log_mods") then
	minetest.log("action", "MC Parrot loaded")
end
