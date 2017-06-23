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
	milk = "mobs_mc:milk_bucket",
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
	stick = "default:stick",
	flint = "default:flint",
	iron_ingot = "default:steel_ingot",
	fire = "fire:basic_flame",
	gunpowder = "tnt:gunpowder",
	flint_and_steel = "fire:flint_and_steel",
	water_source = "default:water_source",
	black_dye = "dye:black",
	poppy = "flowers:rose",
	dandelion = "flowers:dandelion_yellow",
	coal = "default:coal_lump",
	emerald = "default:diamond",
	iron_axe = "default:axe_steel",
	gold_sword = "default:sword_mese",
	gold_nugget = "default:gold_lump",
	glowstone_dust = "default:mese_crystal_fragment",
	redstone = "default:mese_crystal_fragment",
	glass_bottle = "vessels:glass_bottle",
	sugar = "default:papyrus",

	-- Other
	nether_brick_block = "nether:brick",
	mycelium = "ethereal:mushroom_dirt",
	carrot = "farming:carrot",
	golden_carrot = "farming:carrot_gold",
	fishing_rod = "fishing:pole_wood",
	fish_raw = "fishing:fish_raw",
	salmon_raw = "fishing:pike_raw",
	bone = "bonemeal:bone",
	slimeball = "mesecons_materials:glue",

	-- TODO: Add actual ender pearl
	ender_pearl = "farorb:farorb",
}

-- Tables for attracting, feeding and breeding mobs
mobs_mc.follow = {
	sheep = { mobs_mc.items.wheat },
	cow = { mobs_mc.items.wheat },
	chicken = { "farming:seed_wheat", "farming:seed_cotton" },
	horse = { "default:apple", mobs_mc.items.wheat }, -- TODO
	pig = {"default:apple", "farming:potato", mobs_mc.items.carrot, mobs_mc.items.carrot_on_a_stick},
	rabbit = { mobs_mc.items.dandelion, mobs_mc.items.carrot, mobs_mc.items.carrot_gold, "farming_plus:carrot_item", },

	-- TODO
}

-- List of nodes which endermen can take
mobs_mc.enderman_takable = {
	-- Generic handling, useful for entensions
	"group:enderman_takable",

	-- Generic nodes
	"group:sand",
	"group:flower",

	-- Minetest Game
	"default:dirt",
	"default:dirt_with_grass",
	"default:dirt_with_dry_grass",
	"default:dirt_with_snow",
	"default:dirt_with_rainforest_litter",
	"default:dirt_with_grass_footsteps",
	"default:cactus",
	"default:gravel",
	"default:clay",
	"flowers:mushroom_red",
	"flowers:mushroom_brown",
	"tnt:tnt",

	-- Nether mod
	"nether:rack",
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
	if mobs_mc.override.enderman_takable then
		mobs_mc.enderman_takable = mobs_mc.override.enderman_takable
	end
end

