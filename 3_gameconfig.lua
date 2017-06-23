--[[ This table contains the concrete itemstrings to be used by this mod.
All mobs in this mod must use variables in this table, instead
of hardcoding the itemstring.
This way, external mods are enabled to replace the itemstrings to provide
their own items and subgame integration is made much simpler.

For instance, subgames could add a mod which overrides
mobs_mc.items_dirt_with_grass and set the used node to the subgame's equivalent
of dirt with grass. ]]


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


-- Mobs Redo
mobs_mc.items.leather = "mobs:leather"
mobs_mc.items.shears = "mobs:shears"

-- Minetest Game
mobs_mc.items.mushroom_red = "flowers:mushroom_red"
mobs_mc.items.bucket = "bucket:bucket_empty"
mobs_mc.items.dirt_with_grass = "default:dirt_with_grass"


-- Tables for attracting, feeding and breeding mobs
mobs_mc.follow = {}
mobs_mc.follow.chicken = { "farming:seed_wheat", "farming:seed_cotton" }

