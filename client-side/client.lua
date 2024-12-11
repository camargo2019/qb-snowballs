---- Developer by git@camargo2019

local _CMR = {}

_CMR.__index = _CMR;

function _CMR:New()
    local instance = setmetatable({}, self)
    return instance
end


function _CMR:Init()
    self.TimeVerifyWeather = 5000
    self.WeatherType = GetHashKey("XMAS")
    self.IsSnowing = (GetPrevWeatherTypeHashName() == self.WeatherType)
    self.LastTimeCheckWeather = GetGameTimer()

    RequestAnimDict('anim@mp_snowball') -- Pre load the animation

    self:MainThread()
end

function _CMR:CanPerformAction(Ped)
    return (
        not IsPedInAnyVehicle(Ped, true)
        and not IsPlayerFreeAiming(PlayerId())
        and not IsPedSwimming(Ped)
        and not IsPedSwimmingUnderWater(Ped)
        and not IsPedRagdoll(Ped)
        and not IsPedFalling(Ped)
        and not IsPedRunning(Ped)
        and not IsPedSprinting(Ped)
        and GetInteriorFromEntity(Ped) == 0
        and not IsPedShooting(Ped)
        and not IsPedUsingAnyScenario(Ped)
        and not IsPedInCover(Ped, false)
    )
end

function _CMR:MainThread()
    while true do
        local Ped = PlayerPedId()

        if self.LastTimeCheckWeather + self.TimeVerifyWeather <= GetGameTimer() then
            self.IsSnowing = (GetPrevWeatherTypeHashName() == self.WeatherType)
            self.LastTimeCheckWeather = GetGameTimer()
        end

        if self.IsSnowing then
            if IsControlJustReleased(0, Config.Key) and self.CanPerformAction(Ped) then
                self:SnowBalls()
            end
        end

        Wait(0)
    end
end


function _CMR:SnowBalls()
    TaskPlayAnim(PlayerPedId(), 'anim@mp_snowball', 'pickup_snowball', 8.0, -1, -1, 0, 1, 0, 0, 0)

    Citizen.Wait(1000)

    TriggerServerEvent("_CMR:AddSnowBall")
end


CreateThread(function()
    local Main = _CMR:New()

    Main:Init()
end)