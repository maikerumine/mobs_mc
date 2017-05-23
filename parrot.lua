--MCmobs v0.2
--maikerumine
--made for MC like Survival game
--License for code WTFPL and otherwise stated in readmes


--dofile(minetest.get_modpath("mobs").."/api.lua")
--###################
--################### PARROT
--###################
--[[
mobs:register_mob("mobs_mc:1parrot", {
	type = "animal",
	passive = true,
    runaway = true,
    stepheight = 1.2,
	hp_min = 30,
	hp_max = 60,
	armor = 150,
    collisionbox = {-0.35, -0.01, -0.35, 0.35, 1, 0.35},
    rotate = -180,
	visual = "mesh",
	mesh = "parrot.b3d",
	textures = {{"parrot_blue.png"},{"parrot_green.png"},{"parrot_grey.png"},{"parrot_red_blue.png"},{"parrot_yellow_blue.png"}},
	visual_size = {x=3, y=3},
	walk_velocity = 1.5,
	run_velocity = 1.5,
	jump = false,
    jump_height = 0,
    --fly = true,
    --fly_in = "air",
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
})

mobs:register_egg("mobs_mc:1parrot", "Parrot", "parrot_inv.png", 0)
]]


mobs:register_mob("mobs_mc:parrot", {
	type = "npc",
	pathfinding = true,
	group_attack = true,
	hp_max = 90,
    collisionbox = {-0.35, -0.01, -0.35, 0.35, 1, 0.35},
    rotate = -180,
	visual = "mesh",
	mesh = "parrot.b3d",
	textures = {{"parrot_blue.png"},{"parrot_green.png"},{"parrot_grey.png"},{"parrot_red_blue.png"},{"parrot_yellow_blue.png"}},
	visual_size = {x=3, y=3},
	makes_footstep_sound = true,
	sounds = {
		random = "Villagerdeny",
	},
	walk_velocity = .8,
	run_velocity = 2.6,
	damage = 1,
	armor = 100,
	drops = {

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
	lava_damage = 0,
	light_damage = 0,
	fall_damage = 0,
	view_range = 16,
	attack_type = "dogfight",
	attacks_monsters = true,
	jump = true,
	jump_height = 4,
	floats=1,
	fly = true,
	jump_chance = 98,
	fear_height = 120,	
	
		follow = {"farming:seed_wheat", "farming:seed_cotton"},
	view_range = 25,

	on_rightclick = function(self, clicker)

		if mobs:feed_tame(self, clicker, 8, true, true) then
			return
		end

		mobs:capture_mob(self, clicker, 30, 50, 80, false, nil)
	end,

	do_custom = function(self)

		if self.child
		or math.random(1, 25000) > 1 then
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



mobs:spawn_specific("mobs_mc:parrot", {"default:jungleleaves", "air"},{"default:dirt_with_rainforest_litter"},20, 7, 20, 5000, 2, -10, 200)
mobs:spawn_specific("mobs_mc:parrot", {"default:jungleleaves", "default:dirt_with_rainforest_litter"},{"air"},20, 7, 20, 5000, 2, -10, 200)
mobs:spawn_specific("mobs_mc:parrot", {"default:jungleleaves"},{"air"},20, 7, 20, 5000, 2, -10, 200)
mobs:register_spawn("mobs_mc:parrot", {"default:dirt_with_rainforest_litter"}, 20, 12, 5000, 2, 31000)



-- spawn eggs
--mobs:register_egg("mobs_mc:ghast", "Ghast", "ghast_front.png")
mobs:register_egg("mobs_mc:parrot", "Parrot", "parrot_inv.png", 0)

if minetest.setting_get("log_mods") then
	minetest.log("action", "MC Parrot loaded")
end