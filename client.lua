print('^5exHUD^0 - by ^6EYOX')

ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(10)
    end
    while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
    end
    if ESX.IsPlayerLoaded() then

		ESX.PlayerData = ESX.GetPlayerData()

    end
end)

PlayerData = {}

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData    = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5000)
		bank = ESX.GetPlayerData().accounts[1].money
		black_money = ESX.GetPlayerData().accounts[2].money
	end
end)

function datajob()
	SetTextFont(0) 
	SetTextScale(0.3, 0.3) 
	SetTextColour(255, 255, 255, 255) 
	SetTextEntry("STRING")
	AddTextComponentString(ESX.PlayerData.job.label.. " - "..ESX.PlayerData.job.grade_label.."~n~~n~"..ESX.PlayerData.job2.label.. " - " ..ESX.PlayerData.job2.label)
	DrawText(0.87, 0.076) 
	DrawRect(0.93, 0.108, 0.13, 0.08, 0, 0, 0, 200)
end
  
function datamoney()
	SetTextFont(0) 
	SetTextScale(0.3, 0.3) 
	SetTextColour(0, 255, 0, 255) 
	SetTextEntry("STRING")
	AddTextComponentString(ESX.PlayerData.money.."$")
	DrawText(0.835, 0.163) 
	DrawRect(0.905, 0.174, 0.18, 0.03, 0, 0, 0, 200)
end
  
function databank()
	SetTextFont(0) 
	SetTextScale(0.3, 0.3) 
	SetTextColour(19, 171, 216, 255) 
	SetTextEntry("STRING")
	AddTextComponentString(bank.."$~n~")
	DrawText(0.892, 0.163) 
end
  
function datasale()
	SetTextFont(0) 
	SetTextScale(0.3, 0.3) 
	SetTextColour(255, 0, 0, 255) 
	SetTextEntry("STRING")
	AddTextComponentString(black_money.."$~n~")
	DrawText(0.949, 0.163) 
end
  
function dataemj()
	SetTextFont(0) 
	SetTextScale(0.3, 0.3) 
	SetTextColour(0, 255, 0, 255) 
	SetTextEntry("STRING")
	AddTextComponentString("💸                💰                 🧨")
	DrawText(0.82, 0.163)
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5)
		if IsControlPressed(0,244) then
			databank()
			datamoney()
			datajob()
			dataemj()
			datasale()
		end
	end
end)
