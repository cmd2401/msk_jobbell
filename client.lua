ESX = exports['es_extended']:getSharedObject()

CreateThread(function()
    while true do
        local wait = 500
    
        for _,v in pairs(Config.Position) do
            local pos = v.pos
            local pPos = GetEntityCoords(PlayerPedId())
            local dst = Vdist(pPos.x, pPos.y, pPos.z, pos.x, pos.y, pos.z)

            if dst <= 3.0 then
                wait = 0
                DrawMarker(Config.MarkerType, pos.x, pos.y, (pos.z)-1.0,0.0, 0.0, 0.0, 360.0, 0.0, 0.0, 1.0, 1.0, 1.0, 60, 66, 207, 155)
            end
            if dst <= 1.0 then
                wait = 0
                ESX.ShowHelpNotification(Config.ShowHelpNotification)
                if IsControlJustPressed(1, Config.Control) then
                    TriggerServerEvent("bell:notify", v.job)
                    Wait(Config.WaitAfterBell)
                end
            end
        end

        Wait(wait)
    end
end)
