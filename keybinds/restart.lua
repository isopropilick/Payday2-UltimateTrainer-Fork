if not Network:is_server() then
    UT.showMessage("host only", UT.colors.red)
    do return end
end

managers.game_play_central:restart_the_game()