ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent('rLocation:AchatVehicule')
AddEventHandler('rLocation:AchatVehicule', function(Nom, Vehicule, Price)
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)
    local car = Vehicule
    if xPlayer.getMoney() >= Price then 
        xPlayer.removeMoney(Price)
        TriggerClientEvent('rLocation:spawnCar', _src, car)
        Citizen.Wait(500)
        TriggerClientEvent('esx:showAdvancedNotification', _src, 'Location', 'Véhicule', 'Votre véhicule arrive d\'ici peu !', 'CHAR_CASTRO', 1)
        Citizen.Wait(10000)
		TriggerClientEvent('esx:showAdvancedNotification', _src, 'Banque', 'Conseiller', "Un prélèvement de ~r~"..Price.." ~s~a été effectué sur votre compte pour ~r~une location ~s~!", 'CHAR_BANK_MAZE', 1)
    else 
        Citizen.Wait(500) 
        TriggerClientEvent('esx:showAdvancedNotification', _src, 'Banque', 'Conseiller', "Vous ne disposez pas d'assez d'argent ~s~!", 'CHAR_BANK_MAZE', 1)
    end
end)
