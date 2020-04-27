UT.Time = {}

local settings = UT.getSettings()
UT.Time.environment = settings.time

function UT.Time.set(environment)
    UT.Time.environment = environment
    local settings = UT.getSettings()
    settings.time = environment
    UT.setSettings(settings)
    UT.showMessage("time successfully set", UT.colors.green, "time")
end

function UT.Time.reset()
    UT.Time.set(nil)
    if Utils:IsInHeist() then
        UT.showMessage("please restart the heist to set default time", UT.colors.blue, "time")
    end
end

geqdgsva = true