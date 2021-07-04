function taskBar(time, text)
	SendNUIMessage({
		time = time,
		text = text
	})
end

RegisterNetEvent('np-taskbar:taskBar')
AddEventHandler('np-taskbar:taskBar', function(time, text)
	taskBar(time, text)
end)
