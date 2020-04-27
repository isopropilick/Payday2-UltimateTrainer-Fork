UT.Game = {}

UT.Game.flightValue = 800

function UT.Game.maskOff()
    managers.player:set_player_state("clean")
    managers.player:set_player_state("throw_grenade")
end

function UT.Game.accessCameras()
    game_state_machine:change_state_by_name("ingame_access_camera")
end

function UT.Game.toggleGodMode()
    local characterDamage = managers.player:player_unit():character_damage()
    if UT.Game.godMode then
        characterDamage:set_god_mode(false)
        UT.showMessage("god mode disabled", UT.colors.orange)
        UT.Game.godMode = false
    else
        characterDamage:set_god_mode(true)
        UT.showMessage("god mode enabled", UT.colors.green)
        UT.Game.godMode = true
    end
end

function UT.Game.toggleOverkillMode()
    if not UT.Game.overkillMode then
        _G.CloneClass(NewRaycastWeaponBase)
        _G.CloneClass(BaseInteractionExt)
        _G.CloneClass(PlayerManager)
        _G.CloneClass(PlayerMovement)
        _G.CloneClass(PlayerStandard)
        _G.CloneClass(CoreEnvironmentControllerManager)
        _G.CloneClass(SawWeaponBase)
        if not new_raycast_weapon_base_fire then
            new_raycast_weapon_base_fire = NewRaycastWeaponBase.fire
        end
        if not saw_weapon_base_fire then
            saw_weapon_base_fire = SawWeaponBase.fire
        end
        function NewRaycastWeaponBase:recoil_multiplier() return 0 end
        function NewRaycastWeaponBase:spread_multiplier() return 0 end
        function NewRaycastWeaponBase:damage_multiplier() return 1000000 end
        function NewRaycastWeaponBase:fire_rate_multiplier() return 1000000 end
        function NewRaycastWeaponBase.reload_speed_multiplier() return 1000000 end
        function BaseInteractionExt:_get_timer() return 0.0001 end
        function BaseInteractionExt:_has_required_upgrade() return true end
        function BaseInteractionExt:_has_required_deployable() return true end
        function BaseInteractionExt:can_interact() return true end
        function PlayerManager:carry_blocked_by_cooldown() return false end
        function PlayerManager:on_used_body_bag() end
        function PlayerManager:remove_equipment() end
        function PlayerManager:selected_equipment_deploy_timer() return 0.0001 end
        function PlayerManager:remove_special() end
        function PlayerMovement:_change_stamina() end
        function PlayerMovement:is_stamina_drained() return false end
        function PlayerStandard:_can_run_directional() return true end
        function PlayerStandard:_get_swap_speed_multiplier() return 1000000 end
        function CoreEnvironmentControllerManager:set_flashbang() end
        function NewRaycastWeaponBase:fire(...)
            local result = new_raycast_weapon_base_fire(self, ...)
            if managers.player:player_unit() == self._setup.user_unit then
                self.set_ammo(self, 1.0)
            end
            return result
        end
        function SawWeaponBase:fire(...)
            saw_weapon_base_fire(self, ...)
            if managers.player:player_unit() == self._setup.user_unit then
                self.set_ammo(self, 1.0)
            end
        end
        UT.showMessage("overkill mode enabled", UT.colors.green)
        UT.Game.overkillMode = true
    else
        NewRaycastWeaponBase.recoil_multiplier = NewRaycastWeaponBase.orig.recoil_multiplier
        NewRaycastWeaponBase.spread_multiplier = NewRaycastWeaponBase.orig.spread_multiplier
        NewRaycastWeaponBase.damage_multiplier = NewRaycastWeaponBase.orig.damage_multiplier
        NewRaycastWeaponBase.fire_rate_multiplier = NewRaycastWeaponBase.orig.fire_rate_multiplier
        NewRaycastWeaponBase.reload_speed_multiplier = NewRaycastWeaponBase.orig.reload_speed_multiplier
        BaseInteractionExt._get_timer = BaseInteractionExt.orig._get_timer
        BaseInteractionExt._has_required_upgrade = BaseInteractionExt.orig._has_required_upgrade
        BaseInteractionExt._has_required_deployable = BaseInteractionExt.orig._has_required_deployable
        BaseInteractionExt.can_interact = BaseInteractionExt.orig.can_interact
        PlayerManager.carry_blocked_by_cooldown = PlayerManager.orig.carry_blocked_by_cooldown
        PlayerManager.on_used_body_bag = PlayerManager.orig.on_used_body_bag
        PlayerManager.remove_equipment = PlayerManager.orig.remove_equipment
        PlayerManager.selected_equipment_deploy_timer = PlayerManager.orig.selected_equipment_deploy_timer
        PlayerManager.remove_special = PlayerManager.orig.remove_special
        PlayerMovement._change_stamina = PlayerMovement.orig._change_stamina
        PlayerMovement.is_stamina_drained = PlayerMovement.orig.is_stamina_drained
        PlayerStandard._can_run_directional = PlayerStandard.orig._can_run_directional
        PlayerStandard._get_swap_speed_multiplier = PlayerStandard.orig._get_swap_speed_multiplier
        CoreEnvironmentControllerManager.set_flashbang = CoreEnvironmentControllerManager.orig.set_flashbang
        NewRaycastWeaponBase.fire = NewRaycastWeaponBase.orig.fire
        SawWeaponBase.fire = SawWeaponBase.orig.fire
        UT.showMessage("overkill mode disabled", UT.colors.orange)
        UT.Game.overkillMode = false
    end
