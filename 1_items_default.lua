--MCmobs v0.5
--maikerumine
--made for MC like Survival game
--License for code WTFPL and otherwise stated in readmes


--dofile(minetest.get_modpath("mobs").."/api.lua")
--THIS IS THE MASTER ITEM LIST TO USE WITH DEFAULT

local c = mobs_mc.is_item_variable_overridden

-- Blaze
if c("blaze_rod") then
	minetest.register_craftitem("mobs_mc:blaze_rod", {
		description = "Blaze Rod",
		_doc_items_longdesc = "This is a crafting component dropped from dead blazes.",
		wield_image = "mcl_mobitems_blaze_rod.png",
		inventory_image = "mcl_mobitems_blaze_rod.png",
	})

	-- Make blaze rod furnace-burnable. 1.5 times the burn time of a coal lump
	local coalcraft, burntime
	if minetest.get_modpath("default") then
		coalcraft = minetest.get_craft_result({method="fuel", width=1, items={"default:coal_lump"}})
	end
	if coalcraft then
		burntime = math.floor(coalcraft.time * 1.5)
	end
	if burntime == nil or burntime == 0 then
		burntime = 60
	end

	minetest.register_craft({
		type = "fuel",
		burntime = burntime,
		recipe = "mobs_mc:blaze_rod",
	})
end

if c("blaze_powder") then
	minetest.register_craftitem("mobs_mc:blaze_powder", {
		description = "Blaze Powder",
		_doc_items_longdesc = "This item is mainly used for brewing potions and crafting.",
		wield_image = "mcl_mobitems_blaze_powder.png",
		inventory_image = "mcl_mobitems_blaze_powder.png",
	})
end

if c("blaze_rod") and c("blaze_powder") then
	minetest.register_craft({
		output = "mobs_mc:blaze_powder 2",
		recipe = {{ "mobs_mc:blaze_rod" }},
	})
end

-- Chicken
if c("chicken_raw") then
	minetest.register_craftitem("mobs_mc:chicken_raw", {
		description = "Raw Chicken",
		inventory_image = "mcl_mobitems_chicken_raw.png",
		groups = { food = 2, eatable = 2 },
		on_use = minetest.item_eat(2),
	})
end

if c("chicken_cooked") then
	minetest.register_craftitem("mobs_mc:chicken_cooked", {
		description = "Cooked Chicken",
		inventory_image = "mcl_mobitems_chicken_cooked.png",
		groups = { food = 2, eatable = 6 },
		on_use = minetest.item_eat(6),
	})
end

if c("chicken_raw") and c("chicken_cooked") then
	minetest.register_craft({
		type = "cooking",
		output = "mobs_mc:chicken_cooked",
		recipe = "mobs_mc:chicken_raw",
		cooktime = 5,
	})
end

if c("feather") then
	minetest.register_craftitem("mobs_mc:feather", {
		description = "Feather",
		inventory_image = "mcl_mobitems_feather.png",
	})
end

-- Cow and mooshroom
if c("beef_raw") then
	minetest.register_craftitem("mobs_mc:beef_raw", {
		description = "Raw Beef",
		inventory_image = "mcl_mobitems_beef_raw.png",
		groups = { food = 2, eatable = 3 },
		on_use = minetest.item_eat(3),
	})
end

if c("beef_cooked") then
	minetest.register_craftitem("mobs_mc:beef_cooked", {
		description = "Steak",
		inventory_image = "mcl_mobitems_beef_cooked.png",
		groups = { food = 2, eatable = 8 },
		on_use = minetest.item_eat(8),
	})
end

if c("beef_raw") and c("beef_cooked") then
	minetest.register_craft({
		type = "cooking",
		output = "mobs_mc:beef_cooked",
		recipe = "mobs_mc:beef_raw",
		cooktime = 5,
	})
end


if c("milk_bucket") then
	-- milk
	minetest.register_craftitem("mobs_mc:milk_bucket", {
		description = "Milk",
		inventory_image = "mobs_bucket_milk.png",
		groups = { food = 3, eatable = 1 },
		on_use = minetest.item_eat(1, "bucket:bucket_empty"),
		stack_max = 1,
	})
end

if c("bowl") then
	minetest.register_craftitem("mobs_mc:bowl", {
		description = "Bowl",
		inventory_image = "mcl_core_bowl.png",
	})

	minetest.register_craft({
		output = "mobs_mc:bowl",
		recipe = {
			{ "group:wood", "", "group:wood" },
			{ "", "group:wood", "", },
		}
	})

	minetest.register_craft({
		type = "fuel",
		recipe = "mobs_mc:bowl",
		burntime = 5,
	})
end

if c("mushroom_stew") then
	minetest.register_craftitem("mobs_mc:mushroom_stew", {
		description = "Mushroom Stew",
		inventory_image = "farming_mushroom_stew.png",
		groups = { food = 3, eatable = 6 },
		on_use = minetest.item_eat(6, "mobs_mc:bowl"),
		stack_max = 1,
	})
end

