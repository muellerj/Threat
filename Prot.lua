--[[
	Prot

	By: Bhaerau.
]]--

--------------------------------------------------
--
-- Variables
--
--------------------------------------------------

function Prot_Configuration_Init()
	if (not Prot_Configuration) then
		Prot_Configuration = { };
	end
	if (not Prot_Runners) then
		Prot_Runners = { };
	end

	if (Prot_Configuration["Enabled"] == nil) then
		Prot_Configuration["Enabled"] = true; --Set to false to disable the addon
	end
	if (Prot_Configuration["Debug"] == nil) then
		Prot_Configuration["Debug"] = false; --Set to true to enable debugging feedback
	end
	if (Prot_Configuration["StanceChangeRage"] == nil) then
		Prot_Configuration["StanceChangeRage"] = 10; --Set this to the amount of rage allowed to be wasted when switching stances
	end
	if (Prot_Configuration["MaximumRage"] == nil) then
		Prot_Configuration["MaximumRage"] = 60; --Set this to the maximum amount of rage allowed when using abilities to increase rage
	end
	if (Prot_Configuration["BloodrageHealth"] == nil) then
		Prot_Configuration["BloodrageHealth"] = 50; --Set this to the minimum percent of health to have when using Bloodrage
	end
	if (Prot_Configuration["NextAttackRage"] == nil) then
		Prot_Configuration["NextAttackRage"] = 40; --Set this to the minimum rage to have to use next attack abilities (Cleave and Heroic Strike)
	end
	if (Prot_Configuration["BerserkHealth"] == nil) then
		Prot_Configuration["BerserkHealth"] = 60; --Set this to the minimum percent of health to have when using Berserk
	end
	if (Prot_Configuration["HamstringHealth"] == nil) then
		Prot_Configuration["HamstringHealth"] = 40; --Set this to the maximum percent of health allowed when using Hamstring on NPCs
	end
	if (Prot_Configuration["AutoAttack"] == nil) then
		Prot_Configuration["AutoAttack"] = true; --Set to false to disable auto-attack
	end
	if (Prot_Configuration["PrimaryStance"] == nil) then
		Prot_Configuration["PrimaryStance"] = false; --Set this to the stance to fall back to after performing an attack requiring another stance
	end

	--[[
	if (WarriorButtonStandard_Configuration["InstantBuildTime"] == nil) then
		WarriorButtonStandard_Configuration["InstantBuildTime"] = 2 --Set the time to spend building rage for upcoming 31 point instant attacks
	end
	if (WarriorButtonStandard_Configuration["RageBuffer"] == nil) then
		WarriorButtonStandard_Configuration["RageBuffer"] = 10 --Set the minimum amount of rage to protect for emergency abilities
	end
	if (WarriorButtonStandard_Configuration["InterruptTimer"] == nil) then
		WarriorButtonStandard_Configuration["InterruptTimer"] = 2 --Set the time to attempt to interrupt spells after they begin casting
	end
	if (WarriorButtonStandard_Configuration["InstantBuildTime"] == nil) then
		WarriorButtonStandard_Configuration["InstantBuildTime"] = 2 --Set the time to spend building rage for upcoming 31 point instant attacks
	end
	if (WarriorButtonStandard_Configuration["AoETime"] == nil) then
		WarriorButtonStandard_Configuration["AoETime"] = 1 --Set the frequency of multiple target checks in seconds
	end
	if (WarriorButtonStandard_Configuration["StanceTime"] == nil) then
		WarriorButtonStandard_Configuration["StanceTime"] = 2 --Set the minimum delay between stance changes
	end
	if (WarriorButtonStandard_Configuration["MaxCycles"] == nil) then
		WarriorButtonStandard_Configuration["MaxCycles"] = 10 --Set the maximum number of function calls per second
	end
	]]--

	if (Prot_Configuration[ABILITY_BATTLE_SHOUT_PROT] == nil) then
		Prot_Configuration[ABILITY_BATTLE_SHOUT_PROT] = true; --Set to false to disable use of ability
	end
	if (Prot_Configuration[RACIAL_BERSERKING_PROT] == nil) then
		Prot_Configuration[RACIAL_BERSERKING_PROT] = true;
	end
	if (Prot_Configuration[ABILITY_BERSERKER_RAGE_PROT] == nil) then
		Prot_Configuration[ABILITY_BERSERKER_RAGE_PROT] = true;
	end
	if (Prot_Configuration[ABILITY_BLOODRAGE_PROT] == nil) then
		Prot_Configuration[ABILITY_BLOODRAGE_PROT] = true;
	end
	if (Prot_Configuration[ABILITY_BLOODTHIRST_PROT] == nil) then
		Prot_Configuration[ABILITY_BLOODTHIRST_PROT] = true;
	end
	if (Prot_Configuration[ABILITY_CHARGE_PROT] == nil) then
		Prot_Configuration[ABILITY_CHARGE_PROT] = true;
	end
	if (Prot_Configuration[ABILITY_CLEAVE_PROT] == nil) then
		Prot_Configuration[ABILITY_CLEAVE_PROT] = false;
	end
	if (Prot_Configuration[ABILITY_DEMORALIZING_SHOUT_PROT] == nil) then
		Prot_Configuration[ABILITY_DEMORALIZING_SHOUT_PROT] = true;
	end
	if (Prot_Configuration[ABILITY_DISARM_PROT] == nil) then
		Prot_Configuration[ABILITY_DISARM_PROT] = true;
	end
	if (Prot_Configuration[ABILITY_EXECUTE_PROT] == nil) then
		Prot_Configuration[ABILITY_EXECUTE_PROT] = true;
	end
	if (Prot_Configuration[ABILITY_HAMSTRING_PROT] == nil) then
		Prot_Configuration[ABILITY_HAMSTRING_PROT] = true;
	end
	if (Prot_Configuration[ABILITY_HEROIC_STRIKE_PROT] == nil) then
		Prot_Configuration[ABILITY_HEROIC_STRIKE_PROT] = true;
	end
	if (Prot_Configuration[ABILITY_INTERCEPT_PROT] == nil) then
		Prot_Configuration[ABILITY_INTERCEPT_PROT] = false;
	end
	if (Prot_Configuration[ABILITY_MORTAL_STRIKE_PROT] == nil) then
		Prot_Configuration[ABILITY_MORTAL_STRIKE_PROT] = true;
	end
	if (Prot_Configuration[ABILITY_OVERPOWER_PROT] == nil) then
		Prot_Configuration[ABILITY_OVERPOWER_PROT] = true;
	end
	if (Prot_Configuration[ABILITY_PUMMEL_PROT] == nil) then
		Prot_Configuration[ABILITY_PUMMEL_PROT] = true;
	end
	if (Prot_Configuration[ABILITY_REND_PROT] == nil) then
		Prot_Configuration[ABILITY_REND_PROT] = true;
	end
	if (Prot_Configuration[ABILITY_SHIELD_BASH_PROT] == nil) then
		Prot_Configuration[ABILITY_SHIELD_BASH_PROT] = true;
	end
	if (Prot_Configuration[ABILITY_SHIELD_SLAM_PROT] == nil) then
		Prot_Configuration[ABILITY_SHIELD_SLAM_PROT] = true;
	end
	if (Prot_Configuration[ABILITY_DEATH_WISH_PROT] == nil) then
		Prot_Configuration[ABILITY_DEATH_WISH_PROT] = true;
	end
	if (Prot_Configuration[ABILITY_SWEEPING_STRIKES_PROT] == nil) then
		Prot_Configuration[ABILITY_SWEEPING_STRIKES_PROT] = true;
	end
	if (Prot_Configuration[ABILITY_THUNDER_CLAP_PROT] == nil) then
		Prot_Configuration[ABILITY_THUNDER_CLAP_PROT] = true;
	end
	if (Prot_Configuration[ABILITY_WHIRLWIND_PROT] == nil) then
		Prot_Configuration[ABILITY_WHIRLWIND_PROT] = true;
	end
