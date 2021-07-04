ESX = nil
local job1, job2
local job1_grade, job2_grade
local timer = 0
local sleepThread = 1000
local allowCommand = true

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getShPorruaredObjPorruect', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	ESX.PlayerData = ESX.GetPlayerData()
end)

RegisterCommand("cambiartrabajo", function (src, args, raw)
    if timer == 0 and allowCommand then
        TriggerServerEvent('sqz_switchjob:getSecondJob')
        timer = 30
        allowCommand = false
    else
        TriggerEvent("mole_notifications:SendNotification",{
            text = 'Tienes que esperar 30 segundos, ahora tienes que esperar: (tiempo en segundos) '..timer,
            type = "error",
            timeout = (3000),
            layout = "bottomcenter",
            queue = "global"
        })
    end
end, false)

RegisterNetEvent('sqz_switchjob:returnSecondJob')
AddEventHandler('sqz_switchjob:returnSecondJob', function(secondjob, secondjob_grade)
    job2 = secondjob
    job2_grade = secondjob_grade
    job1 = ESX.PlayerData.job.name
    job1_grade = ESX.PlayerData.job.grade
    TriggerServerEvent('sqz_switchjob:setSecondJob', job1, job1_grade, job2, job2_grade)
    TriggerEvent("mole_notifications:SendNotification",{
        text = "<b style='color:#FF33F3'>Has cambiado de trabajo.</b>",
        type = "error",
        timeout = (3000),
        layout = "bottomcenter",
        queue = "global"
    })
    Wait(5000)
    TriggerEvent("mole_notifications:SendNotification",{
        text = 'Tu trabajo actual es: '..ESX.PlayerData.job.label..' y tu calificación laboral es: '..ESX.PlayerData.job.grade_label,
        type = "error",
        timeout = (3000),
        layout = "bottomcenter",
        queue = "global"
    })
end)

Citizen.CreateThread(function()
    
    while true do
        if timer > 1 then
            timer = timer-1  
        elseif timer == 1 then
            allowCommand = true
            timer = 0
        end
        Citizen.Wait(sleepThread)
    end
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)