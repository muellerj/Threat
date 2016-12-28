--[[
	Prot

	By: Bhaerau.
]]--

--------------------------------------------------
--
-- Variables
--
--------------------------------------------------
local RevengeReadyUntil = 0;

function Prot_Configuration_Init()
	if (not Prot_Configuration) then
		Prot_Configuration = { };
	end

	if (Prot_Configuration["Enabled"] == nil) then
		Prot_Configuration["Enabled"] = true; --Set to false to disable the addon
	end
	if (Prot_Configuration["Debug"] == nil) then
		Prot_Configuration["Debug"] = false; --Set to true to enable debugging feedback
	end
end

function Prot_Configuration_Default()
	Prot_Configuration["Enabled"] = true;
	Prot_Configuration["Debug"] = false;
end

-- Normal Functions

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

function HasFiveSunderArmors(unit)
	local id = 1;
	while (UnitDebuff(unit, id)) do
		local debuffTexture, debuffAmount = UnitDebuff(unit, id);
		if (string.find(debuffTexture, "Sunder")) then
      if (debuffAmount == 5) then
        return true;
      else
        return nil;
      end
		end
		id = id + 1;
	end
	return nil;
end

function RevengeAvail()
  if GetTime() < RevengeReadyUntil then
    return true;
  else
    return nil;
  end
end

function ShieldSlamLearned()
	if UnitClass("player") == "Warrior" then
		local _, _, _, _, ss = GetTalentInfo(3,17);
		if (ss == 1) then
      return true;
    else
      return nil;
		end
	end
end


function Prot()
	if (Prot_Configuration["Enabled"] and not UnitIsCivilian("target") and UnitClass("player") == CLASS_WARRIOR_PROT) then

    local rage = UnitMana("player");

		if (not ProtAttack) then
      Debug("Starting AutoAttack");
			AttackTarget();
		end

    if (ActiveStance() ~= 2) then
      Debug("Changing to def stance");
      CastSpellByName(ABILITY_DEFENSIVE_STANCE_PROT);
    end

    if (SpellReady(ABILITY_SHIELD_SLAM_PROT) and rage >= 20 and ShieldSlamLearned()) then
      Debug("Shield slam");
      CastSpellByName(ABILITY_SHIELD_SLAM_PROT);
    elseif (SpellReady(ABILITY_REVENGE_PROT) and RevengeAvail() and rage >= 5) then
      Debug("Revenge");
      CastSpellByName(ABILITY_REVENGE_PROT);
    elseif (SpellReady(ABILITY_SUNDER_ARMOR_PROT) and rage >= 15 and not (HasFiveSunderArmors("target"))) then
      Debug("Sunder armor");
      CastSpellByName(ABILITY_SUNDER_ARMOR_PROT);
    elseif (SpellReady(ABILITY_HEROIC_STRIKE_PROT) and rage >= 25) then
      Debug("Heroic strike");
      CastSpellByName(ABILITY_HEROIC_STRIKE_PROT);
    end

	end
end

function Bloodrage()
	if (UnitClass("player") == CLASS_WARRIOR_PROT) then
    if ShieldSlamLearned() then
      if ActiveStance() ~= 2 then
        Debug("Changing to def stance");
        CastSpellByName(ABILITY_DEFENSIVE_STANCE_PROT);
      else
        Debug("Activating Bloodrage in def");
        CastSpellByName(ABILITY_BLOODRAGE_PROT);
      end
    else
      if ActiveStance() ~= 3 then
        Debug("Changing to bersi stance");
        CastSpellByName(ABILITY_BERSERKER_STANCE_PROT);
      else
        Debug("Activating Bloodrage in bersi");
        CastSpellByName(ABILITY_BLOODRAGE_PROT);
      end
    end
  end
end

-- Chat Handlers

function Prot_SlashCommand(msg)
	local _, _, command, options = string.find(msg, "([%w%p]+)%s*(.*)$");
	if (command) then
		command = string.lower(command);
	end
	if (command == nil or command == "") then
		Prot();
	elseif (command == "debug") then
		if (Prot_Configuration["Debug"]) then
			Prot_Configuration["Debug"] = false;
			Print(BINDING_HEADER_PROT .. ": " .. SLASH_PROT_DEBUG .. " " .. SLASH_PROT_DISABLED .. ".")
		else
			Prot_Configuration["Debug"] = true;
			Print(BINDING_HEADER_PROT .. ": " .. SLASH_PROT_DEBUG .. " " .. SLASH_PROT_ENABLED .. ".")
		end
	else
		Print(SLASH_PROT_HELP)
	end
end

-- Event Handlers

function Prot_OnLoad()
	this:RegisterEvent("VARIABLES_LOADED");
	this:RegisterEvent("PLAYER_ENTER_COMBAT");
	this:RegisterEvent("PLAYER_LEAVE_COMBAT");
  this:RegisterEvent("CHAT_MSG_COMBAT_CREATURE_VS_SELF_MISSES");

	ProtLastSpellCast = GetTime();
	ProtLastStanceCast = GetTime();
	SlashCmdList["PROT"] = Prot_SlashCommand;
	SLASH_PROT1 = "/prot";
end

function Prot_OnEvent(event)
	if (event == "VARIABLES_LOADED") then
		Prot_Configuration_Init()
	elseif (event == "PLAYER_ENTER_COMBAT") then
		ProtAttack = true;
	elseif (event == "PLAYER_LEAVE_COMBAT") then
		ProtAttack = nil;
	elseif (event == "CHAT_MSG_COMBAT_CREATURE_VS_SELF_MISSES")then
		if string.find(arg1,"You block") 
    or string.find(arg1,"You parry") 
    or string.find(arg1,"You dodge") then
      Debug("Revenge soon ready");
      RevengeReadyUntil = GetTime() + 4;
		end
	end
end
