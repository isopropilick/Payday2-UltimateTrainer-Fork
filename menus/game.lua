UT.menus.game = {
    title = "game menu",
    button_list = {
        {text = "mask off", callback_func = function() UT.Game.maskOff() end},
        {text = "access cameras", callback_func = function() UT.Game.accessCameras() end},
        {text = "remove invisible walls", callback_func =
            function()
                if Network:is_server() then
                    UT.Game.removeInvisibleWalls()
                else
                    UT.showMessage("host only", UT.colors.red)
                end
            end
        },
        {no_text = true, no_selection = true},
        {text = "toggle god mode [" .. (UT.Game.godMode and "Ø" or "O") .. "]", callback_func = function() UT.Game.toggleGodMode() end},
        {text = "toggle overkill mode [" .. (UT.Game.overkillMode and "Ø" or "O") .. "]", callback_func = function() UT.Game.toggleOverkillMode() end},
        {text = "toggle flight mode [" .. (UT.Game.flightMode and "Ø" or "O") .. "]", callback_func = function() UT.Game.toggleFlightMode() end},
        {text = "toggle disable ai [" .. (UT.Game.disableAI and "Ø" or "O") .. "]", callback_func =
            function()
                if Network:is_server() then
                    UT.Game.toggleDisableAI()
                else
                    UT.showMessage("host only", UT.colors.red)
                end
            end
        },
        {text = "toggle instant drilling [" .. (UT.Game.instantDrilling and "Ø" or "O") .. "]", callback_func =
            function()
                if Network:is_server() then
                    UT.Game.toggleInstantDrilling()
                else
                    UT.showMessage("host only", UT.colors.red)
                end
            end
        },
        {no_text = true, no_selection = true},
        {text = "cancel", cancel_button = true},
    }
}

--heswaiqm = true