end

function Prot_Configuration_Default()
	Prot_Configuration["Enabled"] = true;
	Prot_Configuration["Debug"] = false;
	Prot_Configuration["StanceChangeRage"] = 10;
	Prot_Configuration["MaximumRage"] = 60;
	Prot_Configuration["BloodrageHealth"] = 50;
	Prot_Configuration["NextAttackRage"] = 40;
	Prot_Configuration["BerserkHealth"] = 60;
	Prot_Configuration["HamstringHealth"] = 40;
	Prot_Configuration["AutoAttack"] = true;
	Prot_Configuration["PrimaryStance"] = false;

	Prot_Configuration[ABILITY_BATTLE_SHOUT_PROT] = true;
	Prot_Configuration[RACIAL_BERSERKING_PROT] = true;
	Prot_Configuration[ABILITY_BERSERKER_RAGE_PROT] = true;
	Prot_Configuration[ABILITY_BLOODRAGE_PROT] = true;
	Prot_Configuration[ABILITY_BLOODTHIRST_PROT] = true;
	Prot_Configuration[ABILITY_CHARGE_PROT] = true;
	Prot_Configuration[ABILITY_CLEAVE_PROT] = false;
	Prot_Configuration[ABILITY_DEATH_WISH_PROT] = true;
	Prot_Configuration[ABILITY_DEMORALIZING_SHOUT_PROT] = true;
	Prot_Configuration[ABILITY_DISARM_PROT] = true;
	Prot_Configuration[ABILITY_EXECUTE_PROT] = true;
	Prot_Configuration[ABILITY_HAMSTRING_PROT] = true;
	Prot_Configuration[ABILITY_HEROIC_STRIKE_PROT] = true;
	Prot_Configuration[ABILITY_INTERCEPT_PROT] = false;
	Prot_Configuration[ABILITY_MORTAL_STRIKE_PROT] = true;
	Prot_Configuration[ABILITY_OVERPOWER_PROT] = true;
	Prot_Configuration[ABILITY_PUMMEL_PROT] = true;
	Prot_Configuration[ABILITY_REND_PROT] = true;
	Prot_Configuration[ABILITY_SHIELD_BASH_PROT] = true;
	Prot_Configuration[ABILITY_SHIELD_SLAM_PROT] = true;
	Prot_Configuration[ABILITY_WHIRLWIND_PROT] = true;
end

--------------------------------------------------
--
-- Normal Functions
--
--------------------------------------------------

local function Print(msg) 
	if (not DEFAULT_CHAT_FRAME) then
		return;
	end
	DEFAULT_CHAT_FRAME:AddMessage(msg);
end

local function Debug(msg) 
	if (Prot_Configuration["Debug"]) then
		if (not DEFAULT_CHAT_FRAME) then
			return;
		end
		DEFAULT_CHAT_FRAME:AddMessage(msg);
	end
end

function PrintEffects()
	local id = 1;
	if (UnitBuff("target", id)) then
		Print("Buffs:");
		while (UnitBuff("target", id)) do
			Print(UnitBuff("target", id));
			id = id + 1;
		end
		id = 1;
	end
	if (UnitDebuff("target", id)) then
		Print("Debuffs:");
		while (UnitDebuff("target", id)) do
			Print(UnitDebuff("target", id));
			id = id + 1;
		end
	end
