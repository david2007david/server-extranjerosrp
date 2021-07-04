ESX = nil
local doorInfo = {}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('esx_doorlock:updateState')
AddEventHandler('esx_doorlock:updateState', function(doorID, state)
	local xPlayer = ESX.GetPlayerFromId(source)

	if type(doorID) ~= 'number' then print(('esx_doorlock: %s didn\'t send a number!'):format(xPlayer.identifier)) return end
	if type(state) ~= 'boolean' then print(('esx_doorlock: %s attempted to update invalid state!'):format(xPlayer.identifier)) return end
	if not Config.DoorList[doorID] then print(('esx_doorlock: %s attempted to update invalid door!'):format(xPlayer.identifier)) return end

	if not IsAuthorized(xPlayer.job.name, Config.DoorList[doorID]) then
		print(('esx_doorlock: %s was not authorized to open a locked door!'):format(xPlayer.identifier))
		return
	end

	doorInfo[doorID] = state

	TriggerClientEvent('esx_doorlock:setState', -1, doorID, state)
end)

ESX.RegisterServerCallback('esx_doorlock:getDoorInfo', function(source, cb)
	cb(doorInfo)
end)

function IsAuthorized(jobName, doorID)
	for _,job in pairs(doorID.authorizedJobs) do
		if job == jobName then
			return true
		end
	end

	return false
end


-- Plantilla --

--[[{
	textCoords = vector3(0.0, 0.0, 0.0),
	authorizedJobs = {"police"},
	locked = true,
	size = 1,
	distance = 12,
	doors = {
		{
			objName = "Model_name",
			objCoords = vector3(0.0, 0.0, 0.0)
		}
	}
},]]

-- Guardar Config (comando)
RegisterServerEvent('esx_doorlock:SaveOnConfig')
AddEventHandler('esx_doorlock:SaveOnConfig', function(yaw, coords, model, job, entity, distance, garage)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.getGroup() ~= "user" then
		xPlayer.showNotification("~g~Door founded~w~!")
		
		local path = GetResourcePath(GetCurrentResourceName())
		local lines_config = lines_from(path.."/config.lua")

		--------- Retira } to para agregar la otra línea ---------
		for k,v in pairs(lines_config) do
			if k == #lines_config then
				DeleteString(path.."/config.lua", "}") -- Retira } to para agregar la otra línea
			end
		end

		--------- Abrir el archivo ---------
		local file = io.open(path.."/config.lua", "a") -- Modo anexo

		-- Tiene un formato así para editarlo (si tienes que editarlo)
		file:write("\n	{")
		file:write("\n		textCoords = "..coords..",")
		file:write("\n		authorizedJobs = {'"..job.."'},")
		file:write("\n		locked = true,")
		file:write("\n		size = 1,")
		file:write("\n		distance = "..distance..",")
		file:write("\n		doors = {")
		file:write("\n			{")
		file:write("\n				objName = "..model..",")
		if not garage then -- Evita que vuele el garaje
			file:write("\n				objYaw = "..round2(yaw, 2)..",")
		end
		file:write("\n				objCoords = "..coords.."")
		file:write("\n			}")
		file:write("\n		}")
		file:write("\n    },")
		file:write("\n}") -- Cierra el último }
		file:close()
	else
		xPlayer.showNotification("You dont have permission to do that")
	end
end)

function round2(num, numDecimalPlaces)
	return tonumber(string.format("%." .. (numDecimalPlaces or 0) .. "f", num))
end

function DeleteString(path, before)
    local inf = assert(io.open(path, "r+"), "Failed to open input file")
    local lines = ""
    while true do
        local line = inf:read("*line")
		if not line then break end
		
		if line ~= before then lines = lines .. line .. "\n" end
    end
    inf:close()
    file = io.open(path, "w")
    file:write(lines)
    file:close()
end

function lines_from(file)
  lines = {}
  for line in io.lines(file) do 
    lines[#lines + 1] = line
  end
  return lines
end