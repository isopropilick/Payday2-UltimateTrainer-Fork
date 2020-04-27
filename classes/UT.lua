UT = {}

UT.menus = {}
UT.version = "4.0"
UT.documentationURL = "https://www.unknowncheats.me/forum/payday-2-a/390014-payday-2-ultimate-trainer-4-a.html"
UT.colors = {
    red = Color("c0392b"),
    orange = Color("d35400"),
    green = Color("27ae60"),
    blue = Color("2980b9"),
    white = Color("ffffff")
}
UT.filenames = {
    bltData = SavePath .. "blt_data.txt",
    settings = SavePath .. "UTSettings.json",
    constructions = SavePath .. "UTConstructions.json"
}
UT.keybinds = {
    {id = "jhihkaaa", pc = "insert"}, -- start
    {id = "fznmdixh", pc = "home"}, -- restart
    {id = "npjcvoux", pc = "end"}, -- finish
    {id = "rzkldcdw", pc = "f1"}, -- main menu
    {id = "yckojnfm", pc = "f2"}, -- construction copy
    {id = "dvxncrfn", pc = "f3"}, -- construction paste
    {id = "wifxhadf", pc = "f4"}, -- construction remove
    {id = "jvanfgdf", pc = "mouse wheel up"}, -- spawn previous
    {id = "hbmvidqb", pc = "mouse wheel down"}, -- spawn next
    {id = "knsfkahu", pc = "mouse 2"}, -- spawn place
    {id = "gennlucd", pc = "5"}, -- teleportation
    {id = "couytxqv", pc = "right alt"}, -- replenish
}

function UT.getTime()
    return os.time()
end

function UT.getDateTime()
    return os.date("%c")
end

function UT.getFilename(path)
    return path:match("[^/]+$")
end

function UT.readFile(filename)
    if not io.file_is_readable(filename) then return end
    local file = io.open(filename, "r")
    if not file then return end
    local content = file:read("*all")
    file:close()
    return content
end

function UT.writeFile(filename, content, mode)
    file = io.open(filename, mode or "w+")
    if not file then return false end
    file:write(content)
    file:close()
    return true
end

function UT.getTable(filename)
    local content = UT.readFile(filename)
    if not content then return {} end
    return json.decode(content)
end

function UT.setTable(filename, table)
    local content = json.encode(table)
    return UT.writeFile(filename, content)
end

function UT.getBltData()
    return UT.getTable(UT.filenames.bltData)
end

function UT.setBltData(bltData)
    return UT.setTable(UT.filenames.bltData, bltData)
end

function UT.getSettings()
    return UT.getTable(UT.filenames.settings)
end

function UT.setSettings(settings)
    return UT.setTable(UT.filenames.settings, settings)
end

function UT.getConstructions()
    return UT.getTable(UT.filenames.constructions)
end

function UT.setConstructions(constructions)
    return UT.setTable(UT.filenames.constructions, constructions)
end

function UT.inTable(element, table)
    for key, value in pairs(table) do
        if value == element then return true end
    end
    return false
end

function UT.checkTable(table)
    if not table then return false end
    if type(table) ~= "table" then return false end
    if next(table) == nil then return false end
    return true
end

function UT.countTable(table)
    local count = 0
    for key, value in pairs(table) do
        count = count + 1
    end
    return count
end

function UT.debugOutput(output, color)
    managers.mission._fading_debug_output:script().log(UT.getDateTime() .. " " .. tostring(output), color)
end

function UT.showMessage(message, color, name)
    managers.mission._fading_debug_output:script().log((name and "[" .. name .. "] " or "") .. message, color)
end

function UT.showSubtitle(subtitle, color)
    managers.mission:_show_debug_subtitle(subtitle, color)
end

function UT.openMenu(menu)
    managers.system_menu:show_buttons(menu)
end

function UT.playSound(name)
    managers.menu_component:post_event(name)
end

function UT.getCameraPosition()
    return managers.player:player_unit():camera():position()
end

function UT.getCameraRotation()
    return managers.player:player_unit():camera():rotation()
end

function UT.getCameraRotationFlat()
    return Rotation(UT.getCameraRotation():yaw(), 0, 0)
end

function UT.getCameraForward()
    return managers.player:player_unit():camera():forward()
end

function UT.getPlayerPosition()
    return managers.player:player_unit():position()
end

function UT.getPlayerRotation()
    return managers.player:player_unit():rotation()
end

function UT.unitExists(id)
    return DB:has("unit", id)
end

function UT.unitLoaded(name)
    return PackageManager:has(Idstring("unit"), name)
end

function UT.spawnUnit(name, position, rotation)
    if not UT.unitLoaded(name) then return end
    return World:spawn_unit(name, position, rotation)
end

function UT.removeUnit(unit)
    if not alive(unit) then return end
    World:delete_unit(unit)
    managers.network:session():send_to_peers_synched("remove_unit", unit)
end

function UT.removeUnits(units)
    local count = 0
    for key, unit in pairs(units) do
        UT.removeUnit(unit)
        count = count + 1
    end
    return count
end

function UT.getNameByKey(unitKey)
    local units = World:find_units_quick("all")
    for key, unit in ipairs(units) do
        if unit:name():key() == unitKey then
            return unit:name()
        end
    end
end

function UT.teleportation(position, rotation)
    managers.player:warp_to(position, rotation)
end

function UT.documentation()
    Steam:overlay_activate("url", UT.documentationURL)
end

acyuxuxn = true