end

--------------------------------------------------

function SpellId(spellname)
	local id = 1;
	for i = 1, GetNumSpellTabs() do
		local _, _, _, numSpells = GetSpellTabInfo(i);
		for j = 1, numSpells do
			local spellName = GetSpellName(id, BOOKTYPE_SPELL);
			if (spellName == spellname) then
				return id;
			end
			id = id + 1;
		end
	end
	return nil;
end

function SpellReady(spellname)
	local id = SpellId(spellname); 
	if (id) then
		local start, duration = GetSpellCooldown(id, 0);
		if (start == 0 and duration == 0 and ProtLastSpellCast + 1 <= GetTime()) then
			return true;
		end
	end
	return nil;
end

function HasDebuff(unit, texturename)
	local id = 1;
	while (UnitDebuff(unit, id)) do
		local debuffTexture = UnitDebuff(unit, id);
		if (string.find(debuffTexture, texturename)) then
			return true;
		end
		id = id + 1;
	end
	return nil;
end

function HasBuff(unit, texturename)
	local id = 1;
	while (UnitBuff(unit, id)) do
		local buffTexture = UnitBuff(unit, id);
		if (string.find(buffTexture, texturename)) then
			return true;
		end
		id = id + 1;
	end
	return nil;
end

--------------------------------------------------

function ActiveStance()
	--Detect the active stance
	for i = 1, 3 do
		local _, _, active = GetShapeshiftFormInfo(i);
		if (active) then
			return i;
		end
	end
	return nil;
end

function Weapon()
	--Detect if a suitable weapon (not a skinning knife/mining pick and not broken) is present
	if (GetInventoryItemLink("player", 16)) then
		local _, _, itemCode = strfind(GetInventoryItemLink("player", 16), "(%d+):");
		local itemName, itemLink, _, _, itemType = GetItemInfo(itemCode);
		if (itemLink ~= "item:7005:0:0:0" and itemLink ~= "item:2901:0:0:0" and not GetInventoryItemBroken("player", 16)) then
			return true;
		end
	end
	return nil;
end

function Shield()
	--Detect if a shield is present
	if (GetInventoryItemLink("player", 17)) then
		local _, _, itemCode = strfind(GetInventoryItemLink("player", 17), "(%d+):")
		local _, _, _, _, _, itemType = GetItemInfo(itemCode)
		if (itemType == ITEM_SHIELDS_PROT and not GetInventoryItemBroken("player", 17)) then
			return true;
		end
	end
	return nil;
end

function HamstringCost()
	--Calculate the cost of Hamstring based on gear
	local i = 0;
	if (GetInventoryItemLink("player", 10)) then
		local _, _, itemCode = strfind(GetInventoryItemLink("player", 10), "(%d+):")
		local itemName = GetItemInfo(itemCode)
		if (itemName == ITEM_GAUNTLETS1_PROT or itemName == ITEM_GAUNTLETS2_PROT or itemName == ITEM_GAUNTLETS3_PROT or itemName == ITEM_GAUNTLETS4_PROT) then
			i = 3;
		end
	end
	return (10 - i);
end

function AntiStealthDebuff()
	--Detect anti-stealth debuffs
	--Rend, Deep Wounds, Serpent Sting, Immolate, Curse of Agony , Garrote, Rupture, Deadly Poison, Fireball, Ignite, Pyroblast, Corruption, Siphon Life, Faerie Fire, Moonfire, Rake, Rip, Pounce, Insect Swarm, Holy Fire, Wyvern Sting, Devouring Plague
	if (HasDebuff("target", "Ability_Gouge") or HasDebuff("target", "Ability_Backstab") or HasDebuff("target", "Ability_Hunter_Quickshot") or HasDebuff("target", "Spell_Fire_Immolation") or HasDebuff("target", "Spell_Shadow_CurseOfSargeras") or HasDebuff("target", "Ability_Rogue_Garrote") or HasDebuff("target", "Ability_Rogue_Rupture") or HasDebuff("target", "Ability_Rogue_DualWeild") or HasDebuff("target", "Spell_Shadow_ShadowWordPain") or HasDebuff("target", "Spell_Fire_FlmaeBolt") or HasDebuff("target", "Spell_Fire_Incinerate") or HasDebuff("target", "Spell_Fire_Fireball02") or HasDebuff("target", "Spell_Shadow_AbominationExplosion") or HasDebuff("target", "Spell_Shadow_Requiem") or HasDebuff("target", "Spell_Nature_FaerieFire") or HasDebuff("target", "Spell_Nature_StarFall") or HasDebuff("target", "Ability_Druid_Disembowel") or HasDebuff("target", "Ability_GhoulFrenzy") or HasDebuff("target", "Ability_Druid_SurpriseAttack") or HasDebuff("target", "Spell_Nature_InsectSwarm") or HasDebuff("target", "Spell_Holy_SearingLight") or HasDebuff("target", "INV_Spear_02") or HasDebuff("target", "Spell_Shadow_BlackPlague")) then
		return true;
	end
	return nil;
end

function SnareDebuff()
	--Detect snaring debuffs
	--Hamstring, Wing Clip, Curse of Exhaustion, Crippling Poison, Frostbolt, Cone of Cold, Frost Shock
	if (HasDebuff("target", "Ability_ShockWave") or HasDebuff("target", "Ability_Rogue_Trip") or HasDebuff("target", "Spell_Shadow_GrimWard") or HasDebuff("target", "Ability_PoisonSting") or HasDebuff("target", "Spell_Frost_FrostBolt02") or HasDebuff("target", "Spell_Frost_Glacier") or HasDebuff("target", "Spell_Frost_FrostShock")) then
		return true;
	end
	return nil;