-- Ender dragon
if c("dragon_egg") then

	local dragon_egg_sounds
	if minetest.get_modpath("default") then
		dragon_egg_sounds = default.node_sound_stone_defaults()
	end

	--ender dragon
	minetest.register_node("mobs_mc:dragon_egg", {
		description = "Dragon Egg",
		tiles = {
			"mcl_end_dragon_egg.png",
			"mcl_end_dragon_egg.png",
			"mcl_end_dragon_egg.png",
			"mcl_end_dragon_egg.png",
			"mcl_end_dragon_egg.png",
			"mcl_end_dragon_egg.png",
		},
		drawtype = "nodebox",
		is_ground_content = false,
		paramtype = "light",
		light_source = 1,
		node_box = {
			type = "fixed",
			fixed = {
				{-0.375, -0.5, -0.375, 0.375, -0.4375, 0.375},
				{-0.5, -0.4375, -0.5, 0.5, -0.1875, 0.5},
				{-0.4375, -0.1875, -0.4375, 0.4375, 0, 0.4375},
				{-0.375, 0, -0.375, 0.375, 0.125, 0.375},
				{-0.3125, 0.125, -0.3125, 0.3125, 0.25, 0.3125},
				{-0.25, 0.25, -0.25, 0.25, 0.3125, 0.25},
				{-0.1875, 0.3125, -0.1875, 0.1875, 0.375, 0.1875},
				{-0.125, 0.375, -0.125, 0.125, 0.4375, 0.125},
				{-0.0625, 0.4375, -0.0625, 0.0625, 0.5, 0.0625},
			}
		},
		selection_box = {
			type = "regular",
		},
		groups = {snappy = 1, falling_node = 1, deco_block = 1, not_in_creative_inventory = 1, dig_by_piston = 1 },
		sounds = dragon_egg_sounds,
		-- TODO: Make dragon egg teleport on punching
	})
end

-- Enderman
if c("ender_eye") then
	minetest.register_craftitem("mobs_mc:ender_eye", {
		description = "Ender Eye",

		inventory_image = "mcl_end_ender_eye.png",
		groups = { craftitem = 1 },
	})
end

if c("ender_eye") and c("blaze_powder") and c("blaze_rod") then
	minetest.register_craft({
		type = "shapeless",
		output = 'mobs_mc:ender_eye',
		recipe = { 'mobs_mc:blaze_powder', 'mobs_mc:blaze_rod'},
	})
end

-- Ghast
if c("ghast_tear") then
	minetest.register_craftitem("mobs_mc:ghast_tear", {
		description = "Ghast Tear",
		_doc_items_longdesc = "A ghast tear is an item used in potion brewing. It is dropped from dead ghasts.",
		wield_image = "mcl_mobitems_ghast_tear.png",
		inventory_image = "mcl_mobitems_ghast_tear.png",
		groups = { brewitem = 1 },
	})
end

-- Saddle
if c("saddle") then
	minetest.register_craftitem("mobs_mc:saddle", {
		description = "Saddle",
		inventory_image = "mcl_mobitems_saddle.png",
		stack_max = 1,
	})
end

if c("saddle") and c("lether") and c("string") and c("iron_ingot") then
	minetest.register_craft({
		output = "mobs_mc:saddle",
		recipe = {
			{"mobs:leather", "mobs:leather", "mobs:leather"},
			{"farming:string", "", "farming:string"},
			{"default:steel_ingot", "", "default:steel_ingot"}
		},
	})
end

-- Pig
if c("porkchop_raw") then
	minetest.register_craftitem("mobs_mc:porkchop_raw", {
		description = "Raw Porkchop",
		inventory_image = "mcl_mobitems_porkchop_raw.png",
		groups = { food = 2, eatable = 3 },
		on_use = minetest.item_eat(3),
	})
end

if c("porkchop_cooked") then
	minetest.register_craftitem("mobs_mc:porkchop_cooked", {
		description = "Cooked Porkchop",
		inventory_image = "mcl_mobitems_porkchop_cooked.png",
		groups = { food = 2, eatable = 8 },
		on_use = minetest.item_eat(8),
	})
end

if c("porkchop_raw") and c("porkchop_cooked") then
	minetest.register_craft({
		type = "cooking",
		output = "mobs_mc:porkchop_raw",
		recipe = "mobs_mc:porkchop_cooked",
		cooktime = 5,
	})
end

if c("carrot_on_a_stick") then
	minetest.register_tool("mobs_mc:carrot_on_a_stick", {
		description = "Carrot on a Stick",
		wield_image = "mcl_mobitems_carrot_on_a_stick.png",
		inventory_image = "mcl_mobitems_carrot_on_a_stick.png",
		sounds = { breaks = "default_tool_breaks" },
	})
end

-- Poor-man's recipes for carrot on a stick
if c("carrot_on_a_stick") and c("stick") and c("string") and minetest.get_modpath("farming") then
	minetest.register_craft({
		output = "mobs_mc:carrot_on_a_stick",
		recipe = {
			{"",            "",            "farming:string"    },
			{"",            "group:stick", "farming:string" },
			{"group:stick", "",            "farming:bread" },
		}
	})

