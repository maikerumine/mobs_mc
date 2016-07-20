--MC Heads for minetest
--maikerumine

minetest.register_node( "mobs_mc:creeper_head", {
	description = "Creeper Head-W.I.P.",
	tiles = {
		"bones_top.png",
		"bones_bottom.png",
		"bones_side.png",
		"bones_side.png",
		"bones_rear.png",
		"mobs_creeper.png"
	},
	paramtype2 = "facedir",
			node_box = {
				type = "fixed",
				fixed = {-0.25, -0.49, -0.25, 0.25, 0.01, 0.25},
			},
			
	drawtype = "nodebox",
	paramtype = "light",
	--visual_scale = 0.5,
	is_ground_content = false,
	groups = {cracky=2},
	sounds = default.node_sound_stone_defaults(),
	stack_max = 1,
})

minetest.register_node( "mobs_mc:enderman_head", {
	description = "Enderman Head-W.I.P.",
	tiles = {
		"bones_top.png",
		"bones_bottom.png",
		"bones_side.png",
		"bones_side.png",
		"bones_rear.png",
		"mobs_endermen.png"
	},
	paramtype2 = "facedir",
	visual_scale = 0.5,
	is_ground_content = true,
	groups = {cracky=2},
	sounds = default.node_sound_stone_defaults(),
	stack_max = 1,
})

minetest.register_node( "mobs_mc:ghast_head", {
	description = "Ghast Head-W.I.P.",
	tiles = {
		"bones_top.png",
		"bones_bottom.png",
		"bones_side.png",
		"bones_side.png",
		"bones_rear.png",
		"ghast_front.png"
	},
	paramtype2 = "facedir",
	visual_scale = 0.5,
	is_ground_content = true,
	groups = {cracky=2},
	sounds = default.node_sound_stone_defaults(),
	stack_max = 1,
})

minetest.register_node( "mobs_mc:skeleton_head", {
	description = "Skeleton Head-W.I.P.",
	tiles = {
		"bones_top.png",
		"bones_bottom.png",
		"bones_side.png",
		"bones_side.png",
		"bones_rear.png",
		"mobs_skeleton.png"
	},
	paramtype2 = "facedir",
	visual_scale = 0.5,
	is_ground_content = false,
	groups = {cracky=2},
	sounds = default.node_sound_stone_defaults(),
	stack_max = 1,
})

minetest.register_node( "mobs_mc:skeleton2_head", {
	description = "Skeleton2 Head-W.I.P.",
	tiles = {
		"bones_top.png",
		"bones_bottom.png",
		"bones_side.png",
		"bones_side.png",
		"bones_rear.png",
		"mobs_skeleton2.png"
	},
	paramtype2 = "facedir",
	visual_scale = 0.5,
	is_ground_content = true,
	groups = {cracky=2},
	sounds = default.node_sound_stone_defaults(),
	stack_max = 1,
})

minetest.register_node( "mobs_mc:spider_head", {
	description = "Spider Head-W.I.P.",
	tiles = {
		"bones_top.png",
		"bones_bottom.png",
		"bones_side.png",
		"bones_side.png",
		"bones_rear.png",
		"mobs_spider.png"
	},
	paramtype2 = "facedir",
	visual_scale = 0.5,
	is_ground_content = true,
	groups = {cracky=2},
	sounds = default.node_sound_stone_defaults(),
	stack_max = 1,
})

minetest.register_node( "mobs_mc:zombie_head", {
	description = "Zombie Head-W.I.P.",
	tiles = {
		"bones_top.png",
		"bones_bottom.png",
		"bones_side.png",
		"bones_side.png",
		"bones_rear.png",
		"mobs_zombie.png"
	},
	paramtype2 = "facedir",
	visual_scale = 0.5,
	is_ground_content = true,
	groups = {cracky=2},
	sounds = default.node_sound_stone_defaults(),
	stack_max = 1,
})

minetest.register_node( "mobs_mc:zombiepig_head", {
	description = "Zombie Pigmen Head-W.I.P.",
	tiles = {
		"bones_top.png",
		"bones_bottom.png",
		"bones_side.png",
		"bones_side.png",
		"bones_rear.png",
		"Original_Zombiepig_Man_by_Fedora_P.png"
	},
	paramtype2 = "facedir",
	visual_scale = 0.5,
	is_ground_content = true,
	groups = {cracky=2},
	sounds = default.node_sound_stone_defaults(),
	stack_max = 1,
})

