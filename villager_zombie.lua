--MCmobs v0.4
--maikerumine
--made for MC like Survival game
--License for code WTFPL and otherwise stated in readmes


--dofile(minetest.get_modpath("mobs").."/api.lua")

--###################
--################### ZOMBIE VILLAGER
--###################


mobs:register_mob("mobs_mc:villager_zombie", {
	type = "monster",
	hp_min = 35,
	hp_max = 75,
    collisionbox = {-0.35, -0.01, -0.35, 0.35, 2, 0.35},
    rotate = -180,
	visual = "mesh",
	mesh = "mobs_mc_villager_zombie.b3d",
	textures = {
		{"mobs_mc_zombie_butcher.png"},
		{"mobs_mc_zombie_farmer.png"},
		{"mobs_mc_zombie_librarian.png"},
		{"mobs_mc_zombie_priest.png"},
		{"mobs_mc_zombie_smith.png"},
		{"mobs_mc_zombie_villager.png"}
	},
	visual_size = {x=3, y=3},
	makes_footstep_sound = true,
	damage = 2,
	walk_velocity = 1.2,
	run_velocity = 2.4,
		group_attack = true,
		attack_type = "dogfight",
	group_attack = true,
	drops = {
		{name = mobs_mc.items.rotten_flesh,
		chance = 1,
		min = 0,
		max = 2,},
		{name = mobs_mc.items.iron_ingot,
		-- approximation to 8.5%
		chance = 11,
		min = 1,
		max = 1,},
		{name = mobs_mc.items.carrot,
		-- approximation to 8.5%
		chance = 11,
		min = 1,
		max = 1,},
		{name = mobs_mc.items.potato,
		-- approximation to 8.5%
		chance = 11,
		min = 1,
		max = 1,},
	},
	sounds = {
		random = "Villager1",
		death = "Villagerdead",
		damage = "Villagerhurt1",
	},
	animation = {
		speed_normal = 25,
        speed_run = 50,
		stand_start = 20,
        stand_end = 40,
		walk_start = 0,
        walk_end = 20,
		run_start = 0,
        run_end = 20,
	},
	drawtype = "front",
	water_damage = 1,
	lava_damage = 5,
	light_damage = 1,
	view_range = 16,
	fear_height = 5,

})
--mobs:register_spawn("mobs_mc:villager", {"default:gravel"},  7, -1, 4090, 4, 31000)
mobs:register_spawn("mobs_mc:villager_zombie", {"mg_villages:road"}, 7, -1, 4090, 4, 31000)




-- spawn eggs
mobs:register_egg("mobs_mc:villager_zombie", "Zombie Villager", "mobs_mc_spawn_icon_zombie_villager.png", 0)

if minetest.settings:get_bool("log_mods") then
	minetest.log("action", "MC mobs Zombie Villager loaded")
end
