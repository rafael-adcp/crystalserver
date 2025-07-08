local serverInfo = TalkAction("!serverinfo")

local function getVipMultiplier(player, rateType)
    if not configManager.getBoolean(configKeys.VIP_SYSTEM_ENABLED) then
        return 1
    end
    if player.isVip and player:isVip() then
        if rateType == "exp" then
            return 1 + (configManager.getNumber(configKeys.VIP_BONUS_EXP) / 100)
        elseif rateType == "skill" then
            return 1 + (configManager.getNumber(configKeys.VIP_BONUS_SKILL) / 100)
        elseif rateType == "loot" then
            return 1 + (configManager.getNumber(configKeys.VIP_BONUS_LOOT) / 100)
        end
    end
    return 1
end

function serverInfo.onSay(player, words, param)
    local text
    local useStages = configManager.getBoolean(configKeys.RATE_USE_STAGES)
    if not useStages then
        local expRate = configManager.getNumber(configKeys.RATE_EXPERIENCE) * getVipMultiplier(player, "exp")
        local skillRate = configManager.getNumber(configKeys.RATE_SKILL) * getVipMultiplier(player, "skill")
        local magicRate = configManager.getNumber(configKeys.RATE_MAGIC) * getVipMultiplier(player, "skill")
        local lootRate = configManager.getNumber(configKeys.RATE_LOOT) * getVipMultiplier(player, "loot")
        local spawnRate = configManager.getNumber(configKeys.RATE_SPAWN) * 1

        text = "Server Info Rates: \n"
            .. "\nExp rate: " .. expRate .. "x"
            .. "\nSkill rate: " .. skillRate .. "x"
            .. "\nMagic rate: " .. magicRate .. "x"
            .. "\nLoot rate: " .. lootRate .. "x"
            .. "\nSpawns rate: " .. spawnRate .. "x"
        if player.isVip and player:isVip() then
            text = text .. "\n\n[VIP] You are receiving boosted rates!"
        end
    else
        local configRateSkill = configManager.getNumber(configKeys.RATE_SKILL)
        local expStage = getRateFromTable(experienceStages, player:getLevel(), expstagesrate) * getVipMultiplier(player, "exp")
        local swordStage = getRateFromTable(skillsStages, player:getSkillLevel(SKILL_SWORD), configRateSkill) * getVipMultiplier(player, "skill")
        local clubStage = getRateFromTable(skillsStages, player:getSkillLevel(SKILL_CLUB), configRateSkill) * getVipMultiplier(player, "skill")
        local axeStage = getRateFromTable(skillsStages, player:getSkillLevel(SKILL_AXE), configRateSkill) * getVipMultiplier(player, "skill")
        local distStage = getRateFromTable(skillsStages, player:getSkillLevel(SKILL_DISTANCE), configRateSkill) * getVipMultiplier(player, "skill")
        local shieldStage = getRateFromTable(skillsStages, player:getSkillLevel(SKILL_SHIELD), configRateSkill) * getVipMultiplier(player, "skill")
        local fistStage = getRateFromTable(skillsStages, player:getSkillLevel(SKILL_FIST), configRateSkill) * getVipMultiplier(player, "skill")
        local magicStage = getRateFromTable(magicLevelStages, player:getBaseMagicLevel(), configManager.getNumber(configKeys.RATE_MAGIC)) * getVipMultiplier(player, "skill")
        local lootRate = configManager.getNumber(configKeys.RATE_LOOT) * getVipMultiplier(player, "loot")
        local spawnRate = configManager.getNumber(configKeys.RATE_SPAWN) * 1

        text = "Server Info Stages Rates: \n"
            .. "\nExp rate stages: " .. expStage .. "x"
            .. "\nSword Skill Stages rate: " .. swordStage .. "x"
            .. "\nClub Skill Stages rate: " .. clubStage .. "x"
            .. "\nAxe Skill Stages rate: " .. axeStage .. "x"
            .. "\nDistance Skill Stages rate: " .. distStage .. "x"
            .. "\nShield Skill Stages rate: " .. shieldStage .. "x"
            .. "\nFist Skill Stages rate: " .. fistStage .. "x"
            .. "\nMagic rate: " .. magicStage .. "x"
            .. "\nLoot rate: " .. lootRate .. "x"
            .. "\nSpawns rate: " .. spawnRate .. "x"
        if player.isVip and player:isVip() then
            text = text .. "\n\n[VIP] You are receiving boosted rates!"
        end
    end

    local loseHouseText = configManager.getNumber(configKeys.HOUSE_LOSE_AFTER_INACTIVITY) > 0 and configManager.getNumber(configKeys.HOUSE_LOSE_AFTER_INACTIVITY) .. " days" or "never"
    text = text
        .. "\n\nMore Server Info: \n"
        .. "\nLevel to buy house: " .. configManager.getNumber(configKeys.HOUSE_BUY_LEVEL)
        .. "\nLose house after inactivity: " .. loseHouseText
        .. "\nProtection level: " .. configManager.getNumber(configKeys.PROTECTION_LEVEL)
        .. "\nWorldType: " .. configManager.getString(configKeys.WORLD_TYPE)
        .. "\nKills/day to red skull: " .. configManager.getNumber(configKeys.DAY_KILLS_TO_RED)
        .. "\nKills/week to red skull: " .. configManager.getNumber(configKeys.WEEK_KILLS_TO_RED)
        .. "\nKills/month to red skull: " .. configManager.getNumber(configKeys.MONTH_KILLS_TO_RED)
        .. "\nServer Save: " .. configManager.getString(configKeys.GLOBAL_SERVER_SAVE_TIME)
    player:showTextDialog(34266, text)
    return true
end

serverInfo:separator(" ")
serverInfo:groupType("normal")
serverInfo:register()