end

function UT.Game.toggleFlightMode()
    _G.CloneClass(PlayerDamage)
    _G.CloneClass(PlayerManager)
    _G.CloneClass(PlayerStandard)
    if not UT.Game.flightMode then
        function PlayerDamage:damage_fall() return false end
        function PlayerManager:movement_speed_multiplier() return 4 end
        function PlayerStandard:_check_action_jump()
            managers.player:player_unit():mover():jump()
            if self._controller:get_input_bool("jump") then
                managers.player:player_unit():mover():set_gravity(Vector3(0, 0, 0))
                managers.player:player_unit():mover():set_velocity(Vector3(0, 0, UT.Game.flightValue))
                UT.Game.flightAscend = true
            else
                if UT.Game.flightAscend then
                    managers.player:player_unit():mover():set_gravity(Vector3(0, 0, 0))
                    managers.player:player_unit():mover():set_velocity(Vector3(0, 0, 0))
                    UT.Game.flightAscend = false
                end
            end
        end
        function PlayerStandard:_check_action_duck()
            if self._controller:get_input_bool("duck") then
                managers.player:player_unit():mover():set_gravity(Vector3(0, 0, 0))
                managers.player:player_unit():mover():set_velocity(Vector3(0, 0, 0 - UT.Game.flightValue))
                UT.Game.flightDescend = true
            else
                if UT.Game.flightDescend then
                    managers.player:player_unit():mover():set_gravity(Vector3(0, 0, 0))
                    managers.player:player_unit():mover():set_velocity(Vector3(0, 0, 0))
                    UT.Game.flightDescend = false
                end
            end
        end
        UT.showMessage("flight mode enabled", UT.colors.green)
        UT.Game.flightMode = true
    else
        PlayerDamage.damage_fall = PlayerDamage.orig.damage_fall
        PlayerManager.movement_speed_multiplier = PlayerManager.orig.movement_speed_multiplier
        PlayerStandard._check_action_jump = PlayerStandard.orig._check_action_jump
        PlayerStandard._check_action_duck = PlayerStandard.orig._check_action_duck
        managers.player:player_unit():mover():set_gravity(Vector3(0, 0, -982))
        UT.showMessage("flight mode disabled", UT.colors.orange)
        UT.Game.flightMode = false
    end
end

function UT.Game.toggleInstantDrilling()
    _G.CloneClass(TimerGui)
    if not UT.Game.instantDrilling then
        function TimerGui:_set_jamming_values() return end
        function TimerGui:start()
            local timer = 0.01
            self:_start(timer)
            managers.network:session():send_to_peers_synched("start_timer_gui", self._unit, timer)
        end
        UT.showMessage("instant drilling enabled", UT.colors.green)
        UT.Game.instantDrilling = true
    else
        TimerGui._set_jamming_values = TimerGui.orig._set_jamming_values
        TimerGui.start = TimerGui.orig.start
        UT.showMessage("instant drilling disabled", UT.colors.orange)
        UT.Game.instantDrilling = false
    end
end

function UT.Game.toggleDisableAI()
    if UT.Game.disableAI then
        for key, value in pairs(managers.enemy:all_civilians()) do
            value.unit:brain():set_active(true)
        end
        for key, value in pairs(managers.enemy:all_enemies()) do
            value.unit:brain():set_active(true)
        end
        for key, unit in pairs(SecurityCamera.cameras) do
            unit:base()._detection_interval = 0.1
        end
        UT.showMessage("ai enabled", UT.colors.orange)
        UT.Game.disableAI = false
    else
        UT.showMessage("ai disabled", UT.colors.green)
        UT.Game.disableAI = true
    end
end

function UT.Game.removeInvisibleWalls()
    local units = {}
    for key, unit in pairs(World:find_units_quick("all", 1)) do
        if not alive(unit) then goto continue end
        if not UT.Tables.invisibleWalls[unit:name():key()] then goto continue end
        table.insert(units, unit)
        ::continue::
    end
    local count = UT.removeUnits(units)
    UT.showMessage("removed " .. tostring(count) .. " invisible wall" .. (count > 1 and "s" or ""), UT.colors.green)
end

wlysetvz = true