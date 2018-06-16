 --[[  
combat tracker
 --]]
CTT=CreateFrame("Frame")CTT:SetParent(TargetFrame)CTT:SetPoint("Left",TargetFrame,-30,0)CTT:SetSize(30,30)CTT.t=CTT:CreateTexture(nil,BORDER)CTT.t:SetAllPoints()CTT.t:SetTexture("Interface\\Icons\\ABILITY_DUALWIELD")CTT:Hide()
                local function FrameOnUpdate(self) if UnitAffectingCombat("target") then self:Show() else self:Hide() end end local g = CreateFrame("Frame") g:SetScript("OnUpdate", function(self) FrameOnUpdate(CTT) end)
                CFT=CreateFrame("Frame")CFT:SetParent(FocusFrame)CFT:SetPoint("Left",FocusFrame,-30,5)CFT:SetSize(25,25)CFT.t=CFT:CreateTexture(nil,BORDER)CFT.t:SetAllPoints()CFT.t:SetTexture("Interface\\Icons\\ABILITY_DUALWIELD")CFT:Hide()
                local function FrameOnUpdate(self) if UnitAffectingCombat("focus") then self:Show() else self:Hide() end end local g = CreateFrame("Frame") g:SetScript("OnUpdate", function(self) FrameOnUpdate(CFT) end)
 --[[  
number seperator
 --]]
LARGE_NUMBER_SEPERATOR = ","
 --[[  
currect hp and mana
 --]]
hooksecurefunc("TextStatusBar_UpdateTextStringWithValues",function(f,s) if f.TextString then local t=s:GetText()if t then s:SetText(t:gsub(" / .*",""))end end end)
 --[[  
transparent target and focus background
 --]]
UnitSelectionColor = function(unit)
if not UnitExists(unit) then return 1,1,1,1 end
local color = UnitIsPlayer(unit) and RAID_CLASS_COLORS[select(2, 
UnitClass(unit))] or FACTION_BAR_COLORS[UnitReaction(unit, 'player')]
if color then
if not UnitIsConnected(unit) then
return .5, .5, .5, 1
else
return 0, 0, 0, 0.5
end
else
if UnitIsTapped(unit) and not UnitIsTappedByPlayer(unit) then
return .5, .5, .5, 1
end
end
end

local f = CreateFrame("Frame", nil, UIParent)
f:RegisterEvent("PLAYER_ENTERING_WORLD")
f:SetScript("OnEvent", function(self, event)
UIParent:SetScale(0.82)  -- change the size and reload your ui (/reloadui)
f:UnregisterAllEvents()
SpellActivationOverlayFrame:SetScale("0.7")
end)

 --[[
remove red 
 --]]
 PlayerFrameFlash:Hide(); PlayerFrameFlash.Show = function() end
 TargetFrameFlash:Hide(); TargetFrameFlash.Show = function() end
 FocusFrameFlashLHide(); FocusFrameFlash.Show = function() end
