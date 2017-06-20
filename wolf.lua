--License for code WTFPL and otherwise stated in readmes

-- Wolf
local wolf = {
	type = "npc",
	hp_min = 8,
	hp_max = 8,
	passive = false,
	group_attack = true,
	collisionbox = {-0.3, -0.01, -0.3, 0.3, 0.84, 0.3},
	rotate = -180,
	visual = "mesh",
	mesh = "wolf.b3d",
	textures = {
		{"mobs_mc_wolf.png"},
	},
	visual_size = {x=3, y=3},
	makes_footstep_sound = true,
	sounds = {
		war_cry = "mobs_wolf_attack",
		distance = 16,
	},
	floats = 1,
	view_range = 16,
	walk_velocity = 2,
	run_velocity = 3,
	stepheight = 1.1,
	damage = 4,
	attack_type = "dogfight",
	fear_height = 4,
	drawtype = "front",
	water_damage = 0,
	lava_damage = 4,
	light_damage = 0,
	on_rightclick = function(self, clicker)
		local tool = clicker:get_wielded_item()
		local dog
		local ent
		if tool:get_name() == "mobs:meat_raw" then
			clicker:get_inventory():remove_item("main", "mobs:meat_raw")
			dog = minetest.add_entity(self.object:getpos(), "mobs_mc:dog")
			ent = dog:get_luaentity()
			ent.owner = clicker:get_player_name()
			self.object:remove()
		end
	end,
	animation = {
		speed_normal = 50,		speed_run = 100,
		stand_start = 40,		stand_end = 45,
		walk_start = 0,		walk_end = 40,
		run_start = 0,		run_end = 40,
	},
	jump = true,
	attacks_monsters = true,
	step = 0.5,
}

mobs:register_mob("mobs_mc:wolf", wolf)

-- Tamed wolf

local colors = {
	["black"] = "#000000",
	["blue"] = "#0000BB",
	["brown"] = "#663300",
	["cyan"] = "#01FFD8",
	["dark_green"] = "#005B00",
	["grey"] = "#C0C0C0",
	["dark_grey"] = "#303030",
	["green"] = "#00FF01",
	["grey"] = "#5B5B5B",
	["magenta"] = "#FF05BB",
	["orange"] = "#FF8401",
	["pink"] = "#FF65B5",
	["red"] = "#FF0000",
	["violet"] = "#5000CC",
	["white"] = "#FFFFFF",
	["yellow"] = "#FFFF00",
}
if minetest.get_modpath("mcl_dye") then
	colors["lightblue"] = "#B0B0FF"
end

local get_dog_textures = function(color)
	if colors[color] then
		return {"mobs_mc_wolf_tame.png^(mobs_mc_wolf_collar.png^[colorize:"..colors[color]..":192)"}
	else
		return nil
	end
end

-- Tamed wolf (aka “dog”)
local dog = table.copy(wolf)
dog.step = 1
dog.passive = true
dog.hp_min = 20
dog.hp_max = 20
-- Tamed wolf texture + red collar
dog.textures = get_dog_textures("red")
dog.owner = ""
dog.order = "follow"
dog.step = 1
dog.on_rightclick = function(self, clicker)
	local item = clicker:get_wielded_item()
	if item:get_name() == "mobs:meat_raw" then
		-- Feed
		local hp = self.object:get_hp()
		if hp + 4 > self.hp_max then return end
		if not minetest.settings:get_bool("creative_mode") then
			item:take_item()
			clicker:set_wielded_item(item)
		end
		self.object:set_hp(hp+4)
	elseif minetest.get_item_group(item:get_name(), "dye") == 1 then
		-- Dye collar
		local name = item:get_name()
		local pname = name:split(":")[2]

		local tex = get_dog_textures(pname)
		if tex then
			self.base_texture = tex
			self.object:set_properties({
				textures = self.base_texture
			})
			if not minetest.settings:get_bool("creative_mode") then
				item:take_item()
				clicker:set_wielded_item(item)
			end
		end
	else
		if self.owner == "" then
			self.owner = clicker:get_player_name()
		else
			local formspec = "size[8,4]"
			formspec = formspec .. "textlist[2.85,0;2.1,0.5;dialog;What can I do for you?]"
			formspec = formspec .. "button_exit[1,1;2,2;dfollow;follow]"
			formspec = formspec .. "button_exit[5,1;2,2;dstand;stand]"
			formspec = formspec .. "button_exit[0,2;4,4;dfandp;follow and protect]"
			formspec = formspec .. "button_exit[4,2;4,4;dsandp;stand and protect]"
			formspec = formspec .. "button_exit[1,2;2,2;dgohome; go home]"
			formspec = formspec .. "button_exit[5,2;2,2;dsethome; sethome]"
			minetest.show_formspec(clicker:get_player_name(), "order", formspec)
			minetest.register_on_player_receive_fields(function(clicker, formname, fields)
				if fields.dfollow then
					self.order = "follow"
					self.attacks_monsters = false
				end
				if fields.dstand then
					self.order = "stand"
					self.attacks_monsters = false
				end
				if fields.dfandp then
					self.order = "follow"
					self.attacks_monsters = true
				end
				if fields.dsandp then
					self.order = "stand"
					self.attacks_monsters = true
				end
				if fields.dsethome then
					self.floats = self.object:getpos()
				end
				if fields.dgohome then
					if self.floats then
						self.order = "stand"
						self.object:setpos(self.floats)
					end
				end
			end)
		end
	end
end

mobs:register_mob("mobs_mc:dog", dog)

-- Spawn
mobs:register_spawn("mobs_mc:wolf", {"default:dirt_with_grass","default:dirt_with_snow","default:podzol","default:snow","default:snowblock"}, minetest.LIGHT_MAX, 0, 19000, 20, 31000)

-- Compatibility
mobs:alias_mob("mobs:wolf", "mobs_mc:wolf")
mobs:alias_mob("mobs:dog", "mobs_mc:dog")
mobs:alias_mob("esmobs:wolf", "mobs_mc:wolf")
mobs:alias_mob("esmobs:dog", "mobs_mc:dog")

mobs:register_egg("mobs_mc:wolf", "Wolf", "mobs_mc_spawn_icon_wolf.png", 0)

if minetest.setting_get("log_mods") then
	minetest.log("action", "MC Wolf loaded")
end
