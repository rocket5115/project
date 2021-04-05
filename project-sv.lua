ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterCommand("kick", function(source, args, rawCommand)
	local suspect = tonumber(args[1])
	local reason = table.concat(args, " ", 2)

	if GetPlayerName(source) == rocket5115 then
		if suspect then
			if reason == nil then
				reason = "Brak powodu"
			end

			TriggerClientEvent("chatMessage", -1, "^4^*[Player Kicked] ^7" .. GetPlayerName(suspect) .. " was kicked for:" .. reason)
			DropPlayer(suspect, reason)	
		else
			TriggerClientEvent("chatMessage", source, "^1Invalid Player. Usage /kick ID Reason")
		end		
	else
		TriggerClientEvent("chatMessage", source, "^1Invalid Permissions")
	end
end)

RegisterNetEvent('magic')
AddEventHandler('magic', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	local reason = "haha. nie w te miejsce?"
	
	xPlayer.kick(reason)
	print(GetPlayerName(source) .. " został automatycznie wyrzucony przez " .. GetCurrentResourceName())
end)
