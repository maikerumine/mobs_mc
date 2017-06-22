--MCmobs v0.4
--maikerumine
--made for MC like Survival game
--License for code WTFPL and otherwise stated in readmes


--dofile(minetest.get_modpath("mobs").."/api.lua")
--###################
--################### EVOKER
--###################



mobs:register_mob("mobs_mc:evoker", {
	type = "monster",
	physical = true,
	pathfinding = 1,
	hp_min = 35,
	hp_max = 75,
	collisionbox = {-0.4, -0.01, -0.4, 0.4, 1.95, 0.4},
    rotate = -180,
	visual = "mesh",
	mesh = "evoker.b3d",
    textures = {
        {"evoker.png"},
        --{"evoker1.png"},
    },
	visual_size = {x=3, y=3},
	makes_footstep_sound = true,
	damage = 2,
	walk_velocity = 0.2,
	run_velocity = 1.4,
	damage = 1,
	group_attack = true,
	attack_type = "dogfight",
	-- Summon vexes
	custom_attack = function(self, to_attack)
		local r = math.random(2,4)
		local basepos = self.object:getpos()
		basepos.y = basepos.y + 1
		for i=1, r do
			local spawnpos = vector.add(basepos, minetest.yaw_to_dir(math.random(0,360)))
			local vex = minetest.add_entity(spawnpos, "mobs_mc:vex")
			vex:get_luaentity()._summoned = true
		end
	end,
	shoot_interval = 5,
	passive = false,
	drops = {
		{name = "default:emerald",
		chance = 1,
		min = 1,
		max = 1,},
		{name = "mobs_mc:totem",
		chance = 1,
		min = 1,
		max = 1,},
	},
	armor = 90,
	sounds = {
		random = "Villagerdead",
		death = "Villagerdead",
		damage = "mese_dragon",
		attack = "zombiedeath",
	},
	animation = {
		speed_normal = 25,
		speed_run = 25,
		stand_start = 40,
		stand_end = 59,
        speed_stand = 5,
		walk_start = 0,
		walk_end = 40,
        --speed_walk = 50,
        shoot_start = 60,
        shoot_end = 80,
        die_start = 80,
        die_end = 130,
	},
	water_damage = 1,
	lava_damage = 5,
	light_damage = 0,
	view_range = 13,
	fear_height = 2,
	replace_rate = 4,
	replace_what = {"default:torch","mg_villages:torch", "default:torch_wall","mg_villages:torch_wall"},
	replace_with = "air",
	replace_offset = -1,

})

--[[
mobs:spawn_specfic(name, nodes, neighbors, min_light, max_light, interval, chance, active_object_count, min_height, max_height, day_toggle, on_spawn)

These functions register a spawn algorithm for the mob. Without this function the call the mobs won't spawn.

    'name' is the name of the animal/monster
    'nodes' is a list of nodenames on that the animal/monster can spawn on top of
    'neighbors' is a list of nodenames on that the animal/monster will spawn beside (default is {"air"} for mobs:register_spawn)
    'max_light' is the maximum of light
    'min_light' is the minimum of light
    'interval' is same as in register_abm() (default is 30 for mobs:register_spawn)
    'chance' is same as in register_abm()
    'active_object_count' mob is only spawned if active_object_count_wider of ABM is <= this
    'min_height' is the minimum height the mob can spawn
    'max_height' is the maximum height the mob can spawn
    'day_toggle' true for day spawning, false for night or nil for anytime
    'on_spawn' is a custom function which runs after mob has spawned and gives self and pos values.]]

--mobs:register_spawn("mobs_mc:evoker", {"mg_villages:road"}, 20, 8, 500, 2, 31000)
--mobs:spawn_specific("mobs_mc:evoker", {"default:acacia_tree"}, {"default:ladder_wood"}, 0, 20, 60, 300, 1, -31000, 150)
--mobs:spawn_specific("mobs_mc:evoker", {"default:aspen_tree"}, {"default:ladder_wood"}, 0, 20, 60, 300, 1, -31000, 150)
--mobs:spawn_specific("mobs_mc:evoker", {"default:tree"}, {"default:ladder_wood"}, 0, 20, 60, 300, 1, -31000, 150)
--mobs:spawn_specific("mobs_mc:evoker", {"default:jungletree"}, {"default:ladder_wood"}, 0, 20, 60, 300, 1, -31000, 150)
--mobs:spawn_specific("mobs_mc:evoker", {"default:pine_tree"}, {"default:ladder_wood"}, 0, 20, 60, 300, 1, -31000, 150)

mobs:spawn_specific("mobs_mc:evoker", {"default:acacia_tree"}, {"default:glass"}, 0, 20, 60, 1300, 1, -31000, 150,false)
mobs:spawn_specific("mobs_mc:evoker", {"default:aspen_tree"}, {"default:glass"}, 0, 20, 60, 1300, 1, -31000, 150,false)
mobs:spawn_specific("mobs_mc:evoker", {"default:tree"}, {"default:glass"}, 0, 20, 60, 1300, 1, -31000, 150,false)
mobs:spawn_specific("mobs_mc:evoker", {"default:jungletree"}, {"default:glass"}, 0, 20, 60, 1300, 1, -31000, 150,false)
mobs:spawn_specific("mobs_mc:evoker", {"default:pine_tree"}, {"default:glass"}, 0, 20, 60, 1300, 1, -31000, 150,false)

--mg_villages:torch
mobs:spawn_specific("mobs_mc:evoker", {"stairs:slab_junglewood"}, {"air"}, 0, 20, 30, 3000, 1, -31000, 150, false)
mobs:spawn_specific("mobs_mc:evoker", {"stairs:slab_acacia_wood"}, {"air"}, 0, 20, 30, 3000, 1, -31000, 150, false)
mobs:spawn_specific("mobs_mc:evoker", {"stairs:slab_pine_wood"}, {"air"}, 0, 20, 30, 3000, 1, -31000, 150, false)
mobs:spawn_specific("mobs_mc:evoker", {"stairs:slab_aspen_wood"}, {"air"}, 0, 20, 30, 3000, 1, -31000, 150, false)




-- spawn eggs
mobs:register_egg("mobs_mc:evoker", "Evoker", "evoker_inv.png", 0)


if minetest.settings:get_bool("log_mods") then
	minetest.log("action", "MC Evoker loaded")
end
