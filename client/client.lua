local QBCore = exports[Config.Core]:GetCoreObject()
local HrClock = nil
local Stress = nil

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    HrClock = GetClockHours()
    Stress = QBCore.Functions.GetPlayerData().metadata["stress"]
end)

CreateThread(function()
    while true do 
        if Stress and HrClock then 
            HrClock = GetClockHours()
            Stress = QBCore.Functions.GetPlayerData().metadata["stress"]
            local Chance = math.random(1, 100)
            if (HrClock >= Config.NightHrs.StartHour or HrClock <= Config.NightHrs.EndHour) and Stress >= Config.StressLevel then 
                if Chance <= Config.GhostAttackChance then 
                    -- Ghost Attack -- 
                    AlienEffect()
                    QBCore.Functions.Progressbar("ghostattack", "Recovering From Ghost Attack...", 10000, false, true, {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                    }, {
                        animDict = "missarmenian2",
                        anim = "drunk_loop",
                        flags = 1,
                    }, {}, {}, function() -- Done 
                        ClearPedTasks(PlayerPedId())
                        StopScreenEffect("DrugsMichaelAliensFightIn")
                        StopScreenEffect("DrugsMichaelAliensFight")
                        StopScreenEffect("DrugsMichaelAliensFightOut")
                    end)
                    -- Ghost Attack -- 
                end
            end
        end
        Wait(Config.GhsotAttackInterval)
    end
end)



function AlienEffect()
    StartScreenEffect("DrugsMichaelAliensFightIn", 3.0, 0)Wait(math.random(5000, 8000))
    Wait(math.random(500, 1000))
    StartScreenEffect("DrugsMichaelAliensFight", 3.0, 0)
    local Rand = math.random(1, 5)
    SetNuiFocus(true, true)
    SendNUIMessage({
        action = "ghostattack",
        rand = Rand,
    })
    LoadAnimDict("random@drunk_driver_1")
    TaskPlayAnim(PlayerPedId(), "random@drunk_driver_1", "drunk_fall_over", 2.0, 2.0, -1, 0, 0, false, false, false)
    Wait(math.random(500, 1000))
    StartScreenEffect("DrugsMichaelAliensFightOut", 3.0, 0)
    Wait(6000)
end


RegisterNuiCallback("close", function()
    SetNuiFocus(false, false)
end)


function LoadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Wait(5)
    end
end
