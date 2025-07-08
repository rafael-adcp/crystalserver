local eyeOfTheStorm = Action()

local exhaustion_key = "eye-of-the-storm-cooldown"
local exhaustion_cooldown_in_seconds = 5
local teleport_price = 50000

function eyeOfTheStorm.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	-- Cooldown
	local usedelay = 5
    if player:hasExhaustion(exhaustion_key) then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You need to wait before using it again.")
		return true
	end

	-- Add more items or remove them (according to your preferences)
	local places = {
        
        { city_name = "Thais" },
        { city_name = "Venore" },
        
        { city_name = "Ab'Dendriel" },
        { city_name = "Ankrahmun" },
        { city_name = "Carlin" },
        { city_name = "Darashia" },
        { city_name = "Edron" },
        { city_name = "Farmine" },
        { city_name = "Feyrist" },
        { city_name = "Gray Beach" },
        { city_name = "Issavi" },
        { city_name = "Kazordoon" },
        { city_name = "Krailos" },
        { city_name = "Liberty Bay" },
        { city_name = "Port Hope" },
        { city_name = "Rathleton" },
        { city_name = "Roshamuul" },
        { city_name = "Svargrond" },
        { city_name = "Yalahar" },
	}

    

	-- Ventana modal
	local window = ModalWindow({
		title = "Infinite Teleport",
		message = "Select the city you want to teleport to.",
	})

    -- Check if player has a house
    local targetHouse = player:getHouse()
    
    -- if so add to the top of the options
    if targetHouse then
        table.insert(places, 1, { city_name = "House: " .. targetHouse:getName(), is_house = true })
    end

	for _, city in ipairs(places) do
		window:addChoice(city.city_name, function(player, button, choice)
			if button.name ~= "Teleport" then
				return true
			end

            local town = Town(city.city_name)
            
            if town or targetHouse then
                if player:removeMoneyBank(teleport_price) then
                    if targetHouse and city.is_house == true then
                        player:teleportTo(targetHouse:getExitPosition())
                    else
                        player:teleportTo(town:getTemplePosition())
                    end
                    player:setExhaustion(exhaustion_key, exhaustion_cooldown_in_seconds)
                else
                    player:getPosition():sendMagicEffect(CONST_ME_POFF)
                    player:sendCancelMessage("You do not have enough money.")
                end
            end
            

            
			return true
		end)
	end

	window:addButton("Teleport")
	window:addButton("Close")
	window:setDefaultEnterButton(0)
	window:setDefaultEscapeButton(1)
	window:sendToPlayer(player)
	return true
end

eyeOfTheStorm:id(19369)
eyeOfTheStorm:register()