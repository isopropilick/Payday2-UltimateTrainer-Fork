if not Utils:IsInGameState() then
    do return end
end

if not Utils:IsInHeist() then
    do return end
end

if not Network:is_server() then
    UT.showMessage("host only", UT.colors.red, "spawn")
    do return end
end

if managers.system_menu:is_active() then
    do return end
end

UT.openMenu(UT.menus.spawn)