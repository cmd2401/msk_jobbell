ESX = exports['es_extended']:getSharedObject()

RegisterNetEvent("bell:notify")
AddEventHandler("bell:notify", function(job)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local xPlayers = ESX.GetPlayers()

    if (not xPlayer) then return end
    for i = 1, #xPlayers, 1 do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        if (xPlayer.getJob().name) == job then
            TriggerClientEvent('esx:showNotification', xPlayers[i], 'Ein Kunde sucht einen Mitarbeiter an der Rezeption')
            TriggerClientEvent('esx:showNotification', source,      'Du hast die klingel aktiviert')
        else
            TriggerClientEvent('esx:showNotification', source,      'Es sind keine Mitarbeiter verfügbar')
        end
    end
end)
