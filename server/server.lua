local QBCore = exports['qb-core']:GetCoreObject()

RegisterServerEvent("Farmcyc:recoleccion", function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	local recoleccionsuerte = math.random(1,100)
        if recoleccionsuerte < 50 then
				Player.Functions.AddItem("crabs", math.random(1,2))
        	elseif recoleccionsuerte > 51 then
		Player.Functions.AddItem("shrimp", math.random(1,2))
    end
end)



QBCore.Functions.CreateCallback('Farmcyc:empaquetado:cangrejos', function (source, cb)
	local src = source
	local Player  = QBCore.Functions.GetPlayer(src)
	if Player.Functions.GetItemByName('crabs') then
		Player.Functions.RemoveItem('crabs', 5)
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['crabs'], "remove")
			Wait(1000)
		Player.Functions.AddItem('crayfish', 1)
	else
		TriggerClientEvent('QBCore:Notify', src, "You have no crabs", 'error')
    end
	cb(false)
end)

QBCore.Functions.CreateCallback('Farmcyc:empaquetado:camarones', function (source, cb)
	local src = source
	local Player  = QBCore.Functions.GetPlayer(src)
	if Player.Functions.GetItemByName('shrimp') then
		Player.Functions.RemoveItem('shrimp', 4)
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['shrimp'], "remove")
			Wait(1000)
		Player.Functions.AddItem('shrimpbox', 1)
	else
		TriggerClientEvent('QBCore:Notify', src, "You have no shrimp", 'error')
	end
	cb(true)
end)


RegisterNetEvent('Ventadecamarones', function()
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local PrecioCamarones = Config.PCamaron
	if Player.Functions.GetItemByName('shrimpbox') then
		Player.Functions.RemoveItem('shrimpbox', 1)
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['shrimpbox'], "remove")
		Player.Functions.AddMoney('cash', PrecioCamarones)
	else
		TriggerClientEvent('QBCore:Notify', src, "You have no Shrimps", 'error')
	end
end)



RegisterNetEvent('Ventadecangrejos', function()
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local PrecioCangrejos = Config.PCangrejo
	if Player.Functions.GetItemByName('crayfish') then
		Player.Functions.RemoveItem('crayfish', 1)
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['crayfish'], "remove")
		Player.Functions.AddMoney('cash', PrecioCangrejos)
	else
		TriggerClientEvent('QBCore:Notify', src, "You have no crabs", 'error')
	end
end)