end

function Prot_RunnerDetect(arg1, arg2)
	--Thanks to HateMe
	if (arg1 == CHAT_RUNNER_PROT) then
		Prot_Runners[arg2] = true;
	end
end

function HasFiveSunderArmors(unit)
	local id = 1;
	while (UnitDebuff(unit, id)) do
		local debuffTexture, debuffAmount = UnitDebuff(unit, id);
		if (string.find(debuffTexture, "Sunder")) then
      if (debuffAmount == 5) then
        return true;
      else
        return false;
      end
		end
		id = id + 1;
	end
	return false;
end

function RevengeReady(nr)
	local tim = GetTime();
	if nr == 1 then	
		RVrt = tim + 4;
	elseif nr == 2 then	
		if tim < RVrt then
			RVrd = true
		end
		return RVrd;
	end
end

function Prot()
	if (Prot_Configuration["Enabled"] and not UnitIsCivilian("target") and UnitClass("player") == CLASS_WARRIOR_PROT and ProtTalents) then

    local rage = UnitMana("player");

		if (Prot_Configuration["AutoAttack"] and not ProtAttack) then
      Debug("Starting AutoAttack");
			AttackTarget();
		end

    if (ActiveStance() ~= 2) then
      Debug("Changing to def stance");
      CastSpellByName(ABILITY_DEFENSIVE_STANCE_PROT);
    end

    if (SpellReady(ABILITY_SHIELD_SLAM_PROT) and rage >= 20) then
      Debug("Shield slam");
      --CastSpellByName(ABILITY_SHIELD_SLAM_PROT);
      CastSpellByName(ABILITY_HEROIC_STRIKE_PROT);
    elseif (SpellReady(ABILITY_REVENGE_PROT)) then
      Debug("Revenge");
      CastSpellByName(ABILITY_REVENGE_PROT);
    elseif (SpellReady(ABILITY_SUNDER_ARMOR_PROT) and rage >= 15 and not (HasFiveSunderArmors("target"))) then
      Debug("Sunder armor");
      CastSpellByName(ABILITY_SUNDER_ARMOR_PROT);
    elseif (SpellReady(ABILITY_HEROIC_STRIKE_PROT) and rage >= 25) then
      Debug("Heroic strike");
      CastSpellByName(ABILITY_HEROIC_STRIKE_PROT);
    else
      Debug("Not casting anything");
    end

	end
end	

--------------------------------------------------
--
-- Chat Handlers
--
--------------------------------------------------

