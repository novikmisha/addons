HotLoot = LibStub("AceAddon-3.0"):NewAddon("HotLoot", "AceConsole-3.0", "AceEvent-3.0")
local L = LibStub("AceLocale-3.0"):GetLocale("HotLoot")
local TipHooker = LibStub:GetLibrary("LibTipHooker-1.1")
local ScrollingTable = LibStub("ScrollingTable")
--local ScrollingTable = LibStub:GetLibrary("ScrollingTable")
hIcon = LibStub("LibDBIcon-1.0")

--==========================
--	       VAR LIST
--==========================
--==GENERAL==--
local lootedByHL, icons, itemsToDelete, closeEL, skinModeTrigger  = {}, {}, "", 0, 0

--==THEMES==--
--Current
local nameCurrent,themeSize,heightCurrent,bgFileCurrent,edgeFileCurrent,tileCurrent,tileSizeCurrent,edgeSizeCurrent,insetsCurrent,disIconSizeCurrent

--==INCLUDE BUTTONS==--
local incButtons = {}

--==FADE ITEMS==--
local isFirst = 0
--**************************


--==========================
--		Process Tooltip
--==========================
function HotLoot:ProcessTooltip(tooltip, name, link)
	--HotLoot:dBug("name", name)
	--HotLoot:dBug("link", link)
	local iName = select(1,GetItemInfo(name))
	if HotLoot:GetIncludeTable()[iName] then
		GameTooltip:AddLine("|cFFCD6600HotLoot|r: "..L["Included"])
		
	elseif HotLoot:GetExcludeTable()[iName] then
		GameTooltip:AddLine("|cFFCD6600HotLoot|r: "..L["Excluded"])
	end
	GameTooltip:Show()
end

--==========================
--		MINIMAP ICON
--==========================
local hLDB = LibStub("LibDataBroker-1.1"):NewDataObject("HotLoot", {
	type = "launcher",
	icon = "Interface\\AddOns\\HotLoot\\icon",
	OnClick = function(clickedframe, button)
			HotLoot:dBug(button)
			if button == "LeftButton" then
				LibStub("AceConfigDialog-3.0"):Open("HotLoot")
			elseif button == "RightButton" and IsAddOnLoaded("HotLoot_LootHistory") then
				HotLoot:ToggleLootHistory()
			elseif button == "MiddleButton" then
				HotLoot:MMToggleAnchor()
			end
	end,
	OnTooltipShow = function(Tip)
		if not Tip or not Tip.AddLine then 
			return
		end
		Tip:AddLine("HotLoot", 1, 0.4, 0)
		Tip:AddLine(L["MMIconTT"], 1, 1, 1)
		Tip:AddLine(L["MMIconTT2"], 1, 1, 1)
		Tip:AddLine(L["MMIconTT3"], 1, 1, 1)
	end,
})
--==========================
--	CREATE MONITOR ANCHOR
--==========================
function HotLoot:CreateMainFrame()
	
	HotLoot.mainFrame = CreateFrame("Frame", "mainFrame", UIParent)
	HotLoot.mainFrame:SetHeight(16)
	HotLoot.mainFrame:SetPoint("CENTER", 0, 0)
	HotLoot.fade = CreateFrame("Frame", nil, UIParent)
	HotLoot.fade:SetScript("OnUpdate", hlFadeItems)

	HotLoot.mainFrame.mainBG = HotLoot.mainFrame:CreateTexture("mainBG", "BACKGROUND")
	HotLoot.mainFrame.mainBG:SetAllPoints(HotLoot.mainFrame)
	HotLoot.mainFrame.mainBG:SetTexture(0, 0.7, 0, 0.7)
	
	HotLoot.mainFrame.anchorText = HotLoot.mainFrame:CreateFontString(nil, "OVERLAY")
	HotLoot.mainFrame.anchorText:SetPoint("CENTER", HotLoot.mainFrame, "CENTER", 0, 0)
	HotLoot.mainFrame.anchorText:SetFont(STANDARD_TEXT_FONT, 9, "OUTLINE")
	--name:SetJustifyH("LEFT")
	HotLoot.mainFrame.anchorText:SetText("HotLoot")
	HotLoot.mainFrame:SetWidth(145)
	
	HotLoot.mainFrame:RegisterForDrag("LeftButton")
	HotLoot.mainFrame:SetMovable(true)
	HotLoot.mainFrame:EnableMouse(true)
	HotLoot.mainFrame:SetScript("OnDragStart", HotLoot.mainFrame.StartMoving)
	HotLoot.mainFrame:SetScript("OnDragStop", HotLoot.mainFrame.StopMovingOrSizing)
	HotLoot.mainFrame:Show()
end

