local internalNpcName = "Food Seller"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 104,
}

npcConfig.flags = {
	floorchange = false,
}

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)

npcType.onThink = function(npc, interval)
	npcHandler:onThink(npc, interval)
end

npcType.onAppear = function(npc, creature)
	npcHandler:onAppear(npc, creature)
end

npcType.onDisappear = function(npc, creature)
	npcHandler:onDisappear(npc, creature)
end

npcType.onMove = function(npc, creature, fromPosition, toPosition)
	npcHandler:onMove(npc, creature, fromPosition, toPosition)
end

npcType.onSay = function(npc, creature, type, message)
	npcHandler:onSay(npc, creature, type, message)
end

npcType.onCloseChannel = function(npc, creature)
	npcHandler:onCloseChannel(npc, creature)
end

npcHandler:addModule(FocusModule:new(), npcConfig.name, true, true, true)

npcConfig.shop = {
-- food npc de house
{ itemName = "roasted wyvern wings", clientId = 29408, buy = 15000},
{ itemName = "carrot pie" , clientId = 29409, buy = 15000},
{ itemName = "tropical marinated tiger", clientId = 29410, buy = 15000},
{ itemName = "delicatessen salad" , clientId = 29411, buy = 15000},
{ itemName = "chilli con carniphila", clientId = 29412, buy = 15000},
{ itemName = "svargrond salmon filet", clientId = 29413, buy = 15000},
{ itemName = "carrion casserole" , clientId = 29414, buy = 15000},
{ itemName = "consecrated beef" , clientId = 29415, buy = 15000},
{ itemName = "overcooked noodle" , clientId = 29416, buy = 15000}, 
	

-- other useful foods
{  itemName="demonic candy ball", clientid = 11587, buy = 500000},
{  itemName="sweet mangonaise elixir", clientid = 11588, buy = 500000},
{  itemName="carrot cake", clientid = 9087, buy = 500000},
{  itemName="coconut shrimp bake", clientid = 11584, buy = 500000},
{  itemName="hydra tongue salad", clientid = 9080, buy = 500000},
{  itemName="northern fishburger", clientid = 9088, buy = 500000},
{  itemName="pot of blackjack", clientid = 11586, buy = 500000},
{  itemName="roasted dragon wings", clientid = 9081, buy = 500000},
{  itemName="tropical fried terrorbird", clientid = 9082, buy = 500000},
{  itemName="veggie casserole", clientid = 9084, buy = 500000},
{  itemName="banana chocolate shake", clientid = 9083, buy = 1000000},
{  itemName="blessed steak", clientid = 9086, buy = 1000000},
{  itemName="filled jalapeno peppers", clientid = 9085, buy = 1000000},
{  itemName="rotworm stew", clientid = 9079, buy = 1000000},


	
}

-- On buy npc shop message
npcType.onBuyItem = function(npc, player, itemId, subType, amount, ignore, inBackpacks, totalCost)
	npc:sellItem(player, itemId, amount, subType, 0, ignore, inBackpacks)
end
-- On sell npc shop message
npcType.onSellItem = function(npc, player, itemId, subtype, amount, ignore, name, totalCost)
	player:sendTextMessage(MESSAGE_TRADE, string.format("Sold %ix %s for %i gold.", amount, name, totalCost))
end
-- On check npc shop message (look item)
npcType.onCheckItem = function(npc, player, clientId, subType) end

npcType:register(npcConfig)
