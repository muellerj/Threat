--[[
  Threat
  By: Ollowain.
	Credit: Fury.lua by Bhaerau.
]]--

-- Variables
local RevengeReadyUntil = 0;

function Threat_Configuration_Init()
  if (not Threat_Configuration) then
    Threat_Configuration = { };
  end

  if (Threat_Configuration["Debug"] == nil) then
    Threat_Configuration["Debug"] = false;
  end
end

-- Normal Functions

local function Print(msg)
  if (not DEFAULT_CHAT_FRAME) then
    return;
  end
  DEFAULT_CHAT_FRAME:AddMessage(msg);
end

local function Debug(msg)
  if (Threat_Configuration["Debug"]) then
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
    if (start == 0 and duration == 0 and ThreatLastSpellCast + 1 <= GetTime()) then
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

function ActiveStance()
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
      if (debuffAmount >= 5) then
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


function Threat()
  if (not UnitIsCivilian("target") and UnitClass("player") == CLASS_WARRIOR_THREAT) then

    local rage = UnitMana("player");

    if (not ThreatAttack) then
      Debug("Starting AutoAttack");
      AttackTarget();
    end

    if (ActiveStance() ~= 2) then
      Debug("Changing to def stance");
      CastSpellByName(ABILITY_DEFENSIVE_STANCE_THREAT);
    end

    if (SpellReady(ABILITY_BATTLE_SHOUT_THREAT) and not HasBuff("player", "Ability_Warrior_BattleShout") and rage >= 10) then
      Debug("Battle Shout");
      CastSpellByName(ABILITY_BATTLE_SHOUT_THREAT);
    elseif (SpellReady(ABILITY_SHIELD_SLAM_THREAT) and rage >= 20 and ShieldSlamLearned()) then
      Debug("Shield slam");
      CastSpellByName(ABILITY_SHIELD_SLAM_THREAT);
    elseif (SpellReady(ABILITY_REVENGE_THREAT) and RevengeAvail() and rage >= 5) then
      Debug("Revenge");
      CastSpellByName(ABILITY_REVENGE_THREAT);
    elseif (SpellReady(ABILITY_SUNDER_ARMOR_THREAT) and rage >= 15 and not (HasFiveSunderArmors("target"))) then
      Debug("Sunder armor");
      CastSpellByName(ABILITY_SUNDER_ARMOR_THREAT);
    elseif (SpellReady(ABILITY_HEROIC_STRIKE_THREAT) and rage >= 25) then
      Debug("Heroic strike");
      CastSpellByName(ABILITY_HEROIC_STRIKE_THREAT);
    end

  end
end

-- Chat Handlers

function Threat_SlashCommand(msg)
  local _, _, command, options = string.find(msg, "([%w%p]+)%s*(.*)$");
  if (command) then
    command = string.lower(command);
  end
  if (command == nil or command == "") then
    Threat();
  elseif (command == "debug") then
    if (Threat_Configuration["Debug"]) then
      Threat_Configuration["Debug"] = false;
      Print(BINDING_HEADER_THREAT .. ": " .. SLASH_THREAT_DEBUG .. " " .. SLASH_THREAT_DISABLED .. ".")
    else
      Threat_Configuration["Debug"] = true;
      Print(BINDING_HEADER_THREAT .. ": " .. SLASH_THREAT_DEBUG .. " " .. SLASH_THREAT_ENABLED .. ".")
    end
  else
    Print(SLASH_THREAT_HELP)
  end
end

-- Event Handlers

function Threat_OnLoad()
  this:RegisterEvent("VARIABLES_LOADED");
  this:RegisterEvent("PLAYER_ENTER_COMBAT");
  this:RegisterEvent("PLAYER_LEAVE_COMBAT");
  this:RegisterEvent("CHAT_MSG_COMBAT_CREATURE_VS_SELF_MISSES");

  ThreatLastSpellCast = GetTime();
  ThreatLastStanceCast = GetTime();
  SlashCmdList["THREAT"] = Threat_SlashCommand;
  SLASH_THREAT1 = "/threat";
end

function Threat_OnEvent(event)
  if (event == "VARIABLES_LOADED") then
    Threat_Configuration_Init()
  elseif (event == "PLAYER_ENTER_COMBAT") then
    ThreatAttack = true;
  elseif (event == "PLAYER_LEAVE_COMBAT") then
    ThreatAttack = nil;
  elseif (event == "CHAT_MSG_COMBAT_CREATURE_VS_SELF_MISSES")then
    if string.find(arg1,"You block")
    or string.find(arg1,"You parry")
    or string.find(arg1,"You dodge") then
      Debug("Revenge soon ready");
      RevengeReadyUntil = GetTime() + 4;
    end
  end
end
