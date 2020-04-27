UT.menus.construction = {
    title = "construction menu",
    button_list = {
        {text = "save", callback_func = function() UT.Construction.save() end},
        {text = "load", callback_func = 
            function()
                local menu = {
                    title = "load",
                    button_list = {}
                }
                local constructions = UT.getConstructions()
                local levelId = managers.job:current_level_id()
                if not UT.checkTable(constructions[levelId]) then
                    UT.showMessage("no saves", UT.colors.orange, "construction")
                    return
                end
                for key, value in pairs(constructions[levelId]) do
                    table.insert(menu.button_list, {text = value.name, callback_func = function() UT.Construction.load(value.units) end})
                end
                table.insert(menu.button_list, {no_text = true, no_selection = true})
                table.insert(menu.button_list, {text = "cancel", cancel_button = true})
                UT.openMenu(menu)
            end
        },
        {text = "delete", callback_func = 
            function()
                local menu = {
                    title = "delete",
                    button_list = {}
                }
                local constructions = UT.getConstructions()
                local levelId = managers.job:current_level_id()
                if not UT.checkTable(constructions[levelId]) then
                    UT.showMessage("no saves", UT.colors.orange, "construction")
                    return
                end
                for key, value in pairs(constructions[levelId]) do
                    table.insert(menu.button_list, {text = value.name, callback_func =
                        function()
                            local menu = {
                                title = "confirmation",
                                text = "Deletion is final. Continue ?",
                                button_list = {
                                    {text = "yes", callback_func = function() UT.Construction.delete(value.time) end},
                                    {text = "no", cancel_button = true}
                                }
                            }
                            UT.openMenu(menu)
                        end
                    })
                end
                table.insert(menu.button_list, {no_text = true, no_selection = true})
                table.insert(menu.button_list, {text = "cancel", cancel_button = true})
                UT.openMenu(menu)
            end
        },
        {text = "clear", callback_func = function() UT.Construction.clear() end},
        {no_text = true, no_selection = true},
        {text = "toggle crosshair", callback_func = function() UT.Construction.toggleCrosshair() end},
        {no_text = true, no_selection = true},
        {text = "cancel", cancel_button = true},
    }
}

eppoxrdv = true