function Prot_SlashCommand(msg)
	local _, _, command, options = string.find(msg, "([%w%p]+)%s*(.*)$");
	if (command) then
		command = string.lower(command);
	end
	if (command == nil or command == "") then
		Prot();
	elseif (command == "toggle") then
		if (Prot_Configuration["Enabled"]) then
			Prot_Configuration["Enabled"] = false;
			Print(BINDING_HEADER_PROT .. ": " .. BINDING_HEADER_PROT .. " " .. SLASH_PROT_DISABLED .. ".")
		else
			Prot_Configuration["Enabled"] = true;
			Print(BINDING_HEADER_PROT .. ": " .. BINDING_HEADER_PROT .. " " .. SLASH_PROT_ENABLED .. ".")
		end
	elseif (command == "debug") then
		if (Prot_Configuration["Debug"]) then
			Prot_Configuration["Debug"] = false;
			Print(BINDING_HEADER_PROT .. ": " .. SLASH_PROT_DEBUG .. " " .. SLASH_PROT_DISABLED .. ".")
		else
			Prot_Configuration["Debug"] = true;
			Print(BINDING_HEADER_PROT .. ": " .. SLASH_PROT_DEBUG .. " " .. SLASH_PROT_ENABLED .. ".")
		end
	elseif (command == "dance") then
		if (options == "" or tonumber(options) < 0) then
			options = 0;
		elseif (tonumber(options) > 100) then
			options = 100;
		end
		Prot_Configuration["StanceChangeRage"] = options;
		Print(BINDING_HEADER_PROT .. ": " .. SLASH_PROT_DANCE .. options .. ".")
	elseif (command == "attack") then
		if (Prot_Configuration["AutoAttack"]) then
			Prot_Configuration["AutoAttack"] = false;
			Print(BINDING_HEADER_PROT .. ": " .. SLASH_PROT_AUTOATTACK .. " " .. SLASH_PROT_DISABLED .. ".")
		else
			Prot_Configuration["AutoAttack"] = true;
			Print(BINDING_HEADER_PROT .. ": " .. SLASH_PROT_AUTOATTACK .. " " .. SLASH_PROT_ENABLED .. ".")
		end
	elseif (command == "rage") then
		if (options == "" or tonumber(options) < 0) then
			options = 0;
		elseif (tonumber(options) > 100) then
			options = 100;
		end
		Prot_Configuration["MaximumRage"] = options;
		Print(BINDING_HEADER_PROT .. ": " .. SLASH_PROT_RAGE .. options .. ".")

	elseif (command == "attackrage") then
		if (options == "" or tonumber(options) < 0) then
			options = 0;
		elseif (tonumber(options) > 100) then
			options = 100;
		end
		Prot_Configuration["NextAttackRage"] = options;
		Print(BINDING_HEADER_PROT .. ": " .. SLASH_PROT_ATTACKRAGE .. options .. ".")

	elseif (command == "bloodrage") then
		if (options == "" or tonumber(options) < 1) then
			options = 1;
		elseif (tonumber(options) > 100) then
			options = 100;
		end
		Prot_Configuration["BloodrageHealth"] = options;
		Print(BINDING_HEADER_PROT .. ": " .. SLASH_PROT_BLOODRAGE .. options .. ".")
	elseif (command == "hamstring") then
		if (options == "" or tonumber(options) < 1) then
			options = 1;
		elseif (tonumber(options) > 100) then
			options = 100;
		end
		Prot_Configuration["HamstringHealth"] = options;
		Print(BINDING_HEADER_PROT .. ": " .. SLASH_PROT_HAMSTRING .. options .. ".")
	elseif (command == "threat") then
		--If HS then use cleave, if cleave then use HS
		if (Prot_Configuration[ABILITY_HEROIC_STRIKE_PROT]) then
			Prot_Configuration[ABILITY_HEROIC_STRIKE_PROT] = false;
			Prot_Configuration[ABILITY_CLEAVE_PROT] = true;
			Print(BINDING_HEADER_PROT .. ": " .. SLASH_PROT_LOWTHREAT)
		else
			Prot_Configuration[ABILITY_CLEAVE_PROT] = false;
			Prot_Configuration[ABILITY_HEROIC_STRIKE_PROT] = true;
			Print(BINDING_HEADER_PROT .. ": " .. SLASH_PROT_HIGHTHREAT)
		end
	elseif (command == "berserk") then
		if (options == "" or tonumber(options) < 1) then
			options = 1;
		elseif (tonumber(options) > 100) then
			options = 100;
		end
		Prot_Configuration["BerserkHealth"] = options;
		Print(BINDING_HEADER_PROT .. ": " .. SLASH_PROT_TROLL .. options .. ".")
	elseif (command == "stance") then
		if (options == ABILITY_BATTLE_STANCE_PROT) then
			Prot_Configuration["PrimaryStance"] = 1;
			Print(BINDING_HEADER_PROT .. ": " .. SLASH_PROT_STANCE .. ABILITY_BATTLE_STANCE_PROT .. ".")
		elseif (options == ABILITY_DEFENSIVE_STANCE_PROT) then
			Prot_Configuration["PrimaryStance"] = 2;
			Print(BINDING_HEADER_PROT .. ": " .. SLASH_PROT_STANCE .. ABILITY_DEFENSIVE_STANCE_PROT .. ".")
		elseif (options == ABILITY_BERSERKER_STANCE_PROT) then
			Prot_Configuration["PrimaryStance"] = 3;
			Print(BINDING_HEADER_PROT .. ": " .. SLASH_PROT_STANCE .. ABILITY_BERSERKER_STANCE_PROT .. ".")
		elseif (options == "default") then
			Prot_Configuration["PrimaryStance"] = false;
			Print(BINDING_HEADER_PROT .. ": " .. SLASH_PROT_STANCE .. SLASH_PROT_DEFAULT .. ".")
		else
			Prot_Configuration["PrimaryStance"] = 0;
			Print(BINDING_HEADER_PROT .. ": " .. SLASH_PROT_NOSTANCE .. SLASH_PROT_DISABLED .. ".")
		end
	elseif (command == "ability") then
		if (options == ABILITY_HEROIC_STRIKE_PROT and not Prot_Configuration[ABILITY_HEROIC_STRIKE_PROT]) then
			Prot_Configuration[ABILITY_HEROIC_STRIKE_PROT] = true;
			Print(BINDING_HEADER_PROT .. ": " .. ABILITY_HEROIC_STRIKE_PROT .. " enabled.")
			if (Prot_Configuration[ABILITY_CLEAVE_PROT]) then
				Prot_Configuration[ABILITY_CLEAVE_PROT] = false;
				Print(BINDING_HEADER_PROT .. ": " .. ABILITY_CLEAVE_PROT .. " disabled.")
			end
		elseif (options == ABILITY_CLEAVE_PROT and not Prot_Configuration[ABILITY_CLEAVE_PROT]) then
			Prot_Configuration[ABILITY_CLEAVE_PROT] = true;
			Print(BINDING_HEADER_PROT .. ": " .. ABILITY_CLEAVE_PROT .. " enabled.")
			if (Prot_Configuration[ABILITY_HEROIC_STRIKE_PROT]) then
				Prot_Configuration[ABILITY_HEROIC_STRIKE_PROT] = false;
				Print(BINDING_HEADER_PROT .. ": " .. ABILITY_HEROIC_STRIKE_PROT .. " disabled.")
			end
		elseif (Prot_Configuration[options]) then
			Prot_Configuration[options] = false
			Print(BINDING_HEADER_PROT .. ": " .. options .. " disabled.")
		elseif (Prot_Configuration[options] == false) then
			Prot_Configuration[options] = true
			Print(BINDING_HEADER_PROT .. ": " .. options .. " enabled.")
		else
			Print(BINDING_HEADER_PROT .. ": " .. options .. " not found.")
		end
	else
		Print(SLASH_PROT_HELP)
	end
end

--------------------------------------------------
--
-- Event Handlers
--
--------------------------------------------------

function Prot_OnLoad()
	this:RegisterEvent("PLAYER_REGEN_ENABLED");
	this:RegisterEvent("PLAYER_REGEN_DISABLED");
	this:RegisterEvent("PLAYER_ENTER_COMBAT");
	this:RegisterEvent("PLAYER_LEAVE_COMBAT");
  this:RegisterEvent("CHAT_MSG_SPELL_SELF_DAMAGE");
  this:RegisterEvent("CHAT_MSG_COMBAT_CREATURE_VS_SELF_MISSES");

	ProtLastSpellCast = GetTime();
	ProtLastStanceCast = GetTime();
	SlashCmdList["PROT"] = Prot_SlashCommand;
	SLASH_PROT1 = "/prot";
