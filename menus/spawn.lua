UT.menus.spawn = {
    title = "spawn menu",
    button_list = {
        {text = "enemies", callback_func = function() UT.Spawn.setModeEnemies() end},
        {text = "allies", callback_func = function() UT.Spawn.setModeAllies() end},
        {text = "civilians", callback_func = function() UT.Spawn.setModeCivilians() end},
        {text = "loots", callback_func = function() UT.Spawn.setModeLoots() end},
        {text = "equipments", callback_func = function() UT.Spawn.setModeEquipments() end},
        {text = "packages", callback_func = function() UT.Spawn.setModePackages() end},
        {no_text = true, no_selection = true},
        {text = "remove npcs", callback_func = function() UT.Spawn.removeNPCs() end},
        {text = "remove loots", callback_func = function() UT.Spawn.removeLoots() end},
        {text = "remove equipments", callback_func = function() UT.Spawn.removeEquipments() end},
        {text = "remove packages", callback_func = function() UT.Spawn.removePackages() end},
        {no_text = true, no_selection = true},
        {text = "spawn drivable car", callback_func = function() UT.Spawn.spawnDrivableCar() end},
        {no_text = true, no_selection = true},
        {text = "set spawn position", callback_func =
            function()
                local menu = {
                    title = "set spawn position",
                    button_list = {
                        {text = "spawn on crosshair", callback_func = function() UT.Spawn.setPosition("crosshair") end},
                        {text = "spawn on self", callback_func = function() UT.Spawn.setPosition("self") end},
                        {no_text = true, no_selection = true},
                        {text = "cancel", cancel_button = true},
                    }
                }
                UT.openMenu(menu)
            end
        },
        {no_text = true, no_selection = true},
        {text = "cancel", cancel_button = true},
    }
}

rhfuusme = true