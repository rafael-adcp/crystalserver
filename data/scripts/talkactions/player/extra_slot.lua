local welcome_items = TalkAction("!welcome_items")

function welcome_items.onSay(player, words, param)
	
	
	player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
	player:addItem(19369, 1)  -- eye of the storm, infinite tp
	player:addItem(43740, 1)  -- scarab ocarina
	player:addItem(34017, 1)  -- lit torch
	player:addItem(43863, 1)  -- conch shell horn
	player:addItem(28493, 1) -- bone fiddle
	player:addItem(25976, 1) -- starlight vial
	player:addItem(25975, 1) -- moon mirror
	player:addItem(25977, 1) -- sun catcher
	player:addItem(9597, 3) -- canivete rosa
	
	
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, string.format("There you go, hope those make your journey easier!", totalCost))
	
	
	return true
end

welcome_items:groupType("normal")
welcome_items:register()
