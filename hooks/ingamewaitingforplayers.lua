_G.CloneClass(IngameWaitingForPlayersState)
function IngameWaitingForPlayersState:at_exit(...)
    IngameWaitingForPlayersState.orig.at_exit(self, ...)
    managers.player:player_unit():character_damage():set_god_mode(false)
end