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

-- mobs_mc
mobs_mc.items.blaze_rod = "mobs_mc:blaze_rod"
mobs_mc.items.blaze_powder = "mobs_mc:blaze_powder"
mobs_mc.items.chicken_raw = "mobs_mc:chicken_raw"
mobs_mc.items.chicken_cooked = "mobs_mc:chicken_cooked"
mobs_mc.items.feather = "mobs_mc:feather"
mobs_mc.items.beef_raw = "mobs_mc:beef_raw"
mobs_mc.items.beef_cooked = "mobs_mc:beef_cooked"
mobs_mc.items.bowl = "mobs_mc:bowl"
mobs_mc.items.mushroom_stew = "mobs_mc:mushroom_stew"
mobs_mc.items.milk_bucket = "mobs_mc:milk_bucket"
mobs_mc.items.dragon_egg = "mobs_mc:dragon_egg"
mobs_mc.items.egg = "mobs_mc:egg"
mobs_mc.items.ender_eye  = "mobs_mc:ender_eye"
mobs_mc.items.ghast_tear = "mobs_mc:ghast_tear"
mobs_mc.items.saddle = "mobs_mc:saddle"
mobs_mc.items.porkchop_raw = "mobs_mc:porkchop_raw"
mobs_mc.items.porkchop_cooked = "mobs_mc:porkchop_cooked"
mobs_mc.items.carrot_on_a_stick = "mobs_mc:carrot_on_a_stick"
mobs_mc.items.rabbit_raw = "mobs_mc:rabbit_raw"
mobs_mc.items.rabbit_cooked = "mobs_mc:rabbit_cooked"
mobs_mc.items.rabbit_hide = "mobs_mc:rabbit_hide"
mobs_mc.items.mutton_raw = "mobs_mc:mutton_raw"
mobs_mc.items.mutton_cooked = "mobs_mc:mutton_cooked"
mobs_mc.items.shulker_shell = "mobs_mc:shulker_shell"
mobs_mc.items.magma_cream = "mobs_mc:magma_cream"
mobs_mc.items.spider_eye = "mobs_mc:spider_eye"
mobs_mc.items.totem = "mobs_mc:totem"
mobs_mc.items.rotten_flesh = "mobs_mc:rotten_flesh"

mobs_mc.items.arrow = "mobs_mc:arrow"
mobs_mc.items.bow = "mobs_mc:bow_wood"

-- Mobs Redo
mobs_mc.items.leather = "mobs:leather"
mobs_mc.items.shears = "mobs:shears"

-- Minetest Game
mobs_mc.items.mushroom_red = "flowers:mushroom_red"
mobs_mc.items.bucket = "bucket:bucket_empty"
mobs_mc.items.grass_block = "default:dirt_with_grass"
mobs_mc.items.string = "farming:string"
mobs_mc.items.stick = "group:stick"
mobs_mc.items.flint = "default:flint"
mobs_mc.items.iron_ingot = "default:steel_ingot"
-- TODO

-- Tables for attracting, feeding and breeding mobs
mobs_mc.follow = {}
mobs_mc.follow.chicken = { "farming:seed_wheat", "farming:seed_cotton" }
-- TODO



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