--==========================
--	CREATE Loot Tracker
--==========================
--	UNUSED  <------------[

local function tableSize(tbl)
	local x = 0
	for k,v in pairs(tbl) do
		x = x + 1
	end
	return x
end




--==========================
--		Total in Bags
--==========================
local function InBags(iName, lquant)
	local q, inBags, n, scount
	inBags = lquant
	for b = 0, 4 do 
		for s = 1, GetContainerNumSlots(b) do 
			if GetContainerItemID(b, s) then
			n = select(1, GetItemInfo(GetContainerItemID(b, s)))
			if n == iName then
				q = select(2, GetContainerItemInfo(b, s))
				inBags = inBags + q
			end
			end
		end
	end
	return inBags
end


--******************ANNOUNCE FUNCTION********************

function HotLoot:Announce(input)
	if HotLoot:GetLootAnnounce() then
		print("|cFFCD6600HotLoot|r: " .. tostring(input))
	end
end

--==================================
--		Themes Table and FUNCS
--==================================
local newThemes = {
	["classic"] ={
		["name"] = "Classic",
		["disIconSize"] = false,
		["themeSize"] = "small",
		["height"] = 18,
		["bgFile"] = "Interface\\AddOns\\HotLoot\\media\\textures\\statusbars\\trans", 
		["edgeFile"] = "Interface\\AddOns\\HotLoot\\media\\textures\\borders\\trans", 
		["tile"] = true, ["tileSize"] = 16, ["edgeSize"] = 16, 
		["insets"] = { left = 2, right = 2, top = 2, bottom = 2 }
	},
	["minimal"] ={
		["name"] = "Minimal",
		["disIconSize"] = true,
		["height"] = 18,
		["bgFile"] = "Interface\\AddOns\\HotLoot\\media\\textures\\statusbars\\elv", 
		["edgeFile"] = "Interface\\AddOns\\HotLoot\\media\\textures\\borders\\px-black", 
		["tile"] = true, ["tileSize"] = 16, ["edgeSize"] = 16, 
		["insets"] = { left = 2, right = 2, top = 2, bottom = 2 }
	},
	["holo"] ={
		["name"] = "Holo",
		["disIconSize"] = true,
		["height"] = 18,
		["bgFile"] = "Interface\\AddOns\\HotLoot\\media\\textures\\statusbars\\holo", 
		["edgeFile"] = "Interface\\AddOns\\HotLoot\\media\\textures\\borders\\trans", 
		["tile"] = true, ["tileSize"] = 32, ["edgeSize"] = 16, 
		["insets"] = { left = 0, right = 0, top = 0, bottom = 0 }
	},
	--UI-Achievement-WoodBorder
	["paper"] ={
		["name"] = "Paper",
		["disIconSize"] = true,
		["themeSize"] = "large",
		["height"] = 50,
		["bgFile"] = "Interface\\ACHIEVEMENTFRAME\\UI-ACHIEVEMENT-ACHIEVEMENTBACKGROUND", 
		["edgeFile"] = [[Interface\FriendsFrame\UI-Toast-Border]], 
		["tile"] = true, ["tileSize"] = 256, ["edgeSize"] = 12, 
		["insets"] = { left = 5, right = 5, top = 5, bottom = 5 }
	},
	["color"] ={
		["name"] = "Colored",
		["disIconSize"] = false,
		["themeSize"] = "small",
		["height"] = 20,
		["bgFile"] = "Interface\\AddOns\\HotLoot\\media\\textures\\statusbars\\colorbg", 
		["edgeFile"] = "Interface\\AddOns\\HotLoot\\media\\textures\\borders\\colorborder", 
		["tile"] = true, ["tileSize"] = 16, ["edgeSize"] = 16, 
		["insets"] = { left = 2, right = 2, top = 2, bottom = 2 }
	},
	["toast"] ={
		["name"] = "Toast",
		["themeSize"] = "large",
		["disIconSize"] = true,
		["height"] = 50,
		["bgFile"] = [[Interface\CHATFRAME\CHATFRAMEBACKGROUND]], 
		["edgeFile"] = [[Interface\FriendsFrame\UI-Toast-Border]], 
		["tile"] = true, ["tileSize"] = 12, ["edgeSize"] = 12, 
		["insets"] = { left = 5, right = 5, top = 5, bottom = 5 }
	},
}

function HotLoot:LoadTheme(theme)
	-- load vars
	nameCurrent = newThemes[theme]["name"]
	 HotLoot:Announce(L["AnnounceLoadingTheme"]..nameCurrent)
	themeSize = newThemes[theme]["themeSize"]
	heightCurrent = newThemes[theme]["height"]
	bgFileCurrent = newThemes[theme]["bgFile"]
	edgeFileCurrent = newThemes[theme]["edgeFile"]
	tileCurrent = newThemes[theme]["tile"]
	tileSizeCurrent = newThemes[theme]["tileSize"]
	edgeSizeCurrent = newThemes[theme]["edgeSize"]
	insetsCurrent = newThemes[theme]["insets"]
	disIconSizeCurrent = newThemes[theme]["disIconSize"]
end

local function LoadThemeInit(theme)
	--newThemes
	-- load vars
	nameCurrent = newThemes[theme]["name"]
	 HotLoot:Announce(L["AnnounceLoadingTheme"]..nameCurrent)
	themeSize = newThemes[theme]["themeSize"]
	heightCurrent = newThemes[theme]["height"]
	bgFileCurrent = newThemes[theme]["bgFile"]
	edgeFileCurrent = newThemes[theme]["edgeFile"]
	tileCurrent = newThemes[theme]["tile"]
	tileSizeCurrent = newThemes[theme]["tileSize"]
	edgeSizeCurrent = newThemes[theme]["edgeSize"]
	insetsCurrent = newThemes[theme]["insets"]
	disIconSizeCurrent = newThemes[theme]["disIconSize"]

end
-- disNamesC
function HotLoot:ToggleNamesDisable()
	return disNamesC
end
-- disIconSizeCurrent
function HotLoot:ToggleSizeDisable()
	return disIconSizeCurrent
end
function HotLoot:ColorHide()
	if HotLoot:GetThemeSelect() == "color" then
		return false
	else
		return true
	end
end
-- color control
function HotLoot:MakeColor(key, input)
	if key == "ctrl" then
		return "|cFFFFCC00"..input.."|r"
	end
end



-- OnInitialize
function HotLoot:OnInitialize()
	
    self.db = LibStub("AceDB-3.0"):New("HotLootDB", hlDefaults)
	hIcon:Register("HotLoot", hLDB, self.db.profile.minimapIcon)
	--s
    LibStub("AceConfig-3.0"):RegisterOptionsTable("HotLoot", hlOptions)
	hlOptions.args.profile = LibStub("AceDBOptions-3.0"):GetOptionsTable(self.db)
    --self.optionsFrame = LibStub("AceConfigDialog-3.0"):AddToBlizOptions("HotLoot", "HotLoot")
	
	if not self.db.profile.watchList then
		self.db.profile.watchList = {}
	end
    self:RegisterChatCommand("hl", "ChatCommand")
    self:RegisterChatCommand("hotloot", "ChatCommand")
	HotLoot:CreateMainFrame()
	--LootHistory:CreateLootHistory()
	
	--HotLoot:CreateFishingMacro()
end


-- OnEnable
function HotLoot:OnEnable()
	TipHooker:Hook(HotLoot.ProcessTooltip, "item")
	
	if not HotLoot:GetThemeSelect() then
		HotLoot:SetThemeSelect(self,"classic")
	end
	
	tStart = 0
	HotLoot:ToggleAnchor(HotLoot:GetLootShowAnchor())
	LoadThemeInit(HotLoot:GetThemeSelect())
	HotLoot:RegisterEvent("LOOT_OPENED")
	HotLoot:RegisterEvent("LOOT_CLOSED")
	HotLoot:RegisterEvent("LOOT_SLOT_CLEARED")
	HotLoot:RegisterEvent("BAG_UPDATE")
	HotLoot:RegisterEvent("ADDON_LOADED")
	HotLoot:RegisterEvent("MERCHANT_SHOW")
	HotLoot:RegisterEvent("PLAYER_REGEN_ENABLED")
	HotLoot:RegisterEvent("PLAYER_REGEN_DISABLED")
	HotLoot:RegisterEvent("START_LOOT_ROLL")
	HotLoot:RegisterEvent("CONFIRM_LOOT_ROLL")
	HotLoot:RegisterEvent("CONFIRM_DISENCHANT_ROLL")
	
end

-- ChatCommand
function HotLoot:ChatCommand(input)
    if not input or input:trim() == "" then
        --InterfaceOptionsFrame_OpenToCategory(self.optionsFrame)
		--InterfaceOptionsFrame_OpenToCategory(self.optionsFrame)
		LibStub("AceConfigDialog-3.0"):Open("HotLoot")
	elseif input == "help" then
		print("|cFFCD6600HotLoot|r: Available Commands")
		print("|cFFCD6600HotLoot|r: |cFFFFCC00enable:|r     Enables/disables |cFFCD6600HotLoot|r")
		print("|cFFCD6600HotLoot|r: |cFFFFCC00debug:|r     Enables/disables debug mode")
		print("|cFFCD6600HotLoot|r: |cFFFFCC00autoclose:|r Toggles the autoclose option")
		print("|cFFCD6600HotLoot|r: |cFFFFCC00skinning:|r   Toggles skinning mode")
		print("|cFFCD6600HotLoot|r: |cFFFFCC00monitor:|r    Toggles loot monitor")
		print("|cFFCD6600HotLoot|r: |cFFFFCC00include <item>:|r    Adds the item to the Include List")
		print("|cFFCD6600HotLoot|r: |cFFFFCC00exclude <item>:|r    Adds the item to the Exclude List")
		print("|cFFCD6600HotLoot|r: |cFFFFCC00history:|r    Opens the Loot History window")
    elseif string.match(input, "%a+") == "include" then
		local item = string.match(input, "%a+%s(.+)")
		HotLoot:SetIncludeList(nil, item)
		 HotLoot:Announce(item..L["ChatCmdInclude"])
	elseif string.match(input, "%a+") == "exclude" then
		local item = string.match(input, "%a+%s(.+)")
		HotLoot:SetExcludeList(nil, item)
		 HotLoot:Announce(item..L["ChatCmdExclude"])
	elseif string.match(input, "%a+") == "history" then
		HotLoot:ToggleLootHistory()
	else
		--print(input.." | trim: ".. input:trim())
        LibStub("AceConfigCmd-3.0"):HandleCommand("hl", "HotLoot", input)
    end
end
--==========================
--		Debug Mode
--==========================
function HotLoot:dBug(name, value)
	if (HotLoot:GetLootDebug() == true) then
		local toP
		if value then
			toP = tostring(name) .. " = " .. tostring(value)
		else
			toP = tostring(name)
		end
		print("<HotLoot Debug> " .. toP)
	end
end
--==========================
--		Restart Timer
--==========================
local function ResetTimer()
	tStart = GetTime()
end
--==========================
--		Test Monitor
--==========================
function HotLoot:TestMonitor()
	local itemName, itemLink, _, itemLevel, _, itemType, itemSubType, _, _, itemTexture, itemSellPrice = GetItemInfo(6948)
	local itoadd = HotLoot:addLootIcon(itemTexture, itemName, itemLink, 5)
	table.insert(icons, 1, itoadd)
	ResetTimer()
	itoadd = nil
	itemName, itemLink, itemRarity, itemLevel, itemMinLevel, itemType, itemSubType, itemStackCount, itemEquipLoc, itemTexture, itemSellPrice = nil			
	HotLoot:UpdateMonitor()
end
--==========================
--			GET ID
--==========================
local function GetItemID(itemLink)
	local _, _, Color, Ltype, Id, Enchant, Gem1, Gem2, Gem3, Gem4, Suffix, Unique, LinkLvl, Name = string.find(itemLink,
		"|?c?f?f?(%x*)|?H?([^:]*):?(%d+):?(%d*):?(%d*):?(%d*):?(%d*):?(%d*):?(%-?%d*):?(%-?%d*):?(%d*):?(%d*):?(%-?%d*)|?h?%[?([^%[%]]*)%]?|?h?|?r?")
	return tonumber(Id)
end
--==========================
--		IS KEY DOWN
--==========================
local function CloseKeyDown()
	local keyDown
	local modKey = HotLoot:GetLootCloseKey()
	if (modKey == "ctrl") then 
		keyDown = IsControlKeyDown()
	elseif (modKey == "shift") then 
		keyDown = IsShiftKeyDown()
	elseif (modKey == "alt") then 
		keyDown = IsAltKeyDown()
	end
	--HotLoot:dBug("keyDown",keyDown)
	return keyDown
end
local function SkinKeyDown()
	local sKeyDown
	local modKey = HotLoot:GetLootSkinKey()
	if (modKey == "ctrl") then 
		sKeyDown = IsControlKeyDown()
	elseif (modKey == "shift") then 
		sKeyDown = IsShiftKeyDown()
	elseif (modKey == "alt") then 
		sKeyDown = IsAltKeyDown()
	end
	return sKeyDown
end
--==========================
-- 		Add to I List
--==========================
function HotLoot:AddIList(value)
	if GetItemInfo(value) then
		local iName = select(1,GetItemInfo(value))
		HotLoot:SetIncludeTable(iName)
	else
		HotLoot:SetIncludeTable(value)
	end
end
function HotLoot:RemoveIList()
	HotLoot:GetIncludeTable()[HotLoot:GetIncludeDrop()] = nil
end

--==========================
-- 		Add to E List
--==========================
function HotLoot:AddEList(value)
	if GetItemInfo(tostring(value)) then
		local iName = select(1,GetItemInfo(value))
		HotLoot:SetExcludeTable(iName)
	else
		HotLoot:SetExcludeTable(value)
	end
end
function HotLoot:RemoveEList()
	HotLoot:GetExcludeTable()[HotLoot:GetExcludeDrop()] = nil
end

	
--==========================
--		To Skin Mode
--==========================
local function ToSkin(slot)
	local lootIcon, lootName, lootQuantity, lootQuality, locked = GetLootSlotInfo(slot)
	--HotLoot:dBug("lootName", lootName)
	--HotLoot:dBug("lootQuantity", lootQuantity)
	if  (HotLoot:GetLootSkinMode() or SkinKeyDown()) and (lootQuantity > 0) then
		itemsToDelete = itemsToDelete .. " " .. lootName
		--itemsToDelete[curSlot] = itemLink
		LootSlot(slot)
		HotLoot:dBug(lootName, "added to itemsToDelete")
		skinModeTrigger = 1
		--HotLoot:dBug("skinModeTrigger", skinModeTrigger)
	end
end
--#############################
--		Skinning Mode
--#############################
local function DeleteLeftovers()
	if (HotLoot:GetLootSkinMode() == true) or (skinModeTrigger == 1) then
		skinModeTrigger = 0
		 HotLoot:Announce(L["SkinAnnounce1"])
		--HotLoot:dBug("itemsToDelete", itemsToDelete)
		for b = 0, 4 do 
			for s = 1, GetContainerNumSlots(b) do 
				local dLink = GetContainerItemLink(b, s)
				--HotLoot:dBug("dLink", dLink)
				if dLink then
					local dName = select(1, GetItemInfo(dLink))
					--HotLoot:dBug(itemsToDelete, dName)
					--HotLoot:dBug("string.find", string.find(itemsToDelete, dName))
				--for i = 1, #itemsToDelete do
					if string.find(itemsToDelete, dName) ~= nil then 
						PickupContainerItem(b, s)
						if CursorHasItem() then
							 HotLoot:Announce(dLink .. L["SkinAnnounce2"])
							DeleteCursorItem()
						end
					end
				end
			end
		end
		itemsToDelete = " "
	end
end
--==========================
--	Is it Gold or Currency?
--==========================
local function IsGold(slot)
	if GetLootSlotType(slot) == 2 and HotLoot:GetLootGold() then 
		return true
	end
end
local function IsCurrency(slot)
	if GetLootSlotType(slot) == 3 and HotLoot:GetLootCurrency() then 
		return true
	end
end

--==========================
--		CHECK FOR ROOM
--==========================
local function HasRoom(room)
	local numFSlots = 0
	for b = 0, 4 do 
		numFSlots = numFSlots + select(1, GetContainerNumFreeSlots(b))
	end
	if  numFSlots >= room then
		return true
	else
		return false
	end
end
--==========================
--		CHECK STACKABLE
--==========================
local function CanStack(iname, scount, lquant)
	--if scount then
	local q, stackRoom, n
	stackRoom = 0
	for b = 0, 4 do 
		for s = 1, GetContainerNumSlots(b) do 
			n = select(1, GetItemInfo(GetContainerItemID(b, s)))
			if n == iname then
				q = select(2, GetContainerItemInfo(b, s))
				stackRoom = (stackRoom) + (scount - q)
			end
		end
	end
	if lquant <= stackRoom then
		return true	
	else
		return false
	end
	--else
	--	return true
	--end
end
--==========================
--		Threshold Check
--==========================
local function CheckThreshold(iType, sellAmount, lootQuant)
	local value, quant
	quant = lootQuant
	if HotLoot:GetUseQuant() then
		value = quant * sellAmount
	else
		value = sellAmount
	end
	
	if HotLoot:GetType1() == iType then
		if tonumber(HotLoot:ToCopper(HotLoot:GetValue1())) <= value then
			return true
		else
			return false
		end
	elseif HotLoot:GetType2() == iType then
		if tonumber(HotLoot:ToCopper(HotLoot:GetValue2())) <= value then
			return true
		else
			return false
		end
	elseif HotLoot:GetType3() == iType then
		if tonumber(HotLoot:ToCopper(HotLoot:GetValue3())) <= value then
			return true
		else
			return false
		end
	else
		return true
	end
end
--==========================
--		iLvl Check
--==========================
local function CheckILvl(iLvl)
	if HotLoot:GetMinILvl() then
		if tonumber(iLvl) >= tonumber(HotLoot:GetMinILvl()) then
			return true
		else
			return false
		end
	else
		return true
	end
end

--==========================
--			Round
--==========================
local function round(num, idp)
    local mult = 10^(idp or 0)
    if num >= 0 then return math.floor(num * mult + 0.5) / mult
    else return math.ceil(num * mult - 0.5) / mult end
end

--==========================
--			Round
--==========================
function HotLoot:SellGreys()
	local bag, slot
	local totalPrice=0
	for bag=0, NUM_BAG_SLOTS do
		for slot = 1, GetContainerNumSlots(bag) do
			local item = GetContainerItemID(bag,slot)
			if item then
				local itemName, itemLink, itemQuality = GetItemInfo(item)
				local sellPrice = select(11,GetItemInfo(item))
				if itemQuality == 0 and sellPrice > 0 then
					local itemCount = select(2,GetContainerItemInfo(bag,slot))
					HotLoot:Announce(string.format(L["GreyItemSold"], itemLink, itemCount, GetCoinTextureString(sellPrice * itemCount)))
					UseContainerItem(bag,slot)
					totalPrice = totalPrice + sellPrice * itemCount
				end
			end
		end
	end
	if totalPrice > 0 then
		HotLoot:Announce(string.format(L["AllGreysSold"], GetCoinTextureString(totalPrice)))
	end
end
--==========================
--			TT SCANNER
--==========================

local hlTipScan = CreateFrame('GameTooltip', 'hlTipScan', UIParent, 'GameTooltipTemplate')
local function ScanTip(slot, name)
	hlTipScan:SetOwner(UIParent, 'ANCHOR_NONE') 
	hlTipScan:SetLootItem(slot)
	local text = hlTipScanTextLeft2:GetText()
	text = hlTipScanTextLeft2:GetText()
	--HotLoot:dBug("scantip",text.." - "..name)
	if text and text == name then
		hlTipScan:Hide()
		return true
	else
		hlTipScan:Hide()
		return false
	end
end


--==========================
--			Filter
--==========================
-- ToFilters() is called in HotLoot:LOOT_OPENED() and returns TRUE if certain loot criteria are met i.e.
--			
--			if isKindOfLoot(you, want) then
--				return true -- Loots item
--			end
--
local function ToFilters(slot)
	local lootIcon, lootName, lootQuantity, lootQuality, locked = GetLootSlotInfo(slot)
	local lootLink = GetLootSlotLink(slot)
	
	if HotLoot:GetExcludeTable()[lootName] then
		-- Don't Loot
		 HotLoot:Announce(lootLink .. L["ExcludeAnnounce1"])
		return false
	end
	if IsGold(slot) then
		return true
	elseif IsCurrency(slot) then
		return true
	end
	if IsGold(slot) and not HotLoot:GetLootGold() then
		return false
	elseif IsCurrency(slot) and not HotLoot:GetLootCurrency() then
		return false
	end
	if lootLink then
	local _, itemLink, _, itemLevel, _, itemType, itemSubType, itemStackCount, _, _, itemSellPrice = GetItemInfo(lootLink)
	local itemID = GetItemID(itemLink)
	if (HasRoom(1) or CanStack(lootName, itemStackCount, lootQuantity))--[[ and locked == 0 ]]then
			
			if (HotLoot:GetLootDebug() == true) then
				print("---------------")
				print("Slot " .. slot .. ": " .. lootName)
				print("Item type: " .. itemType.."| Item sub type: " .. itemSubType)
			end
			if
				-- Quest
				HotLoot:GetLootQuest() and (itemType == L["Quest"] or ScanTip(slot, L["Quest Item"])) and CheckThreshold("Quest", itemSellPrice, lootQuantity) then 
					return true
			-- Commented out to remove "junk" option
			--elseif
				-- Junk
			--	(itemSubType == L["Junk"]) and HotLoot:GetLootJunk() and CheckThreshold("Junk", itemSellPrice, lootQuantity) then 
			--		return true
			elseif
				-- HotLoot:GetLootPick(
				(IsStealthed()) and (lootQuality ~= 0) and HotLoot:GetLootPick() then 
					return true
			elseif
				-- Cloth
				(itemSubType == L["Cloth"]) and (itemType == L["Trade Goods"]) and HotLoot:GetLootCloth() and CheckThreshold("Cloth", itemSellPrice, lootQuantity) then 
					return true
			elseif
				-- Mining
				(itemSubType == L["Metal & Stone"]) and HotLoot:GetLootMining() and CheckThreshold("Metal & Stone", itemSellPrice, lootQuantity) then 
					return true
			elseif
				-- Gems
				(itemType == L["Gem"]) and HotLoot:GetLootGems() and CheckThreshold("Gem", itemSellPrice, lootQuantity) then 
					return true
			elseif
				-- Herbs
				(itemSubType == L["Herb"]) and HotLoot:GetLootHerbs() and CheckThreshold("Herb", itemSellPrice, lootQuantity) then 
					return true
			elseif
				-- Leather
				(itemSubType == L["Leather"]) and (itemType == L["Trade Goods"]) and HotLoot:GetLootSkinning() and CheckThreshold("Leather", itemSellPrice, lootQuantity) then 
					return true
			elseif
				-- Fishing (-junk)
				IsFishingLoot() and HotLoot:GetLootFishing() and (itemSubType ~= L["Junk"]) then 
					return true
			elseif
				-- enchanting
				HotLoot:GetLootEnchanting() and (itemSubType == L["Enchanting"]) and CheckThreshold("Enchanting", itemSellPrice, lootQuantity) then 
					return true
			
			elseif
				-- GetLootCooking
				HotLoot:GetLootCooking() and (itemSubType == L["Cooking"]) and CheckThreshold("Cooking Ingredient", itemSellPrice, lootQuantity) then 
					return true
			elseif
				-- GetLootRecipes
				HotLoot:GetLootRecipes() and (itemType == L["Recipe"]) then 
					return true
			elseif
				--HotLoot:GetLootPigments(info)
				HotLoot:GetLootPigments() and (string.find(lootName, "Pigment")) then 
					return true
			elseif
				-- Pots
				(itemSubType == L["Potion"]) and HotLoot:GetLootPots() and CheckThreshold("Potion", itemSellPrice, lootQuantity) then 
					if HotLoot:GetPotionType() == "both" then
						return true
					elseif HotLoot:GetPotionType() == "healing" and string.find(lootName, L["Healing"])  then
						return true
					elseif HotLoot:GetPotionType() == "mana" and string.find(lootName, L["Mana"])  then
						return true
					else
						return false
					end
			elseif
				-- Flasks
				(itemSubType == L["Flask"]) and HotLoot:GetLootFlasks() and CheckThreshold("Flask", itemSellPrice, lootQuantity) then 
					return true
			elseif
				-- Elixirs
				(itemSubType == L["Elixir"]) and HotLoot:GetLootElixirs() and CheckThreshold("Elixir", itemSellPrice, lootQuantity) then 
					return true
			elseif
				-- Motes
				(itemSubType == L["Elemental"]) and HotLoot:GetLootElemental() and CheckThreshold("Elemental", itemSellPrice, lootQuantity) then 
					return true
			elseif
				-- MoH
				(itemID == 89112) and (HotLoot:GetLootMoH() == true) then 
					return true	
			elseif
				--lootBotA
				(itemID == 103642) and (HotLoot:GetLootBotA() == true) then 
					return true	
			elseif
				--lootDoEM
				(itemID == 103643) and (HotLoot:GetLootDoEM() == true) then 
					return true	
			elseif
				--lootSC
				(itemID == 103641) and (HotLoot:GetLootSC() == true) then 
					return true
			elseif
				--lootRepMeat
				(itemID == 104265) and (HotLoot:GetLootRepMeat() == true) then 
					return true
			elseif
				--lootRepMeat
				(itemID == 104266) and (HotLoot:GetLootRepMeat() == true) then 
					return true
			elseif
				--lootRepMeat
				(itemID == 104264) and (HotLoot:GetLootRepMeat() == true) then 
					return true
			elseif
				--lootRepMeat
				(itemID == 104257) and (HotLoot:GetLootRepMeat() == true) then 
					return true
			elseif
				--lootRepMeat
				(itemID == 104267) and (HotLoot:GetLootRepMeat() == true) then 
					return true
			elseif
				-- Include List
				HotLoot:GetIncludeTable()[lootName] then 
					return true
			elseif
				-- Poor
				(HotLoot:GetLootPoor() == true) and (lootQuality == 0) and (CheckThreshold("z1Poor", itemSellPrice, lootQuantity)) --[[and (CheckILvl(itemLevel))]] then 
					return true
			elseif
				-- Common
				(HotLoot:GetLootCommon() == true) and (lootQuality == 1) and (CheckThreshold("z2Common", itemSellPrice, lootQuantity)) and (CheckILvl(itemLevel)) then 
					return true
			elseif
				-- Uncommon
				--[[(IsInGroup() == false) and ]](HotLoot:GetLootUncommon() == true) and (lootQuality == 2) and (CheckThreshold("z3Uncommon", itemSellPrice, lootQuantity)) and (CheckILvl(itemLevel)) then 
					return true
			elseif
				-- Rare
				--[[(IsInGroup() == false) and ]](HotLoot:GetLootRare() == true) and (lootQuality == 3) and (CheckThreshold("z4Rare", itemSellPrice, lootQuantity)) and (CheckILvl(itemLevel)) then 
					return true
			elseif
				-- Epic
				--[[(IsInGroup() == false) and ]](HotLoot:GetLootEpic() == true) and (lootQuality == 4) and (CheckThreshold("z5Epic", itemSellPrice, lootQuantity)) and (CheckILvl(itemLevel)) then 
					return true
			elseif
				-- Legendary
				--[[(IsInGroup() == false) and ]](HotLoot:GetLootLegendary() == true) and (lootQuality == 5) and (CheckThreshold("z6Legendary", itemSellPrice, lootQuantity)) and (CheckILvl(itemLevel)) then 
					return true
			end
			
			
	else
		 HotLoot:Announce(L["BagsFull"])
		return false
	end
	else
		return false
	end
end

--==========================
--		CreateRollFrame
--==========================
local rollFrames = {}
local function CreateRollFrame(id, length)
	local frame
end

--#############################
--			Anchor
--#############################
function HotLoot:ToggleAnchor(val)
	if val then
		HotLoot:ShowAnchor()
	else
		HotLoot:HideAnchor()
	end
end

function HotLoot:MMToggleAnchor()
	if HotLoot.mainFrame:IsVisible() then
		HotLoot:SetLootShowAnchor(self, false)
	else
		HotLoot:SetLootShowAnchor(self, true)
	end
end

function HotLoot:ShowAnchor()
	--HotLoot.mainFrame:SetAlpha(1)
	HotLoot.mainFrame:Show()
end

function HotLoot:HideAnchor()
	--HotLoot.mainFrame:SetAlpha(0)
	HotLoot.mainFrame:Hide()
end

--#############################
--		Monitor Refresh
--#############################
function HotLoot:UpdateMonitor()
	local i = 1
	local yOffset
	local xOffset
	local row, column = 0, 0
	if (HotLoot:GetLootGridMode() == true) and (HotLoot:GetLootShowNames() == false) then
		while i <= #icons do
			
			xOffset = column * HotLoot:GetLootIconSize() --0, 32, 64, 96
			yOffset = ((row + 1) * (HotLoot:GetLootIconSize() * HotLoot:GetLootGrowthDirection())) --0, 0, 0, 0, 
			icons[i]:SetPoint("CENTER", HotLoot.mainFrame, "CENTER", xOffset, yOffset+5)
			i = i + 1
			if column < (HotLoot:GetLootGridNumColumns() - 1) then
				column = column + 1
			else 
				row = row + 1
				column = 0
			end
		end
	else
		while i <= #icons do
			if themeSize == "large" then
				yOffset = (i * ((32 + 18) * HotLoot:GetLootGrowthDirection()))
			else
				yOffset = (i * ((HotLoot:GetLootIconSize() + 3) * HotLoot:GetLootGrowthDirection()))
			end
			if HotLoot:GetTextSide() == 0 then
				icons[i]:SetPoint("LEFT", HotLoot.mainFrame, "LEFT", 0, yOffset)
			else
				icons[i]:SetPoint("RIGHT", HotLoot.mainFrame, "RIGHT", 0, yOffset)
			end
			i = i + 1
		end
	end	
end


--#############################
--			Tooltips
--#############################



local function ClearTooltips()
	GameTooltip:Hide()
	--HotLoot:UpdateMonitor()
end

local function ShowTooltip(self)
	if self.item then
		GameTooltip:SetOwner(self, "ANCHOR_CURSOR")
		GameTooltip:SetHyperlink(self.item)
		GameTooltip:Show()
	end
end

local function OnEnter(self)
	self:ShowTooltip()
end

local function OnLeave(self)
	ClearTooltips()
	ResetCursor()
end
local function EButtonClicked(name)
	HotLoot:AddEList(name)
	for i = 1, #icons do
		if icons[i].item == name then
			icons[i].e:Hide()
			break
		end
	end
	 HotLoot:Announce(name..L["AnnounceExcludeAdd"])
	--self:Hide()
	--incButtons[slot]:Hide
	--LootSlot(slot)
end

--************TOOLTIP FOR BUTTON*****************

local function EBOnEnter(frame)
	GameTooltip:SetOwner(frame, "ANCHOR_LEFT")
	GameTooltip:AddLine("HotLoot", 1, .6, 0, false)
	GameTooltip:AddLine(" ", 1, 1, 1, 1, false)
	GameTooltip:AddLine("Click to add item\nto the Exclude List", 1, 1, 0, true)
	GameTooltip:Show()
end

local function EBOnLeave()
	GameTooltip:ClearLines()
	GameTooltip:Hide()
end
--#############################
--		Loot Monitor Icon
--#############################
function HotLoot:addLootIcon(iPath, iName, iLink, iCount)
	local icon = self.createLootIcon(iPath, iName, iLink, iCount)
	icon:Show()
	return icon
end
	
function HotLoot.createLootIcon(iPath, iName, iLink, iCount)
	--Vars
	--local lmIcon = CreateFrame("Frame", iName, lmBackground)
	local lmBackground = CreateFrame("frame", "lmBG")
	local e = CreateFrame("button", "ExButtonFrame", lmBackground)
	local size = HotLoot:GetLootIconSize()
	local texture = lmBackground:CreateTexture(iName.."Icon","OVERLAY")
	local count = lmBackground:CreateFontString(nil, "OVERLAY")
	local name = lmBackground:CreateFontString(nil, "OVERLAY")
	local sellPrice = lmBackground:CreateFontString(nil, "OVERLAY")
	local itemType = lmBackground:CreateFontString(nil, "OVERLAY")
	local item = iLink
	lmIcon = lmBackground
	lmIcon.size = size
	lmIcon.texture = texture
	lmIcon.count = count
	lmIcon.sell = sellPrice
	lmIcon.type = itemType
	lmIcon.name = name
	lmBackground.item = item
	lmBackground.ShowTooltip = ShowTooltip
	if themeSize == "small" then
	--Set Up Frames
	--Icon
	
		
		lmIcon:SetAlpha(HotLoot:GetLootTrans())
		
		lmIcon.texture:SetSize(lmIcon.size, lmIcon.size)
		lmIcon.texture:SetTexture(iPath)
		
		lmIcon.texture:SetTexCoord(0.07,0.93,0.07,0.93)
		
		if HotLoot:GetTextSide() == 0 then
			lmIcon.texture:SetPoint("LEFT", lmIcon, "LEFT", 2, 0)
		else
			lmIcon.texture:SetPoint("RIGHT", lmIcon, "RIGHT", -2, 0)
		end
	--Name
	
		if HotLoot:GetTextSide() == 0 then
			lmIcon.name:SetPoint("LEFT", lmIcon.texture, "RIGHT", 2, 0)
			lmIcon.name:SetJustifyH("LEFT")
		else
			lmIcon.name:SetPoint("RIGHT", lmIcon.texture, "LEFT", -2, 0)
			lmIcon.name:SetJustifyH("RIGHT")
		end
		
		lmIcon.name:SetFont(STANDARD_TEXT_FONT, 9, "OUTLINE")
		
		if iCount == 0 then
			lmIcon.name:SetText(iName)
		else
			lmIcon.name:SetText(iLink)
		end

	--Count
	if HotLoot:GetLootShowQuantities() then
		if HotLoot:GetTextSide() == 0 then
			lmIcon.count:SetPoint("LEFT", lmIcon.name, "RIGHT", 2, 0)
		else
			lmIcon.count:SetPoint("RIGHT", lmIcon.name, "LEFT", -2, 0)
		end
		
		lmIcon.count:SetFont(STANDARD_TEXT_FONT, 9, "OUTLINE")
		
		if iCount > 0 then
			if HotLoot:GetShowTotal() then
				local inBags = InBags(iName, iCount)
				lmIcon.count:SetText("x"..iCount.." ["..inBags.."]")
			else
				lmIcon.count:SetText("x"..iCount)
			end
		end
	else
		lmIcon.count:Hide()
	end
	--BG
		local bgWidth = lmIcon.name:GetStringWidth() + lmIcon.count:GetStringWidth() + size +12
			bgWidth = max(bgWidth, tonumber(HotLoot:GetMinWidth()))
		lmBackground:SetSize(bgWidth, lmIcon.size+4)
	
		lmBackground:SetBackdrop({bgFile = bgFileCurrent, 
			edgeFile = edgeFileCurrent, 
			tile = tileCurrent, tileSize = tileSizeCurrent, edgeSize = edgeSizeCurrent, 
			insets = insetsCurrent})
		
		local r, g, b, a = HotLoot:GetThemeColorSelect()
		local br, bg, bb, ba = HotLoot:GetThemeColorBorderSelect()
		if HotLoot:GetColorQual() and iCount > 0 then
			local quality = select(3, GetItemInfo(iLink))
			if quality then
				br, bg, bb = GetItemQualityColor(quality)
			end
			lmBackground:SetBackdropColor(r, g, b, a)
			lmBackground:SetBackdropBorderColor(br, bg, bb, 1)
		else
			lmBackground:SetBackdropColor(r, g, b, a)
			lmBackground:SetBackdropBorderColor(br, bg, bb, ba)
		end
		
		lmBackground:SetScript("OnEnter", OnEnter)
		lmBackground:SetScript("OnLeave", OnLeave)
	
		if HotLoot:GetShowAnimation() then
			local AnimationGroup = lmBackground:CreateAnimationGroup()
			local animation1 = AnimationGroup:CreateAnimation("Translation")
		
			animation1:SetDuration(1.5)
			animation1:SetSmoothing("IN")
			if HotLoot:GetLootGrowthDirection() == 1 then
				animation1:SetOffset(0, 200*HotLoot:GetFSpeed())
			else
				animation1:SetOffset(0, -200*HotLoot:GetFSpeed())
			end
			lmBackground.a = AnimationGroup
		end
	e:SetHeight(lmBackground:GetHeight() - 2)
	elseif themeSize == "medium" then
	
	elseif themeSize == "large" then
		local glow = lmBackground:CreateTexture(iName.."Glow","BACKGROUND")
		lmBackground.glow = glow
		lmBackground.glow:SetTexture("Interface\\AchievementFrame\\UI-Achievement-Alert-Glow")
        lmBackground.glow:SetTexCoord(0, 0.78125, 0, 0.66796875)
		lmBackground.glow:SetPoint("CENTER", lmBackground, "CENTER", 0 ,0)
		lmBackground.glow:SetAlpha(0)
		
		lmBackground.glow:SetBlendMode("ADD")
		lmBackground.glow:Show()
		
		local shine = lmBackground:CreateTexture(iName.."Shine","OVERLAY")
		lmBackground.shine = shine
		lmBackground.shine:SetTexture("Interface\\AchievementFrame\\UI-Achievement-Alert-Glow")
        lmBackground.shine:SetTexCoord(0.78125, 0.912109375, 0, 0.28125)
		lmBackground.shine:SetPoint("BOTTOMLEFT", 0, 0)
		lmBackground.shine:SetAlpha(0)
		lmBackground.shine:SetSize(47,52)
		lmBackground.shine:SetBlendMode("ADD")
		lmBackground.shine:Show()
		
		--Set Up Frames
	--Icon
		
		
		lmIcon:SetAlpha(HotLoot:GetLootTrans())
		
		lmIcon.texture:SetSize(32, 32)
		lmIcon.texture:SetTexture(iPath)
		
		
		if HotLoot:GetTextSide() == 0 then
			lmIcon.texture:SetPoint("LEFT", lmIcon, "LEFT", 8, 0)
		else
			lmIcon.texture:SetPoint("RIGHT", lmIcon, "RIGHT", -8, 0)
		end
	--Name
	
		if HotLoot:GetTextSide() == 0 then
			lmIcon.name:SetPoint("TOPLEFT", lmIcon.texture, "TOPRIGHT", 2, 0)
			lmIcon.name:SetJustifyH("LEFT")
		else
			lmIcon.name:SetPoint("TOPRIGHT", lmIcon.texture, "TOPLEFT", -2, 0)
			lmIcon.name:SetJustifyH("RIGHT")
		end
		
		lmIcon.name:SetFont(STANDARD_TEXT_FONT, 9, "OUTLINE")
		
		if iCount == 0 then
			lmIcon.name:SetText(iName)
		else
			lmIcon.name:SetText(iLink)
		end

	--Count
	if HotLoot:GetLootShowQuantities() then
		if HotLoot:GetTextSide() == 0 then
			lmIcon.count:SetPoint("BOTTOMRIGHT", lmBackground, "BOTTOMRIGHT", -6, 8)
		else
			lmIcon.count:SetPoint("BOTTOMLEFT", lmBackground, "BOTTOMLEFT", 6, 8)
		end
		
		lmIcon.count:SetFont(STANDARD_TEXT_FONT, 7, "OUTLINE")
		
		if iCount > 0 then
			if HotLoot:GetShowTotal() then
				local inBags = InBags(iName, iCount)
				lmIcon.count:SetText("x"..iCount.." ["..inBags.."]")
			else
				lmIcon.count:SetText("x"..iCount)
			end
		end
	else
		lmIcon.count:Hide()
	end
	--SellPrice
	if HotLoot:GetShowSellPrice() and iCount > 0 then
		--lmIcon.sell
		local sellPriceText = select(11,GetItemInfo(iLink))
		if HotLoot:GetTextSide() == 0 then
			lmIcon.sell:SetPoint("BOTTOMLEFT", lmIcon.texture, "BOTTOMRIGHT", 2, 0)
		else
			lmIcon.sell:SetPoint("BOTTOMRIGHT", lmIcon.texture, "BOTTOMLEFT", -2, 0)
		end
		
		lmIcon.sell:SetFont(STANDARD_TEXT_FONT, 7, "OUTLINE")
		
		if sellPriceText then
			lmIcon.sell:SetText(GetCoinTextureString(sellPriceText))
		end
	else
		lmIcon.sell:Hide()
	end
	
	--ItemType
	if HotLoot:GetShowItemType() and iCount > 0  then
		--lmIcon.type
		local itemTypeText = select(6,GetItemInfo(iLink))
		local itemTypeText2 = select(7,GetItemInfo(iLink))
		if HotLoot:GetTextSide() == 0 then
			lmIcon.type:SetPoint("LEFT", lmIcon.texture, "RIGHT", 2, 0)
		else
			lmIcon.type:SetPoint("RIGHT", lmIcon.texture, "LEFT", -2, 0)
		end
		
		lmIcon.type:SetFont(STANDARD_TEXT_FONT, 7, "OUTLINE")
		if itemTypeText then
			lmIcon.type:SetText(itemTypeText..": "..itemTypeText2)
		end
	else
		lmIcon.type:Hide()
	end
	--BG
		local bgWidth = lmIcon.name:GetStringWidth() + lmIcon.count:GetStringWidth() + 50
			bgWidth = max(bgWidth, tonumber(HotLoot:GetMinWidth()))
		lmBackground:SetSize(bgWidth, 50)
	
		lmBackground:SetBackdrop({bgFile = bgFileCurrent, 
			edgeFile = edgeFileCurrent, 
			tile = tileCurrent, tileSize = tileSizeCurrent, edgeSize = edgeSizeCurrent, 
			insets = insetsCurrent})
		local r, g, b, a
		if HotLoot:GetThemeSelect() == "toast" then 
			r, g, b, a = 0,0,0,0.8
		else
			r, g, b, a = 1,1,1,1 --HotLoot:GetThemeColorSelect()
		end
		local br, bg, bb, ba = 1,1,1,1 --HotLoot:GetThemeColorBorderSelect()
		if HotLoot:GetColorQual() and iCount > 0 then
			local quality = select(3, GetItemInfo(iLink))
			if quality then
				br, bg, bb = GetItemQualityColor(quality)
			end
			lmBackground:SetBackdropColor(r, g, b, a)
			lmBackground:SetBackdropBorderColor(br, bg, bb, 1)
		else
			lmBackground:SetBackdropColor(r, g, b, a)
			lmBackground:SetBackdropBorderColor(br, bg, bb, ba)
		end
		
		lmBackground:SetScript("OnEnter", OnEnter)
		lmBackground:SetScript("OnLeave", OnLeave)
		
		lmBackground.glow:SetSize(bgWidth + 50,100)
		e:SetHeight(lmBackground:GetHeight() - 10)
		if HotLoot:GetShowAnimation() then
			local AnimationGroup = lmBackground:CreateAnimationGroup()
			local animation1 = AnimationGroup:CreateAnimation("Translation")
			local GlowAnimationGroup = lmBackground.glow:CreateAnimationGroup()
			local ShineAnimationGroup = lmBackground.shine:CreateAnimationGroup()
			local glowAnimIn = GlowAnimationGroup:CreateAnimation("Alpha")
			local glowAnimOut = GlowAnimationGroup:CreateAnimation("Alpha")
			local shineAnimIn = ShineAnimationGroup:CreateAnimation("Alpha")
			local shineAnimT = ShineAnimationGroup:CreateAnimation("Translation")
			local shineAnimOut = ShineAnimationGroup:CreateAnimation("Alpha")
			glowAnimIn:SetDuration(0.2)
			glowAnimOut:SetDuration(0.5)
			
			glowAnimIn:SetChange(0.7)
			glowAnimOut:SetChange(-1)
			
			glowAnimIn:SetOrder(1)
			glowAnimOut:SetOrder(2)
			
			shineAnimIn:SetOrder(1)
			shineAnimT:SetOrder(2)
			shineAnimOut:SetOrder(2)
			
			shineAnimIn:SetChange(1)
			shineAnimOut:SetChange(-1)
			shineAnimT:SetOffset(200,0)
			
			shineAnimOut:SetStartDelay(0)
			
			shineAnimT:SetDuration(0.5)
			shineAnimIn:SetDuration(0.2)
			shineAnimOut:SetDuration(0.4)
			
			animation1:SetDuration(1.5)
			animation1:SetSmoothing("IN")
			if HotLoot:GetLootGrowthDirection() == 1 then
				animation1:SetOffset(0, 100*HotLoot:GetFSpeed())
			else
				animation1:SetOffset(0, -100*HotLoot:GetFSpeed())
			end
			lmBackground.a = AnimationGroup
			lmBackground.glow.a = GlowAnimationGroup
			lmBackground.shine.a = ShineAnimationGroup
			lmBackground.shine.a:Play()
			lmBackground.glow.a:Play()
		end
	end
	if iCount > 0  and HotLoot:GetExcludeButton() then
		if HotLoot:GetTextSide() == 0 then
			e:SetPoint("RIGHT", lmBackground, "LEFT", -1, 0)
		else
			e:SetPoint("LEFT", lmBackground, "RIGHT", 1, 0)
		end
		e:SetWidth(5)
		
		e.texture = e:CreateTexture("eTexture", "BACKGROUND")
		e.texture:SetTexture(1, 0, 0, 0.7)
		e.texture:SetAllPoints(e)
		e:EnableMouse(true)
		e:RegisterForClicks("LeftButtonUp")
		e:SetScript("OnEnter", function(self) EBOnEnter(lmBackground) end)
		e:SetScript("OnLeave", function(self) EBOnLeave() end)
		e:SetScript("OnClick", function(self) EButtonClicked(iLink) end)
		lmBackground.e = e
	end
	return lmBackground
end

--#############################
--			Loot Buttons
--#############################

local function IButtonClicked(slot)
	incButtons[slot]:Hide()
	local iLink = GetLootSlotLink(slot)
	HotLoot:AddIList(iLink)
	LootSlot(slot)
end

--************TOOLTIP FOR BUTTON*****************

local function IBOnEnter(slot)
	GameTooltip:SetOwner(_G["IncButton"..slot], "ANCHOR_CURSOR")
	GameTooltip:AddLine("HotLoot", 1, .6, 0, false)
	GameTooltip:AddLine(" ", 1, 1, 1, 1, false)
	GameTooltip:AddLine("Click to add item\nto the Include List", 1, 1, 0, true)
	GameTooltip:Show()
end

local function IBOnLeave()
	GameTooltip:ClearLines()
	GameTooltip:Hide()
end

function HotLoot:CreateILootButton(slot)
	local i = CreateFrame("button", "IncButton"..slot, _G["LootFrame"])
	i:SetWidth(8)
	i:SetHeight(30)
	--[[
	if (IsAddOnLoaded("XLoot Frame")) then
		
		i:SetPoint("RIGHT", _G["XLootFrameButton"..slot], "LEFT", -10, 0)
		i:SetPoint("RIGHT", _G["XLootFrameButton"..slot], "LEFT", -10, 0)
	elseif (IsAddOnLoaded("ElvUI")) then
		i:SetPoint("RIGHT", _G["ElvLootSlot"..slot], "LEFT", -10, 0)
		i:SetPoint("RIGHT", _G["ElvLootSlot"..slot], "LEFT", -10, 0)
	else
	]]
		i:SetPoint("RIGHT", _G["LootButton"..slot], "LEFT", -10, 0)
	--end
	
	i.texture = i:CreateTexture("iTexture"..slot )
	i.texture:SetTexture(0, 1, 0, 0.7)
	i.texture:SetAllPoints(i)
	i:EnableMouse(true)
	i:RegisterForClicks("LeftButtonUp")
	i:SetScript("OnEnter", function(self) IBOnEnter(slot) end)
	i:SetScript("OnLeave", function(self) IBOnLeave() end)
	i:SetScript("OnClick", function(self) IButtonClicked(slot) end)
	
	return i
end

--#############################
--			Fade Items
--#############################

function hlFadeItems()
	--====================
	-- 	   ElvUI Fix
	--====================
	if closeEL == 1 and _G["ElvLootFrame"] then
		_G["ElvLootFrame"]:Hide()
		closeEL = 0
	end
	--====================
	-- Main Fade Section
	--====================
	local iframe, alpha, fDelay, iDelay, sDelay, fSpeed
	iDelay = HotLoot:GetIDelay()
	sDelay = HotLoot:GetSDelay()
	fSpeed = HotLoot:GetFSpeed() * 0.01
	if (isFirst == 0) then
		--isFirst = 0
		fDelay = iDelay -- 5
	else
		fDelay = sDelay -- 1
	end
	if (icons[#icons] == nil) then
		isFirst = 0
	end
	if (icons[#icons] ~= nil) and (tStart < (GetTime() - fDelay)) then
		iframe = icons[#icons]
		alpha = iframe:GetAlpha()
		if (alpha == 1) then
			
		end
		if (alpha > 0) then 
			if HotLoot:GetShowAnimation() and iframe.a then
				iframe.a:Play()
			end
			iframe:SetAlpha(alpha - fSpeed) -- fSpeed = 0.05
		elseif (alpha <= 0) then 
			iframe:Hide()
			table.remove(icons)
			--HotLoot:dBug("#icons", #icons)
			ResetTimer()
			isFirst = isFirst + 1
			--HotLoot:dBug("isFirst", isFirst)
			--HotLoot:dBug("fDelay", fDelay)
		end
	end
end
--==========================
--			EVENTS
--==========================

function HotLoot:LOOT_OPENED()
	if HotLoot:GetLootEnabled() then
	
	mFocus = GetMouseFocus():GetName()
	skinModeTrigger = 0
		for i=1, GetNumLootItems() do
			local _, lootName = GetLootSlotInfo(i)
			--table.insert(lootSlots, HotLoot:CreatLootSlot(i))
			if HotLoot:GetIncludeButton() and not HotLoot:GetIncludeTable()[lootName] then
				incButtons[i] = HotLoot:CreateILootButton(i)
				--HotLoot:dBug(incButtons[i])
			end
			if ToFilters(i) then
				HotLoot:dBug("Looted: true")
				--local lootIcon, lootName, lootQuantity, lootQuality, locked = GetLootSlotInfo(i)
				--Toast:Spawn("Loot",lootName, lootIcon )
					local lootIcon, lootName, lootQuantity, lootQuality, locked = GetLootSlotInfo(i)
					local itemLink = GetLootSlotLink(i)
				--HotLoot:AddToCount(lootName, lootQuantity)
				if (HotLoot:GetLootEnableMonitor() == true) then
					if IsGold(i) then
						lootName = GetCoinTextureString(HotLoot:ToCopper(lootName))
					end
					local itoadd = HotLoot:addLootIcon(lootIcon, lootName, itemLink, lootQuantity)
					table.insert(icons, 1, itoadd)
					ResetTimer()
					itoadd = nil
			
					HotLoot:UpdateMonitor()
				end
				if IsAddOnLoaded("HotLoot_LootHistory") then
					HotLoot:AddToLootHistory(i, lootName, lootQuantity)
				end
				if IsAddOnLoaded("HotLoot_LootNotification") then
					HotLoot:CheckForLootNotification(lootName, itemLink)
				end
				
				LootSlot(i)
			else
				HotLoot:dBug("Looted: false")
				ToSkin(i)
				
			end
		
		end
		if mFocus == nil then
			mFocus = "nil"
		end
		--HotLoot:dBug("mFocus", mFocus)
		if HotLoot:GetLootClose() and not CloseKeyDown() and string.find(mFocus, "WorldFrame") then		
			closeEL = 1
			CloseLoot()
		end
	end
end

function HotLoot:LOOT_CLOSED()

	if incButtons then
		for i = 1, #incButtons do
			incButtons[i]:Hide()
		end
	end
	--			lootSlots+
	
end

function HotLoot:LOOT_SLOT_CLEARED(...)
	local event, slot = ...

	if incButtons[slot] then
		incButtons[slot]:Hide()
	end
	

end

function HotLoot:BAG_UPDATE(...)
	if skinModeTrigger == 1 then
		DeleteLeftovers()
	end
end

function HotLoot:MERCHANT_SHOW(...)
	if HotLoot:GetLootEnabled() and HotLoot:GetSellGreys() then
	HotLoot:dBug("Merchant Window Opened")
		HotLoot:SellGreys()
	end
end

function HotLoot:PLAYER_REGEN_DISABLED()
	-- IN COMBAT
	--clear loot history (if enabled)
	if IsAddOnLoaded("HotLoot_LootHistory") and HotLoot:GetLootHistoryReset() == "combat" then
		HotLoot:ClearLootHistory()
	end
end

function HotLoot:PLAYER_REGEN_ENABLED()
	-- OUT OF COMBAT
	if IsAddOnLoaded("HotLoot_Fishing") and HotLoot.clearBindings then
		
		ClearOverrideBindings()
		HotLoot.clearBindings = false
	end
end

function HotLoot:START_LOOT_ROLL(...)
	local event, rollID, rollTime = ...
	if HotLoot:GetLootEnabled() and IsAddOnLoaded("HotLoot_Group") then
		HotLoot:StartRoll(rollID, rollTime)
	end
end
function HotLoot:CONFIRM_LOOT_ROLL(...)
	local event, rollID, rollType = ...
	if IsAddOnLoaded("HotLoot_Group") and HotLoot:GetGroupEnable() then
	local texture, name, count, quality = GetLootRollItemInfo(rollID)
	if quality == 2 and GetGroupRollUncommon() ~= -1 then
		ConfirmLootRoll(rollID ,rollType)
	elseif quality == 3 and GetGroupRollRare() ~= -1 then
		ConfirmLootRoll(rollID ,rollType)
	elseif quality == 4 and GetGroupRollEpic() ~= -1 then
		ConfirmLootRoll(rollID ,rollType)
	end
	end
	--ConfirmLootRoll(rollID ,rollType)
end
function HotLoot:CONFIRM_DISENCHANT_ROLL(...)
	local event, rollID, rollType = ...
	if IsAddOnLoaded("HotLoot_Group") and HotLoot:GetGroupEnable() then
	local texture, name, count, quality = GetLootRollItemInfo(rollID)
	if quality == 2 and GetGroupRollUncommon() ~= -1 then
		ConfirmLootRoll(rollID ,rollType)
	elseif quality == 3 and GetGroupRollRare() ~= -1 then
		ConfirmLootRoll(rollID ,rollType)
	elseif quality == 4 and GetGroupRollEpic() ~= -1 then
		ConfirmLootRoll(rollID ,rollType)
	end
	end
end
function HotLoot:ADDON_LOADED(...)
	local event, arg1 = ...
	
end
