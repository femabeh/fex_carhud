local Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57, ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, 
    ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177, ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, 
    ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18, ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182, ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, 
    ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81, ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70, ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, 
    ["DELETE"] = 178, ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173, ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(100)
		local ped = PlayerPedId()
        local vehicle = GetVehiclePedIsIn(ped, false)
		local SpeedMultiplier
		local speed
		local fuel

		if IsPedInAnyVehicle(ped, false) and not IsPauseMenuActive() then
			SendNUIMessage({action = 'toggle', show = true})
			if (Config.Unit == "KMH") then
				SpeedMultiplier = 3.6
			elseif (Config.Unit == "MPH") then
				SpeedMultiplier = 2.237
			else
				TriggerServerEvent("fex_carhud:consolelog", "You have an error in your configuration!")
				StopResource(GetCurrentResourceName())
			end

			speed = GetEntitySpeed(vehicle) * SpeedMultiplier
            fuel = GetVehicleFuelLevel(vehicle)

			SendNUIMessage({action = 'setValue', key = 'car', value = math.floor(speed) .. "&nbsp;" .. Config.Unit})
			SendNUIMessage({action = 'setProgress', key = 'car', value = fuel})
		else
			SendNUIMessage({action = 'toggle', show = false})
		end
  	end
end)