-- FIXME: Identify correct farming mod (check if it includes the carrot item)
	minetest.register_craft({
		output = "mobs_mc:carrot_on_a_stick",
		recipe = {
			{"",            "",            "farming:string"    },
			{"",            "group:stick", "farming:string" },
			{"group:stick", "",            "farming:carrot" },
		}
	})
end

if c("carrot_on_a_stick") and c("stick") and c("string") and minetest.get_modpath("fishing") and minetest.get_modpath("farming") then
	minetest.register_craft({
		type = "shapeless",
		output = "mobs_mc:carrot_on_a_stick",
		recipe = {"fishing:pole_wood", "farming:carrot"},
	})
end

-- Rabbit
if c("rabbit_raw") then
	minetest.register_craftitem("mobs_mc:rabbit_raw", {
		description = "Raw Rabbit",
		inventory_image = "mcl_mobitems_rabbit_raw.png",
		groups = { food = 2, eatable = 3 },
		on_use = minetest.item_eat(3),
	})
end

if c("rabbit_cooked") then
	minetest.register_craftitem("mobs_mc:rabbit_cooked", {
		description = "Cooked Rabbit",
		inventory_image = "mcl_mobitems_rabbit_cooked.png",
		groups = { food = 2, eatable = 5 },
		on_use = minetest.item_eat(5),
	})
end

if c("rabbit_raw") and c("rabbit_cooked") then
	minetest.register_craft({
		type = "cooking",
		output = "mobs_mc:rabbit_cooked",
		recipe = "mobs_mc:rabbit_raw",
		cooktime = 5,
	})
end

if c("rabbit_hide") then
	minetest.register_craftitem("mobs_mc:rabbit_hide", {
		description = "Rabbit Hide",
		inventory_image = "mcl_mobitems_rabbit_hide.png"
	})
end

if c("leather") and c("rabbit_hide") then
	minetest.register_craft({
		output = "mobs:leather",
		recipe = {
			{ "mobs_mc:rabbit_hide", "mobs_mc:rabbit_hide" },
			{ "mobs_mc:rabbit_hide", "mobs_mc:rabbit_hide" },
		}
	})
end

-- Sheep
if c("mutton_raw") then
	minetest.register_craftitem("mobs_mc:mutton_raw", {
		description = "Raw Mutton",
		inventory_image = "mcl_mobitems_mutton_raw.png",
		groups = { food = 2, eatable = 4 },
		on_use = minetest.item_eat(4),
	})
end

if c("mutton_cooked") then
	minetest.register_craftitem("mobs_mc:mutton_cooked", {
		description = "Cooked Mutton",
		inventory_image = "mcl_mobitems_mutton_cooked.png",
		groups = { food = 2, eatable = 8 },
		on_use = minetest.item_eat(8),
	})
end

if c("mutton_raw") and c("mutton_cooked") then
	minetest.register_craft({
		type = "cooking",
		output = "mobs_mc:mutton_cooked",
		recipe = "mobs_mc:mutton_raw",
		cooktime = 5,
	})
end

-- Shulker
if c("shulker_shell") then
	minetest.register_craftitem("mobs_mc:shulker_shell", {
		description = "Shulker Shell",
		inventory_image = "mcl_mobitems_shulker_shell.png",
		groups = { craftitem = 1 },
	})
end

-- Magma cube
if c("magma_cream") then
	minetest.register_craftitem("mobs_mc:magma_cream", {
		description = "Magma Cream",
		_doc_items_longdesc = "Magma cream is a crafting component.",
		wield_image = "mcl_mobitems_magma_cream.png",
		inventory_image = "mcl_mobitems_magma_cream.png",
		groups = { brewitem = 1 },
	})
end

-- Spider
if c("spider_eye") then
	minetest.register_craftitem("mobs_mc:spider_eye", {
		description = "Spider Eye",
		_doc_items_longdesc = "Spider eyes are used mainly in crafting and brewing. If you're really desperate, you can eat a spider eye for 2 hunger points, but it will poison you.",
		inventory_image = "mcl_mobitems_spider_eye.png",
		wield_image = "mcl_mobitems_spider_eye.png",
		-- Simplified poisonous food
		groups = { food = 2, eatable = -2 },
		on_use = minetest.item_eat(-2),
	})
end

-- Evoker
if c("totem") then
	minetest.register_craftitem("mobs_mc:totem", {
		description = "Totem",
		wield_image = "mcl_mobitems_totem.png",
		inventory_image = "mcl_mobitems_totem.png",
		groups = {fleshy=3,dig_immediate=3,flammable=2},
		stack_max =1,
		on_use = minetest.item_eat(20),
	})
end

-- Rotten flesh
if c("rotten_flesh") then
	minetest.register_craftitem("mobs_mc:rotten_flesh", {
		description = "Rotten Flesh",
		inventory_image = "mcl_mobitems_rotten_flesh.png",
		-- Simplified poisonous food
		groups = { food = 2, eatable = -4 },
		on_use = minetest.item_eat(-4),
	})
end

