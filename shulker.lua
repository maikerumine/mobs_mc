--MCmobs v0.2
--maikerumine
--made for MC like Survival game
--License for code WTFPL and otherwise stated in readmes


--dofile(minetest.get_modpath("mobs").."/api.lua")

--###################
--################### SHULKER
--###################

-- animation 45-80 is transition between passive and attack stance
   
mobs:register_mob("mobs_mc:shulker", {
	type = "monster",
    attack_type = "shoot",
    shoot_interval = 0.5,
	arrow = "mobs_mc:shulkerbullet",
	shoot_offset = 0.5,
	passive = false,
    stepheight = 1.2,
	hp_min = 30,
	hp_max = 30,
	armor = 150,
    collisionbox = {-0.35, -0.01, -0.35, 0.35, 2, 0.35},
    rotate = -180,
	visual = "mesh",
	mesh = "shulker.b3d",
    textures = {{"shulker.png"},{"shulker1.png"},{"shulker2.png"},{"shulker3.png"},{"shulker4.png"},{"shulker5.png"},{"shulker6.png"},{"shulker7.png"},{"shulker8.png"},{"shulker9.png"},{"shulker10.png"},{"shulker11.png"},{"shulker12.png"},{"shulker13.png"},{"shulker14.png"},{"shulker15.png"},{"shulker16.png"},},
	visual_size = {x=3, y=3},
	walk_velocity = 0.0000000001,
	run_velocity = 0.0000000001,
	jump = false,
	drops = {
	{name = "mobs_mc:shulker_shell",
	chance = 3,
	min = 1,
	max = 1,},
	},
	
	animation = {
		speed_normal = 25,		speed_run = 50,
		stand_start = 0,		stand_end = 45,
		walk_start = 0,		walk_end = 45,
		run_start = 0,		run_end = 45,
        punch_start = 80,  punch_end = 100,
	},
})

-- bullet arrow (weapon)
mobs:register_arrow("mobs_mc:shulkerbullet", {
	visual = "sprite",
	visual_size = {x = 0.25, y = 0.25},
	textures = {"shulkerbullet.png"},
	velocity = 6,

	hit_player = function(self, player)
		player:punch(self.object, 1.0, {
			full_punch_interval = 1.0,
			damage_groups = {fleshy = 4},
		}, nil)
	end,

	hit_mob = function(self, player)
		player:punch(self.object, 1.0, {
			full_punch_interval = 1.0,
			damage_groups = {fleshy = 4},
		}, nil)
	end,

	hit_node = function(self, pos, node)
	end
})

minetest.register_craft({
	output = 'mcl_chests:violet_shulker_box',
	recipe = {
		{'mobs_mc:shulker_shell'},
		{'mcl_chests:chest'},
		{'mobs_mc:shulker_shell'},
	}
})

minetest.register_craftitem("mobs_mc:shulker_shell", {
	description = "Shulker Shell",
	inventory_image = "mcl_mobitems_shulker_shell.png",
	groups = { craftitem = 1 },
})


mobs:register_egg("mobs_mc:shulker", "Shulker", "shulker_inv.png", 0)

mobs:spawn_specific("mobs_mc:shulker", {"default:purpur_block"}, {"default:cobble"},
	0, 20, 5, 3, 1, -31000, -5000)




if minetest.settings:get_bool("log_mods") then
	minetest.log("action", "MC Shulkers loaded")
end
