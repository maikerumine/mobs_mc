--MCmobs v0.4
--maikerumine
--made for MC like Survival game
--License for code WTFPL and otherwise stated in readmes

mobs:register_mob("mobs_mc:illusioner", {
	type = "monster",
	attack_type = "shoot",
    shoot_interval = 0.5,
	arrow = "mobs:arrow_entity",
	shoot_offset = 1.5,
    stepheight = 1.2,
	hp_min = 30,
	hp_max = 60,
	armor = 150,
    collisionbox = {-0.35, -0.01, -0.35, 0.35, 2, 0.35},
    rotate = -180,
	visual = "mesh",
	mesh = "illusioner.b3d",
    textures = {
        --{"illusionist.png"},
        {"illusionist.png^illusionist1.png"},
    },
	visual_size = {x=3, y=3},
	walk_velocity = 0.6,
	run_velocity = 2,
	jump = true,
	animation = {
		speed_normal = 25,
		speed_run = 25,
		stand_start = 40,
		stand_end = 59,
        --speed_stand = 5,
		walk_start = 0,
		walk_end = 40,
        --speed_walk = 50,
        shoot_start = 90,
        shoot_end = 110,
        die_start = 110,
        die_end = 130,
        speed_die = 5,
        -- 60-80 magic arm swinging, 80-90 transition between magic to bow shooting
	},
})

mobs:register_egg("mobs_mc:illusioner", "Illusioner", "illusioner_inv.png", 0)

if minetest.settings:get_bool("log_mods") then
	minetest.log("action", "MC Illusioner loaded")
end
