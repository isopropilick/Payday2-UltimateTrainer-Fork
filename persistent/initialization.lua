local settings = UT.getSettings()
if not settings.initialized then
    local bltData = UT.getBltData()
    bltData.keybinds = {}
    for key, value in pairs(UT.keybinds) do
        table.insert(bltData.keybinds, value)
    end
    settings.initialized = true
    local result1 = UT.setBltData(bltData)
    local result2 = UT.setSettings(settings)
    if not result1 or not result2 then
        do return end
    end
    local text = ""
    text = text .. "FIRST LAUNCH\n"
    text = text .. "Keys have been successfully binded.\n"
    text = text .. "Please restart the game."
    local menu = {
        title = "ultimate trainer 4",
        text = text,
        button_list = {
            {text = "exit", callback_func = function() os.exit() end},
        }
    }
    UT.openMenu(menu)
end

nohpdlak = true