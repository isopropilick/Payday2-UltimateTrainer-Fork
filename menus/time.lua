UT.menus.time = {
    title = "time menu",
    button_list = {
        {text = "default", callback_func = function() UT.Time.reset() end},
        {no_text = true, no_selection = true},
        {text = "early morning", callback_func = function() UT.Time.set("environments/pd2_env_hox_02/pd2_env_hox_02") end},
        {text = "morning", callback_func = function() UT.Time.set("environments/pd2_env_morning_02/pd2_env_morning_02") end},
        {text = "mid day", callback_func = function() UT.Time.set("environments/pd2_env_mid_day/pd2_env_mid_day") end},
        {text = "afternoon", callback_func = function() UT.Time.set("environments/pd2_env_afternoon/pd2_env_afternoon") end},
        {text = "night", callback_func = function() UT.Time.set("environments/pd2_env_n2/pd2_env_n2") end},
        {text = "misty night", callback_func = function() UT.Time.set("environments/pd2_env_arm_hcm_02/pd2_env_arm_hcm_02") end},
        {text = "foggy night", callback_func = function() UT.Time.set("environments/pd2_env_foggy_bright/pd2_env_foggy_bright") end},
        {no_text = true, no_selection = true},
        {text = "cancel", cancel_button = true},
    }
}

rjdjdfwx = true