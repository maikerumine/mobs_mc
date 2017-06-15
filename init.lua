--MCmobs v0.4
--maikerumine
--made for MC like Survival game
--License for code WTFPL and otherwise stated in readmes

local path = minetest.get_modpath("mobs_mc")

--Crafts
--dofile(path .. "/1_crafts.lua") -- Mesh and animation by toby109tt  / https://github.com/22i
--dofile(path .. "/2_extra.lua") -- Mesh and animation by toby109tt  / https://github.com/22i

-- Animals
dofile(path .. "/bat.lua") -- Mesh and animation by toby109tt  / https://github.com/22i
dofile(path .. "/bunny.lua") -- Mesh and animation byExeterDad
dofile(path .. "/chicken.lua") -- Mesh and animation by Pavel_S
dofile(path .. "/cow.lua") -- Mesh by Morn76 Animation by Pavel_S
dofile(path .. "/cow_mooshroom.lua") -- Mesh by Morn76 Animation by Pavel_S
dofile(path .. "/horse.lua") -- KrupnoPavel
dofile(path .. "/horse_mule.lua") --  Mesh and animation by toby109tt  / https://github.com/22i
dofile(path .. "/horse_skeleton.lua") --  Mesh and animation by toby109tt  / https://github.com/22i
dofile(path .. "/horse_zombie.lua") --  Mesh and animation by toby109tt  / https://github.com/22i
dofile(path .. "/llama.lua") --  Mesh and animation by toby109tt  / https://github.com/22i
dofile(path .. "/ocelot.lua") --  Mesh and animation by toby109tt  / https://github.com/22i
dofile(path .. "/parrot.lua") --  Mesh and animation by toby109tt  / https://github.com/22i
dofile(path .. "/pig.lua") -- Mesh and animation by Pavel_S
dofile(path .. "/polar_bear.lua") --  Mesh and animation by toby109tt  / https://github.com/22i
dofile(path .. "/sheep.lua") -- Mesh and animation by Pavel_S
dofile(path .. "/wolf.lua") -- KrupnoPavel
dofile(path .. "/squid.lua") -- Animation, sound and egg texture by daufinsyd

-- NPC
dofile(path .. "/villager.lua") -- KrupnoPavel Mesh and animation by toby109tt  / https://github.com/22i
--dofile(path .. "/villager_agent.lua") -- Mesh and animation by toby109tt  / https://github.com/22i
dofile(path .. "/villager_evoker.lua") -- Mesh and animation by toby109tt  / https://github.com/22i
dofile(path .. "/villager_vindicator.lua") -- Mesh and animation by toby109tt  / https://github.com/22i
dofile(path .. "/villager_zombie.lua") -- Mesh and animation by toby109tt  / https://github.com/22i
dofile(path .. "/witch.lua") -- Mesh and animation by toby109tt  / https://github.com/22i

--Monsters
dofile(path .. "/blaze.lua") -- Animation by daufinsyd
dofile(path .. "/creeper.lua") -- Mesh by Morn76 Animation by Pavel_S
dofile(path .. "/ender_dragon.lua") -- Mesh and animation by toby109tt  / https://github.com/22i
dofile(path .. "/enderman.lua") -- Mesh and animation by toby109tt  / https://github.com/22i
dofile(path .. "/endermite.lua") -- Mesh and animation by toby109tt  / https://github.com/22i
dofile(path .. "/villager_illusioner.lua") -- Mesh and animation by toby109tt  / https://github.com/22i
dofile(path .. "/ghast.lua") -- maikerumine
dofile(path .. "/guardian.lua") -- maikerumine Mesh and animation by toby109tt  / https://github.com/22i
dofile(path .. "/guardian_elder.lua") -- maikerumine Mesh and animation by toby109tt  / https://github.com/22i
dofile(path .. "/iron_golem.lua") -- maikerumine Mesh and animation by toby109tt  / https://github.com/22i
dofile(path .. "/shulker.lua") -- maikerumine Mesh and animation by toby109tt  / https://github.com/22i
dofile(path .. "/silver_fish.lua") -- maikerumine Mesh and animation by toby109tt  / https://github.com/22i
dofile(path .. "/skeleton.lua") -- Mesh by Morn76 Animation by Pavel_S
dofile(path .. "/skeleton_stray.lua") -- Mesh by Morn76 Animation by Pavel_S
dofile(path .. "/skeleton_wither.lua") -- Mesh by Morn76 Animation by Pavel_S
dofile(path .. "/zombie.lua") -- Mesh by Morn76 Animation by Pavel_S
dofile(path .. "/zombiepig.lua") -- Mesh by Morn76 Animation by Pavel_S
dofile(path .. "/slime+magma_cube.lua") -- Wuzzy
--dofile(path .. "/snowman.lua") -- maikerumine Mesh and animation by toby109tt  / https://github.com/22i
dofile(path .. "/spider.lua") -- Spider by AspireMint (fishyWET (CC-BY-SA 3.0 license for texture)
dofile(path .. "/spider_cave.lua") -- Spider by AspireMint (fishyWET (CC-BY-SA 3.0 license for texture)
dofile(path .. "/vex.lua") -- KrupnoPavel
dofile(path .. "/wither.lua") -- Mesh and animation by toby109tt  / https://github.com/22i

--Heads
dofile(path .. "/heads.lua") -- maikerumine

--IN CASE THROWING IS NOT INSTALLED, THIS FIX
	if not throwing then
		dofile(minetest.get_modpath("mobs_mc").."/2_extra.lua")
		minetest.register_alias("throwing:bow_wood", "mobs:bow_wood")
		minetest.register_alias("throwing:arrow", "mobs:arrow")
		mobs:alias_mob("throwing:arrow_entity", "mobs:arrow_entity")
		else
		minetest.register_alias("_:bow_wood", "throwing:bow_wood")
		minetest.register_alias("_:arrow", "throwing:arrow")
		mobs:alias_mob("_:arrow_entity", "throwing:arrow_entity")
	end

	if not mcl_throwing then
		dofile(minetest.get_modpath("mobs_mc").."/2_extra.lua")
		minetest.register_alias("throwing:bow_wood", "mcl_throwing:bow")
		minetest.register_alias("throwing:arrow", "mcl_throwing:arrow")
		mobs:alias_mob("throwing:arrow_entity", "mcl_throwing:arrow_entity")
	else
		minetest.register_alias("_:bow", "throwing:bow_wood")
		minetest.register_alias("_:arrow", "throwing:arrow")
		mobs:alias_mob("_:arrow_entity", "throwing:arrow_entity")
	end






--NOTES:
--
--[[
COLISIONBOX in minetest press f5 to see where you are looking at then put these wool collor nodes on the ground in direction of north/east/west... to make colisionbox editing easier
#1west-pink/#2down/#3south-blue/#4east-red/#5up/#6north-yelow
{-1, -0.5, -1, 1, 3, 1}, Right, Bottom, Back, Left, Top, Front
--]]
--
--


print ("[MOD] Mobs Redo 'MC' loaded")
