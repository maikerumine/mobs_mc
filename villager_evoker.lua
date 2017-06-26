--MCmobs v0.4
--maikerumine
--made for MC like Survival game
--License for code WTFPL and otherwise stated in readmes


--dofile(minetest.get_modpath("mobs").."/api.lua")
--###################
--################### EVOKER
--###################

local pr = PseudoRandom(os.time()*666)

mobs:register_mob("mobs_mc:evoker", {
	type = "monster",
	physical = true,
	pathfinding = 1,
	hp_min = 35,
	hp_max = 75,
	collisionbox = {-0.4, -0.01, -0.4, 0.4, 1.95, 0.4},
    rotate = -180,
	visual = "mesh",
	mesh = "mobs_mc_evoker.b3d",
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
		local r = pr:next(2,4)
		local basepos = self.object:getpos()
		basepos.y = basepos.y + 1
		for i=1, r do
			local spawnpos = vector.add(basepos, minetest.yaw_to_dir(pr:next(0,360)))
			local vex = minetest.add_entity(spawnpos, "mobs_mc:vex")
			local ent = vex:get_luaentity()
			-- Mark vexes as summoned and start their life clock (they take damage it reaches 0)
			ent._summoned = true
			ent._lifetimer = pr:next(33, 108)
		end
	end,
	shoot_interval = 15,
	passive = false,
	drops = {
		{name = mobs_mc.items.emerald,
		chance = 1,
		min = 0,
		max = 1,},
		{name = mobs_mc.items.totem,
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

})

-- spawn eggs
mobs:register_egg("mobs_mc:evoker", "Evoker", "evoker_inv.png", 0)


if minetest.settings:get_bool("log_mods") then
	minetest.log("action", "MC Evoker loaded")
end
