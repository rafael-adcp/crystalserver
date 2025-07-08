-- Summary
-- Chances: 50% for high/low/odd/even, 16.67% for choosing a number.
-- Payouts: Lower than fair odds.
-- Result: The system is not "fair" (in the sense of no house edge), but this is typical for casino games.
-- If you want a truly fair game (no house edge), set payouts to 2x 
local internalNpcName = "Cassino"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 0
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 132,
	lookHead = 60,
	lookBody = 22,
	lookLegs = 24,
	lookFeet = 32,
	lookAddons = 2,
}

npcConfig.flags = {
	floorchange = false,
}

local config = {
	bet = {
		min = 10000, -- gold coins
		max = 10000000000,
		win = 180, -- X% high/low
		winNum = 500, -- X% numbers
	},
	playerPosition = Position(32352, 32226, 7), -- NpcPos(x-2) player must stay on this position to talk with npc
	dicerCounter = Position(32352, 32225, 7), --	NpcPos(x-1, y-1) 	counter position
	diePos = Position(32354, 32225, 7), --NpcPos(y-1)
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

local function getCoinValue(id)
	if id == 3043 then
		return 10000
	elseif id == 3035 then
		return 100
	elseif id == 3031 then
		return 1
	end
	return 0
end

local function getBetValue()
	local value = 0
	local tile = Tile(config.dicerCounter)
	if tile then
		local items = tile:getItems()
		if not items or #items == 0 then
			return 0
		end

		local tempMoney = {}
		for _, item in pairs(items) do
			if table.contains({ 3043, 3035, 3031 }, item:getId()) then
				value = value + getCoinValue(item:getId()) * item:getCount()
				tempMoney[#tempMoney + 1] = item
			end
		end

		if value >= config.bet.min and value <= config.bet.max then -- valid bet
			for _, item in pairs(tempMoney) do
				item:remove()
			end
			return value
		end
	end
	return nil
end

local function createMoney(money)
	local table = {}
	local currentMoney = money
	local crystals = math.floor(currentMoney / 10000)
	currentMoney = currentMoney - crystals * 10000
	while crystals > 0 do
		local count = math.min(100, crystals)
		table[#table + 1] = { 3043, count }
		crystals = crystals - count
	end

	local platinums = math.floor(currentMoney / 100)
	if platinums ~= 0 then
		table[#table + 1] = { 3035, platinums }
		currentMoney = currentMoney - platinums * 100
	end

	if currentMoney ~= 0 then
		table[#table + 1] = { 3031, currentMoney }
	end
	return table
end

local function greetCallback(npc, creature)
	local player = Player(creature)
	local playerId = player:getId()

	if player:getPosition() ~= config.playerPosition then
		npcHandler:say("If you want to play with me please come near me.", npc, creature)
		npcHandler:removeInteraction(npc, creature)
		return false
	end
	return true
end

local function sayToPlayerAndHandler(npc, phrase, creature, talktype, pos)
	npc:say(phrase, talktype or TALKTYPE_SAY, false, true, pos or npc:getPosition())
	npcHandler:say(phrase, npc, creature)
end

local function handleWin(npc, creature, amount)
	local phrase = "You won! Here's your " .. amount .. " gold coins."
	sayToPlayerAndHandler(npc, phrase, creature)
	config.dicerCounter:sendMagicEffect(math.random(29, 31))
	for _, coin in pairs(createMoney(amount)) do
		Game.createItem(coin[1], coin[2], config.dicerCounter)
	end
end

local function handleLoss(npc, creature, bet)
	local phrase = "You have lost your " .. bet .. " gold coins."
	sayToPlayerAndHandler(npc, phrase, creature)
end

local function checkBetResult(npc, creature, bet, number, message)
	local win = false
	local payout = config.bet.win

	if table.contains({ "low", "l" }, message) then
		win = table.contains({ 1, 2, 3 }, number)
	elseif table.contains({ "high", "h" }, message) then
		win = table.contains({ 4, 5, 6 }, number)
	elseif table.contains({ "odd", "impar" }, message) then
		win = table.contains({ 1, 3, 5 }, number)
	elseif table.contains({ "par", "even" }, message) then
		win = table.contains({ 2, 4, 6 }, number)
	elseif table.contains({ "1", "2", "3", "4", "5", "6" }, message) then
		win = number == tonumber(message)
		payout = config.bet.winNum
	end

	if win then
		local wonMoney = math.ceil(bet * (payout / 100))
		handleWin(npc, creature, wonMoney)
	else
		handleLoss(npc, creature, bet)
	end
end

local function creatureSayCallback(npc, creature, type, message)
	local player = Player(creature)
	local playerId = player:getId()

	if not npcHandler:checkInteraction(npc, creature) then
		return false
	end

	if player:getPosition() ~= config.playerPosition then
		npcHandler:unGreet(npc, creature)
		return false
	end
	if table.contains({ "low", "high", "h", "l", "1", "2", "3", "4", "5", "6", "odd", "impar", "par", "even" }, message) then
		local bet = getBetValue()
		if not bet then
			sayToPlayerAndHandler(npc, "Your bet is lower than the min {" .. config.bet.min .. "}gps or higher than the max {" .. config.bet.max .. "}gps bet.", creature)
			npcHandler:setTopic(playerId, 0)
			return true
		end
		player:say(message, TALKTYPE_SAY, false, true, player:getPosition())
		local number = math.random(6)

		local dadimid = { 5792, 5793, 5794, 5795, 5796, 5797 }
		local daddd = 0
		local haveDie = false
		for x = 1, 6 do
			daddd = Tile(config.diePos):getItemById(dadimid[x])
			if daddd then
				haveDie = true
				break
			end
		end
		if haveDie then
			daddd:transform(dadimid[number])
		else
			Game.createItem((5791 + number), 1, config.diePos)
		end
		local diceRoll = npc:getName() .. " rolled a " .. number .. "."
		sayToPlayerAndHandler(npc, diceRoll, creature)

		checkBetResult(npc, creature, bet, number, message)
	end
	return true
end

local function creatureMoveCallback(npc, player, fromPosition, toPosition)
	local tile = Tile(config.playerPosition)
	if tile then
		local playerTile = tile:getTopCreature()
		if not playerTile then
			if npcHandler:checkInteraction(npc, player) then
				npcHandler:removeInteraction(npc, player)
			end
		end
	end
	return true
end

npcHandler:setMessage(MESSAGE_GREET, 
string.format(
	"Welcome to the Cassino!\n\n" ..
	"To play, please follow these steps:\n" ..
	"1. Stand on the depot near me.\n" ..
	"2. Place your bet (coins) **on the tile directly in front of you (on top of the depot)**. Only gold, platinum, or crystal coins are accepted.\n" ..
	"3. Minimum bet: %s gold. Maximum bet: %s gold.\n" ..
	"4. Say one of the following to place your bet:\n" ..
	"   - {HIGH} or {H}: Bet on 4, 5, or 6 (payout %d%%)\n" ..
	"   - {LOW} or {L}: Bet on 1, 2, or 3 (payout %d%%)\n" ..
	"   - {ODD} or {IMPAR}: Bet on 1, 3, or 5 (payout %d%%)\n" ..
	"   - {EVEN} or {PAR}: Bet on 2, 4, or 6 (payout %d%%)\n" ..
	"   - Or say a number (1-6) to bet on a specific number (payout %d%%)\n\n" ..
	"If you win, your prize will appear on the counter tile. Good luck!",
	config.bet.min,
	config.bet.max,
	config.bet.win,
	config.bet.win,
	config.bet.win,
	config.bet.win,
	config.bet.winNum
))
npcHandler:setMessage(MESSAGE_FAREWELL, "Good bye.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Good bye.")

npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:setCallback(CALLBACK_ON_MOVE, creatureMoveCallback)

npcHandler:addModule(FocusModule:new(), npcConfig.name, true, true, true)

-- npcType registering the npcConfig table
npcType:register(npcConfig)