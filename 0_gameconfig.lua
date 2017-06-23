--[[ This table contains the concrete itemstrings to be used by this mod.
All mobs in this mod must use variables in this table, instead
of hardcoding the itemstring.
This way, external mods are enabled to replace the itemstrings to provide
their own items and subgame integration is made much simpler.

An item IDs is supposed to be overwritten by adding
mobs_mc.override.items["example:item"] in a subgame mod
with name "mobs_mc_gameconfig". ]]


-- Standard items
mobs_mc.items = {}

mobs_mc.items = {
	-- mobs_mc
	blaze_rod = "mobs_mc:blaze_rod",
	blaze_powder = "mobs_mc:blaze_powder",
	chicken_raw = "mobs_mc:chicken_raw",
	chicken_cooked = "mobs_mc:chicken_cooked",
	feather = "mobs_mc:feather",
	beef_raw = "mobs_mc:beef_raw",
	beef_cooked = "mobs_mc:beef_cooked",
	bowl = "mobs_mc:bowl",
	mushroom_stew = "mobs_mc:mushroom_stew",
	milk_bucket = "mobs_mc:milk_bucket",
	dragon_egg = "mobs_mc:dragon_egg",
	egg = "mobs_mc:egg",
	ender_eye  = "mobs_mc:ender_eye",
	ghast_tear = "mobs_mc:ghast_tear",
	saddle = "mobs_mc:saddle",
	porkchop_raw = "mobs_mc:porkchop_raw",
	porkchop_cooked = "mobs_mc:porkchop_cooked",
	carrot_on_a_stick = "mobs_mc:carrot_on_a_stick",
	rabbit_raw = "mobs_mc:rabbit_raw",
	rabbit_cooked = "mobs_mc:rabbit_cooked",
	rabbit_hide = "mobs_mc:rabbit_hide",
	mutton_raw = "mobs_mc:mutton_raw",
	mutton_cooked = "mobs_mc:mutton_cooked",
	shulker_shell = "mobs_mc:shulker_shell",
	magma_cream = "mobs_mc:magma_cream",
	spider_eye = "mobs_mc:spider_eye",
	totem = "mobs_mc:totem",
	rotten_flesh = "mobs_mc:rotten_flesh",

	arrow = "mobs_mc:arrow",
	bow = "mobs_mc:bow_wood",

	-- Mobs Redo
	leather = "mobs:leather",
	shears = "mobs:shears",

	-- Minetest Game
	mushroom_red = "flowers:mushroom_red",
	bucket = "bucket:bucket_empty",
	grass_block = "default:dirt_with_grass",
	string = "farming:string",
	stick = "group:stick",
	flint = "default:flint",
	iron_ingot = "default:steel_ingot",
	-- TODO
}

-- Tables for attracting, feeding and breeding mobs
mobs_mc.follow = {
	chicken = { "farming:seed_wheat", "farming:seed_cotton" },
	-- TODO
}



-- Item name overrides from mobs_mc_gameconfig (if present)
if minetest.get_modpath("mobs_mc_gameconfig") and mobs_mc.override then
	if mobs_mc.override.items then
		for k, v in pairs(mobs_mc.override.items) do
			mobs_mc.items[k] = v
		end
	end
	if mobs_mc.override.follow then
		for k, v in pairs(mobs_mc.override.follow) do
			mobs_mc.follow[k] = v
		end
	end
end