end

function Prot_OnEvent(event)
	if (event == "VARIABLES_LOADED") then
		--Check for settings
		Prot_Configuration_Init()
	elseif (event == "CHAT_MSG_COMBAT_SELF_MISSES" and string.find(arg1, CHAT_OVERPOWER1_PROT) or event == "CHAT_MSG_SPELL_SELF_DAMAGE" and string.find(arg1, CHAT_OVERPOWER2_PROT)) then
		--Check to see if enemy dodges
		ProtOverpower = GetTime();
	elseif (event == "CHAT_MSG_SPELL_SELF_DAMAGE" and (string.find(arg1, CHAT_OVERPOWER3_PROT) or string.find(arg1, CHAT_OVERPOWER4_PROT) or string.find(arg1, CHAT_OVERPOWER5_PROT))) then
		--Check to see if Overpower is used
		ProtOverpower = nil;
	elseif (event == "CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE" or event == "CHAT_MSG_SPELL_HOSTILEPLAYER_BUFF" or event == "CHAT_MSG_SPELL_CREATURE_VS_CREATURE_BUFF" or event == "CHAT_MSG_SPELL_HOSTILEPLAYER_DAMAGE") then
		--Check to see if enemy casts spell
		for mob, spell in string.gfind(arg1, CHAT_CAST_PROT) do
			if (mob == UnitName("target") and UnitCanAttack("player", "target") and mob ~= spell) then
				ProtSpellInterrupt = GetTime();
			end
			return;
		end
	elseif (event == "CHAT_MSG_SPELL_SELF_DAMAGE" and string.find(arg1, CHAT_INTERRUPT1_PROT) or event == "CHAT_MSG_COMBAT_SELF_MISSES" and string.find(arg1, CHAT_INTERRUPT2_PROT) or event == "CHAT_MSG_COMBAT_SELF_MISSES" and string.find(arg1, CHAT_INTERRUPT3_PROT) or event == "CHAT_MSG_COMBAT_SELF_MISSES" and string.find(arg1, CHAT_INTERRUPT4_PROT) or event == "CHAT_MSG_COMBAT_SELF_MISSES" and string.find(arg1, CHAT_INTERRUPT5_PROT)) then
		--Check to see if Pummel/Shield Bash is used
		ProtSpellInterrupt = nil;
	elseif (event == "CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE") then
		--Check to see if getting affected by breakable effects
		if (arg1 == CHAT_SAP_PROT or arg1 == CHAT_GOUGE_PROT or arg1 == CHAT_REPENTANCE_PROT or arg1 == CHAT_ROCKET_HELM_PROT) then
			ProtIncapacitate = true;
		elseif (arg1 == CHAT_FEAR_PROT or arg1 == CHAT_INTIMIDATING_SHOUT_PROT or arg1 == CHAT_PSYCHIC_SCREAM_PROT or arg1 == CHAT_PANIC_PROT or arg1 == CHAT_BELLOWING_ROAR_PROT or arg1 == CHAT_ANCIENT_DESPAIR_PROT or arg1 == CHAT_TERRIFYING_SCREECH_PROT or arg1 == CHAT_HOWL_OF_TERROR_PROT) then
			ProtFear = true;
		end
	elseif (event == "CHAT_MSG_SPELL_AURA_GONE_SELF") then
		--Check to see if breakable effects fades
		if (arg1 == CHAT_SAP2_PROT or arg1 == CHAT_GOUGE2_PROT or arg1 == CHAT_REPENTANCE2_PROT or arg1 == CHAT_ROCKET_HELM2_PROT) then
			ProtIncapacitate = nil;
		elseif (arg1 == CHAT_FEAR2_PROT or arg1 == CHAT_INTIMIDATING_SHOUT2_PROT or arg1 == CHAT_PSYCHIC_SCREAM2_PROT or arg1 == CHAT_PANIC2_PROT or arg1 == CHAT_BELLOWING_ROAR2_PROT or arg1 == CHAT_ANCIENT_DESPAIR2_PROT or arg1 == CHAT_TERRIFYING_SCREECH2_PROT or arg1 == CHAT_HOWL_OF_TERROR2_PROT) then
			ProtFear = nil;
		end
	elseif (event == "CHAT_MSG_MONSTER_EMOTE") then
		--Check to see if enemy flees
		Prot_RunnerDetect(arg1, arg2);
	elseif (event == "PLAYER_AURAS_CHANGED") then
		--Check to see if mounted
		if (UnitIsMounted("player")) then
			ProtMount = true;
		else
			ProtMount = false;
		end
	elseif (event == "PLAYER_TARGET_CHANGED" or (event == "CHARACTER_POINTS_CHANGED" and arg1 == -1)) then
		--Reset Overpower and interrupts, check to see if talents are being calculated
		if (event == "PLAYER_TARGET_CHANGED") then
			ProtOverpower = nil;
			ProtSpellInterrupt = nil;
		end
		if (not ProtTalents) then
			--Calculate the cost of Heroic Strike based on talents
			local _, _, _, _, currRank = GetTalentInfo(1, 1);
			ProtHeroicStrikeCost = (15 - tonumber(currRank))
			--Calculate the cost of Execute based on talents
			local _, _, _, _, currRank = GetTalentInfo(2, 10);
			ProtExecuteCost = (15 - strsub(tonumber(currRank) * 2.5, 1, 2))
			--Calculate the rage retainment of Tactical Mastery
			local _, _, _, _, currRank = GetTalentInfo(1, 5);
			ProtTacticalMastery = (tonumber(currRank) * 5)
			--Check for Improved Berserker Rage
			local _, _, _, _, currRank = GetTalentInfo(2, 15);
			if (currRank > 0) then
				ProtBerserkerRage =  true;
			else
				ProtBerserkerRage = false;
			end
			--Check for Mortal Strike
			local _, _, _, _, currRank = GetTalentInfo(1, 18);
			if (currRank > 0) then
				ProtMortalStrike =  true;
			else
				ProtMortalStrike = false;
			end
			--Check for Bloodthirst
			local _, _, _, _, currRank = GetTalentInfo(2, 17);
			if (currRank > 0) then
				ProtBloodthirst =  true;
			else
				ProtBloodthirst = false;
			end
			--Check for Shield Slam
			local _, _, _, _, currRank = GetTalentInfo(3, 17);
			if (currRank > 0) then
				ProtShieldSlam =  true;
			else
				ProtShieldSlam = false;
			end
			ProtTalents = true;
		end
	elseif (event == "PLAYER_REGEN_DISABLED") then
		ProtCombat = true;
	elseif (event == "PLAYER_REGEN_ENABLED") then
		ProtCombat = nil;
		ProtDanceDone = nil;
		ProtOldStance = nil;
	elseif (event == "PLAYER_ENTER_COMBAT") then
		ProtAttack = true;
	elseif (event == "PLAYER_LEAVE_COMBAT") then
		ProtAttack = nil;
	elseif (event == "CHAT_MSG_COMBAT_CREATURE_VS_SELF_MISSES")then
		if string.find(arg1,"You block") or string.find(arg1,"You parry") or string.find(arg1,"You dodge") then
			RevengeReady(1);
		end
	end
