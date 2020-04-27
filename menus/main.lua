UT.menus.main = {
    title = "ultimate trainer " .. UT.version,
    text = "By ChildOfSorrow",
    button_list = {
        {text = "documentation", callback_func = function() UT.documentation() end},
        {text = "about", callback_func = function() UT.openMenu(UT.menus.about) end},
        {no_text = true, no_selection = true},
        {text = "player menu", callback_func = function() UT.openMenu(UT.menus.player) end},
        {text = "game menu", callback_func =
            function()
                if Utils:IsInHeist() then
                    UT.openMenu(UT.menus.game)
                else
                    UT.showMessage("in game only", UT.colors.red)
                end
            end
        },
        {text = "time menu", callback_func = function() UT.openMenu(UT.menus.time) end},
        {text = "spawn menu", callback_func =
            function()
                if Utils:IsInHeist() then
                    if Network:is_server() then
                        UT.openMenu(UT.menus.spawn)
                    else
                        UT.showMessage("host only", UT.colors.red)
                    end
                else
                    UT.showMessage("in game only", UT.colors.red)
                end
            end
        },
        {text = "construction menu", callback_func =
            function()
                if Utils:IsInHeist() then
                    if Network:is_server() then
                        UT.openMenu(UT.menus.construction)
                    else
                        UT.showMessage("host only", UT.colors.red)
                    end
                else
                    UT.showMessage("in game only", UT.colors.red)
                end
            end
        },
        {no_text = true, no_selection = true},
        {text = "cancel", cancel_button = true},
    }
}

oedavnnz = true