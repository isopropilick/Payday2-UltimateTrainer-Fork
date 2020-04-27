UT.Player = {}

function UT.Player.setLevel(value)
    managers.experience:_set_current_level(value)
end

function UT.Player.setInfamyRank(value)
    managers.experience:set_current_rank(value)
end

function UT.Player.addExperience(value)
    managers.experience:debug_add_points(value, false)
end

function UT.Player.setSkillPoints(value)
    managers.skilltree:_set_points(value)
end

function UT.Player.addPerkPoints(value)
    managers.skilltree:give_specialization_points(value * 1000)
end

function UT.Player.setInfamyPoints(value)
    managers.infamy:_set_points(value)
end

function UT.Player.addMoney(value)
    managers.money:_add_to_total(value)
end

function UT.Player.resetMoney()
    managers.money:reset()
end

function UT.Player.addItems(type)
    for i = 1, 10 do
        for key, value in pairs(tweak_data.blackmarket[type]) do
            local globalValue = "normal"
            if value.global_value then
                globalValue = value.global_value
            elseif value.infamous then
                globalValue = "infamous"
            elseif value.dlcs or value.dlc then
                local dlcs = value.dlcs or {}
                if value.dlc then table.insert(dlcs, value.dlc) end
                globalValue = dlcs[math.random(#dlcs)]
            end
            managers.blackmarket:add_to_inventory(globalValue, type, key)
        end
    end
end

function UT.Player.addAllItems()
    local types = {"weapon_mods", "masks", "materials", "textures", "colors"}
    for key, value in pairs(types) do
        UT.Player.addItems(value)
    end
end

function UT.Player.resetItems(type)
    for globalValue, data in pairs(Global.blackmarket_manager.inventory) do
        if not data[type] then
            goto continue
        end
        for key, value in pairs(data[type]) do
            Global.blackmarket_manager.inventory[globalValue][type][key] = nil
        end
        ::continue::
    end
end

function UT.Player.resetAllItems()
    local types = {"weapon_mods", "masks", "materials", "textures", "colors"}
    for key, value in pairs(types) do
        UT.Player.resetItems(value)
    end
end

function UT.Player.setAllSlots(value)
    for i = 1, 160 do
        Global.blackmarket_manager.unlocked_weapon_slots.primaries[i] = value
        Global.blackmarket_manager.unlocked_weapon_slots.secondaries[i] = value
        Global.blackmarket_manager.unlocked_mask_slots[i] = value
    end
end

function UT.Player.removeExclamationMarks()
    Global.blackmarket_manager.new_drops = {}
end

function UT.Player.unlockAllAchievments()
    for key, value in pairs(managers.achievment.achievments) do
        managers.achievment:award(key)
    end
end

function UT.Player.lockAllAchievments()
    managers.achievment:clear_all_steam()
end

lhmdfatt = true