end

function Prot_CheckButtons()
	if not Zorlen_Button_SweepingStrikes then
		if Zorlen_IsSpellKnown(LOCALIZATION_ZORLEN_SweepingStrikes) then
			Zorlen_RegisterButtons()
			if not Zorlen_Button_SweepingStrikes then
				Print("You must put "..LOCALIZATION_ZORLEN_SweepingStrikes.." on one of your action bars (even if it is hidden) for Warrior Button to work right!")
			end
		end
	end
	if not Zorlen_Button_Cleave then
		if Zorlen_IsSpellKnown(LOCALIZATION_ZORLEN_Cleave) then
			Zorlen_RegisterButtons()
			if not Zorlen_Button_Cleave then
				Print("You must put "..LOCALIZATION_ZORLEN_Cleave.." on one of your action bars (even if it is hidden) for Warrior Button to work right!")
			end
		end
	end
	if not Zorlen_Button_Whirlwind then
		if Zorlen_IsSpellKnown(LOCALIZATION_ZORLEN_Whirldwind) then
			Zorlen_RegisterButtons()
			if not Zorlen_Button_Whirlwind then
				Print("You must put "..LOCALIZATION_ZORLEN_Whirlwind.." on one of your action bars (even if it is hidden) for Warrior Button to work right!")
			end
		end
	end
	if not Zorlen_Button_ThunderClap then
		if Zorlen_IsSpellKnown(LOCALIZATION_ZORLEN_ThunderClap) then
			Zorlen_RegisterButtons()
			if not Zorlen_Button_ThunderClap then
				Print("You must put "..LOCALIZATION_ZORLEN_ThunderClap.." on one of your action bars (even if it is hidden) for Warrior Button to work right!")
			end
		end
	end
	if not Zorlen_Button_Disarm then
		if Zorlen_IsSpellKnown(LOCALIZATION_ZORLEN_Disarm) then
			Zorlen_RegisterButtons()
			if not Zorlen_Button_Disarm then
				Print("You must put "..LOCALIZATION_ZORLEN_Disarm.." on one of your action bars (even if it is hidden) for Warrior Button to work right!")
			end
		end
	end
	if not Zorlen_Button_MortalStrike then
		if Zorlen_IsSpellKnown(LOCALIZATION_ZORLEN_MortalStrike) then
			Zorlen_RegisterButtons()
			if not Zorlen_Button_MortalStrike then
				Print("You must put "..LOCALIZATION_ZORLEN_MortalStrike.." on one of your action bars (even if it is hidden) for Warrior Button to work right!")
			end
		end
	end
	if not Zorlen_Button_Bloodthirst then
		if Zorlen_IsSpellKnown(LOCALIZATION_ZORLEN_Bloodthirst) then
			Zorlen_RegisterButtons()
			if not Zorlen_Button_Bloodthirst then
				Print("You must put "..LOCALIZATION_ZORLEN_Bloodthirst.." on one of your action bars (even if it is hidden) for Warrior Button to work right!")
			end
		end
	end
	if not Zorlen_Button_ShieldSlam then
		if Zorlen_IsSpellKnown(LOCALIZATION_ZORLEN_ShieldSlam) then
			Zorlen_RegisterButtons()
			if not Zorlen_Button_ShieldSlam then
				Print("You must put "..LOCALIZATION_ZORLEN_ShieldSlam.." on one of your action bars (even if it is hidden) for Warrior Button to work right!")
			end
		end
	end
	if not Zorlen_Button_Charge then
		if Zorlen_IsSpellKnown(LOCALIZATION_ZORLEN_Charge) then
			Zorlen_RegisterButtons()
			if not Zorlen_Button_Charge then
				Print("You must put "..LOCALIZATION_ZORLEN_Charge.." on one of your action bars (even if it is hidden) for Warrior Button to work right!")
			end
		end
	end
	if not Zorlen_Button_Intercept then
		if Zorlen_IsSpellKnown(LOCALIZATION_ZORLEN_Intercept) then
			Zorlen_RegisterButtons()
			if not Zorlen_Button_Intercept then
				Print("You must put "..LOCALIZATION_ZORLEN_Intercept.." on one of your action bars (even if it is hidden) for Warrior Button to work right!")
			end
		end
	end
	if not Zorlen_Button_Overpower then
		if Zorlen_IsSpellKnown(LOCALIZATION_ZORLEN_Overpower) then
			Zorlen_RegisterButtons()
			if not Zorlen_Button_Overpower then
				Print("You must put "..LOCALIZATION_ZORLEN_Overpower.." on one of your action bars (even if it is hidden) for Warrior Button to work right!")
			end
		end
	end
	if not Zorlen_Button_Rend then
		if Zorlen_IsSpellKnown(LOCALIZATION_ZORLEN_Rend) then
			Zorlen_RegisterButtons()
			if not Zorlen_Button_Rend then
				Print("You must put "..LOCALIZATION_ZORLEN_Rend.." on one of your action bars (even if it is hidden) for Warrior Button to work right!")
			end
		end
	end
	if not Zorlen_Button_Hamstring then
		if Zorlen_IsSpellKnown(LOCALIZATION_ZORLEN_Hamstring) then
			Zorlen_RegisterButtons()
			if not Zorlen_Button_Hamstring then
				Print("You must put "..LOCALIZATION_ZORLEN_Hamstring.." on one of your action bars (even if it is hidden) for Warrior Button to work right!")
			end
		end
	end
	if not Zorlen_Button_Execute then
		if Zorlen_IsSpellKnown(LOCALIZATION_ZORLEN_Execute) then
			Zorlen_RegisterButtons()
			if not Zorlen_Button_Execute then
				Print("You must put "..LOCALIZATION_ZORLEN_Execute.." on one of your action bars (even if it is hidden) for Warrior Button to work right!")
			end
		end
	end
	if not Zorlen_Button_ShieldBash then
		if Zorlen_IsSpellKnown(LOCALIZATION_ZORLEN_ShieldBash) then
			Zorlen_RegisterButtons()
			if not Zorlen_Button_ShieldBash then
				Print("You must put "..LOCALIZATION_ZORLEN_ShieldBash.." on one of your action bars (even if it is hidden) for Warrior Button to work right!")
			end
		end
	end
	if not Zorlen_Button_Pummel then
		if Zorlen_IsSpellKnown(LOCALIZATION_ZORLEN_Pummel) then
			Zorlen_RegisterButtons()
			if not Zorlen_Button_Pummel then
				Print("You must put "..LOCALIZATION_ZORLEN_Pummel.." on one of your action bars (even if it is hidden) for Warrior Button to work right!")
			end
		end
	end
	if not Zorlen_Button_DemoralizingShout then
		if Zorlen_IsSpellKnown(LOCALIZATION_ZORLEN_DemoralizingShout) then
			Zorlen_RegisterButtons()
			if not Zorlen_Button_DemoralizingShout then
				Print("You must put "..LOCALIZATION_ZORLEN_DemoralizingShout.." on one of your action bars (even if it is hidden) for Warrior Button to work right!")
			end
		end
	end
	if not Zorlen_Button_BerserkerRage then
		if Zorlen_IsSpellKnown(LOCALIZATION_ZORLEN_BerserkerRage) then
			Zorlen_RegisterButtons()
			if not Zorlen_Button_BerserkerRage then
				Print("You must put "..LOCALIZATION_ZORLEN_BerserkerRage.." on one of your action bars (even if it is hidden) for Warrior Button to work right!")
			end
		end
	end
	if not Zorlen_Button_Bloodrage then
		if Zorlen_IsSpellKnown(LOCALIZATION_ZORLEN_Bloodrage) then
			Zorlen_RegisterButtons()
			if not Zorlen_Button_Bloodrage then
				Print("You must put "..LOCALIZATION_ZORLEN_Bloodrage.." on one of your action bars (even if it is hidden) for Warrior Button to work right!")
			end
		end
	end
	if not Zorlen_Button_DeathWish then
		if Zorlen_IsSpellKnown(LOCALIZATION_ZORLEN_DeathWish) then
			Zorlen_RegisterButtons()
			if not Zorlen_Button_DeathWish then
				Print("You must put "..LOCALIZATION_ZORLEN_DeathWish.." on one of your action bars (even if it is hidden) for Warrior Button to work right!")
			end
		end
	end
	if not Zorlen_Button_HeroicStrike then
		if Zorlen_IsSpellKnown(LOCALIZATION_ZORLEN_HeroicStrike) then
			Zorlen_RegisterButtons()
			if not Zorlen_Button_HeroicStrike then
				Print("You must put "..LOCALIZATION_ZORLEN_HeroicStrike.." on one of your action bars (even if it is hidden) for Warrior Button to work right!")
			end
		end
	end
	if not Zorlen_Button_BattleShout then
		if Zorlen_IsSpellKnown(LOCALIZATION_ZORLEN_BattleShout) then
			Zorlen_RegisterButtons()
			if not Zorlen_Button_BattleShout then
				Print("You must put "..LOCALIZATION_ZORLEN_BattleShout.." on one of your action bars (even if it is hidden) for Warrior Button to work right!")
			end
		end
	end
end
