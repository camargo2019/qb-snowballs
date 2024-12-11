---- Developer by git@camargo2019

local _CMR = {}
local QBCore = exports['qb-core']:GetCoreObject()

_CMR.__index = _CMR;

function _CMR:New()
    local instance = setmetatable({}, self)
    return instance
end

function _CMR:AddSnowBall(Source)
    local Player = QBCore.Functions.GetPlayer(Source)
    if Player then
        Player.Functions.AddItem(Config.SnowBall.ItemName, Config.SnowBall.Quantity)
    end
end

CreateThread(function()
    local Main = _CMR:New()

    RegisterNetEvent("_CMR:AddSnowBall", function(...) Main:AddSnowBall(source, ...) end)
end)