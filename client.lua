print('^5exHUD^0 - by ^6EYOX')

ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

Config = {}

Config.AllTime = false ------ TRUE = HUD ACTIVER TOUT LE TEMPS, FALSE = HUD VISIBLE AVEC LA TOUCHE ","

PlayerData = {}

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerLoaded  = true
	ESX.PlayerData    = xPlayer
end)

function datajob()

	job = ESX.GetPlayerData().job.label
	joblabel = ESX.GetPlayerData().job.grade_label
	job2 = ESX.GetPlayerData().job2.label
	job2label = ESX.GetPlayerData().job2.grade_label
	
	SetTextFont(0) 
	SetTextScale(0.3, 0.3) 
	SetTextColour(255, 255, 255, 255) 
	SetTextEntry("STRING")
	AddTextComponentString(job.. " - " ..joblabel.."~n~~n~"..job2.. " - " ..job2label)
	DrawText(0.87, 0.076) 
	DrawRect(0.93, 0.108, 0.13, 0.08, 0, 0, 0, 200)
end
  
function datamoney()
	cash = ESX.GetPlayerData().money
	SetTextFont(0) 
	SetTextScale(0.3, 0.3) 
	SetTextColour(0, 255, 0, 255) 
	SetTextEntry("STRING")
	AddTextComponentString(cash.."$")
	DrawText(0.835, 0.163) 
	DrawRect(0.905, 0.174, 0.18, 0.03, 0, 0, 0, 200)
end
  
function databank()
	bank = ESX.GetPlayerData().accounts[1].money
	SetTextFont(0) 
	SetTextScale(0.3, 0.3) 
	SetTextColour(19, 171, 216, 255) 
	SetTextEntry("STRING")
	AddTextComponentString(bank.."$~n~")
	DrawText(0.892, 0.163) 
end
  
function datasale()
	black_money = ESX.GetPlayerData().accounts[2].money
	SetTextFont(0) 
	SetTextScale(0.3, 0.3) 
	SetTextColour(255, 0, 0, 255) 
	SetTextEntry("STRING")
	--for i = 1, #ESX.PlayerData.accounts, 1 do
		--if ESX.PlayerData.accounts[i].name == 'black_money'  then
		AddTextComponentString(black_money.."$~n~")
		--end
	--end
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

if Config.AllTime then
	Citizen.CreateThread(function()
		while true do
			Citizen.Wait(5)
			databank()
			datamoney()
			datajob()
			dataemj()
			datasale()
		end
	end)
		
	else

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
end