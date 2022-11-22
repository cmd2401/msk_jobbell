ESX = exports['es_extended']:getSharedObject()

RegisterNetEvent("bell:notify")
AddEventHandler("bell:notify", function(job)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    local isJob = false

    for k, playerId in pairs(GetPlayers()) do
        local tPlayer = ESX.GetPlayerFromId(playerId)

        if tPlayer.job.name == job then
            tPlayer.showNotification('Ein Kunde sucht einen Mitarbeiter an der Rezeption')
            xPlayer.showNotification('Du hast die klingel aktiviert')
            isJob = true
        end
    end

    if not isJob then 
        xPlayer.showNotification('Es sind keine Mitarbeiter verfügbar')
    end
end)
