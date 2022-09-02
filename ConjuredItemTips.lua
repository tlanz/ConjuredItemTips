local addonName = 'ConjuredItemTips'

local ConjuredItemTips = LibStub('AceAddon-3.0'):NewAddon(addonName, 'AceConsole-3.0', 'AceEvent-3.0')

local conjuredItemsLookup = {
	-- Conjure Food
	[587] = { minLevel = 1, itemID = 5349 },		-- Conjure Food, Rank 1 (Conjured Muffin)
	[597] = { minLevel = 5, itemID = 1113 }, 		-- Conjure Food, Rank 2 (Conjured Bread)
	[990] = { minLevel = 15, itemID = 1114 }, 		-- Conjure Food, Rank 3 (Conjured Rye)
	[6129] = { minLevel = 25, itemID = 1487 }, 		-- Conjure Food, Rank 4 (Conjured Pumpernickel)
	[10144] = { minLevel = 35, itemID = 8075 }, 	-- Conjure Food, Rank 5 (Conjured Sourdough)
	[10145] = { minLevel = 45, itemID = 8076 }, 	-- Conjure Food, Rank 6 (Conjured Sweet Roll)
	[28612] = { minLevel = 55, itemID = 22895 }, 	-- Conjure Food, Rank 7 (Conjured Cinnamon Roll)
	[33717] = { minLevel = 65, itemID = 33817 }, 	-- Conjure Food, Rank 8 (Conjured Croissant)
	[43987] = { minLevel = 65, itemID = 34062 }, 	-- Ritual of Refreshment (Mana [Manna] Biscuits)
	-- Conjure Water
	[5504] = { minLevel = 1, itemID = 5350 }, 		-- Conjure Water, Rank 1 (Conjured Water)
	[5505] = { minLevel = 5, itemID = 2288 }, 		-- Conjure Water, Rank 2 (Conjured Fresh Water)
	[5506] = { minLevel = 15, itemID = 2136 }, 		-- Conjure Water, Rank 3 (Conjured Purified Water)
	[6127] = { minLevel = 25, itemID = 3772 }, 		-- Conjure Water, Rank 4 (Conjured Spring Water)
	[10138] = { minLevel = 35, itemID = 8077 }, 	-- Conjure Water, Rank 5 (Conjured Mineral Water)
	[10139] = { minLevel = 45, itemID = 8078 }, 	-- Conjure Water, Rank 6 (Conjured Sparkling Water)
	[10140] = { minLevel = 55, itemID = 8079 }, 	-- Conjure Water, Rank 7 (Conjured Crystal Water)
	[37420] = { minLevel = 60, itemID = 30073 }, 	-- Conjure Water, Rank 8 (Conjured Mountain Spring Water)
	[27090] = { minLevel = 65, itemID = 22018 }, 	-- Conjure Water, Rank 9 (Conjured Glacier Water)
	-- Conjure Mana Stones
	[759] = { minLevel = 28, itemID = 5514 }, 		-- Conjure Mana Agate
	[3552] = { minLevel = 38, itemID = 5513 }, 		-- Conjure Mana Jade
	[10053] = { minLevel = 48, itemID = 8007 }, 	-- Conjure Mana Citrine
	[10054] = { minLevel = 58, itemID = 8008 }, 	-- Conjure Mana Ruby
	[27101] = { minLevel = 68, itemID = 22044 }, 	-- Conjure Mana Emerald
}

function ConjuredItemTips:OnInitialize()
	GameTooltip:HookScript("OnTooltipSetSpell", function(tt)

		local _, spellID = GameTooltip:GetSpell();
		local spell = conjuredItemsLookup[spellID]

		if spell ~= nil then
			_, itemLink = GetItemInfo(spell.itemID)
			
			if itemLink ~= nil then 
				tt:AddLine('Conjured Item Name: ' .. itemLink, 0.2, 1.0, 0.2)
			end
			
			tt:AddLine('Usable at Level ' .. tostring(spell.minLevel), 0.2, 1.0, 0.2)
		end
	end)
end