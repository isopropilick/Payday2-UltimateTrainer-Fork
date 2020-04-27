UT.menus.player = {
    title = "player menu",
    button_list = {
        {text = "level menu", callback_func =
            function()
                local menu = {
                    title = "level menu",
                    button_list = {
                        {text = "set level 0", callback_func = function() UT.Player.setLevel(0) end},
                        {text = "set level 25", callback_func = function() UT.Player.setLevel(25) end},
                        {text = "set level 50", callback_func = function() UT.Player.setLevel(50) end},
                        {text = "set level 75", callback_func = function() UT.Player.setLevel(75) end},
                        {text = "set level 100", callback_func = function() UT.Player.addExperience(30000000) end},
                        {no_text = true, no_selection = true},
                        {text = "set infamy rank v", callback_func = function() UT.Player.setInfamyRank(5) end},
                        {text = "set infamy rank x", callback_func = function() UT.Player.setInfamyRank(10) end},
                        {text = "set infamy rank xv", callback_func = function() UT.Player.setInfamyRank(15) end},
                        {text = "set infamy rank xx", callback_func = function() UT.Player.setInfamyRank(20) end},
                        {text = "set infamy rank xxv", callback_func = function() UT.Player.setInfamyRank(25) end},
                        {text = "reset infamy rank", callback_func = function() UT.Player.setInfamyRank(0) end},
                        {no_text = true, no_selection = true},
                        {text = "add 1.000.000 xp", callback_func = function() UT.Player.addExperience(1000000) end},
                        {text = "add 10.000.000 xp", callback_func = function() UT.Player.addExperience(10000000) end},
                        {no_text = true, no_selection = true},
                        {text = "cancel", cancel_button = true},
                    }
                }
                UT.openMenu(menu)
            end
        },
        {text = "skill menu", callback_func =
            function()
                local menu = {
                    title = "skill menu",
                    button_list = {
                        {text = "set skill points 120", callback_func = function() UT.Player.setSkillPoints(120) end},
                        {text = "set skill points 690", callback_func = function() UT.Player.setSkillPoints(690) end},
                        {text = "reset skill points", callback_func = function() UT.Player.setSkillPoints(0) end},
                        {no_text = true, no_selection = true},
                        {text = "add 13700 perk points", callback_func = function() UT.Player.addPerkPoints(13700) end},
                        {text = "add 287700 perk points", callback_func = function() UT.Player.addPerkPoints(287700) end},
                        {no_text = true, no_selection = true},
                        {text = "set infamy points 25", callback_func = function() UT.Player.setInfamyPoints(25) end},
                        {text = "reset infamy points", callback_func = function() UT.Player.setInfamyPoints(0) end},
                        {no_text = true, no_selection = true},
                        {text = "cancel", cancel_button = true},
                    }
                }
                UT.openMenu(menu)
            end
        },
        {text = "money menu", callback_func =
            function()
                local menu = {
                    title = "money menu",
                    button_list = {
                        {text = "add 10.000.000 $", callback_func = function() UT.Player.addMoney(10000000) end},
                        {text = "add 100.000.000 $", callback_func = function() UT.Player.addMoney(100000000) end},
                        {text = "add 1.000.000.000 $", callback_func = function() UT.Player.addMoney(1000000000) end},
                        {text = "add 10.000.000.000 $", callback_func = function() UT.Player.addMoney(10000000000) end},
                        {text = "add 100.000.000.000 $", callback_func = function() UT.Player.addMoney(100000000000) end},
                        {text = "reset money", callback_func = function() UT.Player.resetMoney() end},
                        {no_text = true, no_selection = true},
                        {text = "cancel", cancel_button = true},
                    }
                }
                UT.openMenu(menu)
            end
        },
        {text = "inventory menu", callback_func =
            function()
                local menu = {
                    title = "inventory menu",
                    button_list = {
                        {text = "add 10 of all items", callback_func = function() UT.Player.addAllItems() end},
                        {text = "reset all items", callback_func = function() UT.Player.resetAllItems() end},
                        {no_text = true, no_selection = true},
                        {text = "add 10 of all weapon mods", callback_func = function() UT.Player.addItems("weapon_mods") end},
                        {text = "add 10 of all masks", callback_func = function() UT.Player.addItems("masks") end},
                        {text = "add 10 of all materials", callback_func = function() UT.Player.addItems("materials") end},
                        {text = "add 10 of all textures", callback_func = function() UT.Player.addItems("textures") end},
                        {text = "add 10 of all colors", callback_func = function() UT.Player.addItems("colors") end},
                        {no_text = true, no_selection = true},
                        {text = "reset weapon mods", callback_func = function() UT.Player.resetItems("weapon_mods") end},
                        {text = "reset masks", callback_func = function() UT.Player.resetItems("masks") end},
                        {text = "reset materials", callback_func = function() UT.Player.resetItems("materials") end},
                        {text = "reset textures", callback_func = function() UT.Player.resetItems("textures") end},
                        {text = "reset colors", callback_func = function() UT.Player.resetItems("colors") end},
                        {no_text = true, no_selection = true},
                        {text = "unlock all slots", callback_func = function() UT.Player.setAllSlots(true) end},
                        {text = "lock all slots", callback_func = function() UT.Player.setAllSlots(false) end},
                        {no_text = true, no_selection = true},
                        {text = "remove exclamation marks", callback_func = function() UT.Player.removeExclamationMarks() end},
                        {no_text = true, no_selection = true},
                        {text = "cancel", cancel_button = true},
                    }
                }
                UT.openMenu(menu)
            end
        },
        {text = "achievment menu", callback_func =
            function()
                local menu = {
                    title = "achievment menu",
                    button_list = {
                        {text = "unlock all achievments", callback_func = function() UT.Player.unlockAllAchievments() end},
                        {text = "lock all achievments", callback_func = function() UT.Player.lockAllAchievments() end},
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

appeunbs = true