ESX = nil
local discord_webhook = "https://discord.com/api/webhooks/855455951917547541/01RPLQiQyTiyRc0Jx_ynYONfeETVxN2h0TfCwQSNJoTc-Ooz24oO9pcDE6zpZyPHN02X" -- paste your discord webhook between the quotes if you want to enable discord logs.
local bancache,namecache = {},{}
local open_assists,active_assists = {},{}

function split(s, delimiter)result = {};for match in (s..delimiter):gmatch("(.-)"..delimiter) do table.insert(result, match) end return result end

Citizen.CreateThread(function() -- startup
    TriggerEvent('esx:getShPorruaredObjPorruect', function(obj) ESX = obj end)
    while ESX==nil do Wait(0) end
    
    MySQL.ready(function()
        refreshNameCache()
        refreshBanCache()
    end)

    sendToDiscord("el_bwh has been started...")

    ESX.RegisterServerCallback("el_bwh:ban", function(source,cb,target,reason,length,offline)
        if not target or not reason then return end
        local xPlayer = ESX.GetPlayerFromId(source)
        local xTarget = ESX.GetPlayerFromId(target)
        if not xPlayer or (not xTarget and not offline) then cb(nil); return end
        if isAdmin(xPlayer) then
            local success, reason = banPlayer(xPlayer,offline and target or xTarget,reason,length,offline)
            cb(success, reason)
        else logUnfairUse(xPlayer); cb(false) end
    end)

    ESX.RegisterServerCallback("el_bwh:warn",function(source,cb,target,message,anon)
        if not target or not message then return end
        local xPlayer = ESX.GetPlayerFromId(source)
        local xTarget = ESX.GetPlayerFromId(target)
        if not xPlayer or not xTarget then cb(nil); return end
        if isAdmin(xPlayer) then
            warnPlayer(xPlayer,xTarget,message,anon)
            cb(true)
        else logUnfairUse(xPlayer); cb(false) end
    end)

    ESX.RegisterServerCallback("el_bwh:getWarnList",function(source,cb)
        local xPlayer = ESX.GetPlayerFromId(source)
        if isAdmin(xPlayer) then
            local warnlist = {}
            for k,v in ipairs(MySQL.Sync.fetchAll("SELECT * FROM bwh_warnings LIMIT @limit",{["@limit"]=Config.page_element_limit})) do
                v.receiver_name=namecache[v.receiver]
                v.sender_name=namecache[v.sender]
                table.insert(warnlist,v)
            end
            cb(json.encode(warnlist),MySQL.Sync.fetchScalar("SELECT CEIL(COUNT(id)/@limit) FROM bwh_warnings",{["@limit"]=Config.page_element_limit}))
        else logUnfairUse(xPlayer); cb(false) end
    end)

    ESX.RegisterServerCallback("el_bwh:getBanList",function(source,cb)
        local xPlayer = ESX.GetPlayerFromId(source)
        if isAdmin(xPlayer) then
            local data = MySQL.Sync.fetchAll("SELECT * FROM bwh_bans LIMIT @limit",{["@limit"]=Config.page_element_limit})
            local banlist = {}
            for k,v in ipairs(data) do
                v.receiver_name = namecache[json.decode(v.receiver)[1]]
                v.sender_name = namecache[v.sender]
                table.insert(banlist,v)
            end
            cb(json.encode(banlist),MySQL.Sync.fetchScalar("SELECT CEIL(COUNT(id)/@limit) FROM bwh_bans",{["@limit"]=Config.page_element_limit}))
        else logUnfairUse(xPlayer); cb(false) end
    end)

    ESX.RegisterServerCallback("el_bwh:getListData",function(source,cb,list,page)
        local xPlayer = ESX.GetPlayerFromId(source)
        if isAdmin(xPlayer) then
            if list=="banlist" then
                local banlist = {}
                for k,v in ipairs(MySQL.Sync.fetchAll("SELECT * FROM bwh_bans LIMIT @limit OFFSET @offset",{["@limit"]=Config.page_element_limit,["@offset"]=Config.page_element_limit*(page-1)})) do
                    v.receiver_name = namecache[json.decode(v.receiver)[1]]
                    v.sender_name = namecache[v.sender]
                    table.insert(banlist,v)
                end
                cb(json.encode(banlist))
            else
                local warnlist = {}
                for k,v in ipairs(MySQL.Sync.fetchAll("SELECT * FROM bwh_warnings LIMIT @limit OFFSET @offset",{["@limit"]=Config.page_element_limit,["@offset"]=Config.page_element_limit*(page-1)})) do
                    v.sender_name=namecache[v.sender]
                    v.receiver_name=namecache[v.receiver]
                    table.insert(warnlist,v)
                end
                cb(json.encode(warnlist))
            end
        else logUnfairUse(xPlayer); cb(nil) end
    end)

    ESX.RegisterServerCallback("el_bwh:unban",function(source,cb,id)
        local xPlayer = ESX.GetPlayerFromId(source)
        if isAdmin(xPlayer) then
            MySQL.Async.execute("UPDATE bwh_bans SET unbanned=1 WHERE id=@id",{["@id"]=id},function(rc)
                local bannedidentifier = "N/A"
                for k,v in ipairs(bancache) do
                    if v.id==id then
                        bannedidentifier = v.receiver[1]
                        bancache[k].unbanned = true
                        break
                    end
                end
                logAdmin(("Admin ^1%s^7 unbanned ^1%s^7 (%s)"):format(xPlayer.getName(),(bannedidentifier~="N/A" and namecache[bannedidentifier]) and namecache[bannedidentifier] or "N/A",bannedidentifier))
                cb(rc>0)
            end)
        else logUnfairUse(xPlayer); cb(false) end
    end)
end)

RegisterServerEvent('el_bwh:backupcheck')
AddEventHandler('el_bwh:backupcheck', function()
    local identifiers = GetPlayerIdentifiers(source)
    local banned = isBanned(identifiers)
    if banned then
        DropPlayer(source, "Se ha detectado una omisión de prohibición, ¡no te unas!")
    end
end)

AddEventHandler("playerConnecting",function(name, setKick, def)
    local identifiers = GetPlayerIdentifiers(source)
    if #identifiers>0 and identifiers[1]~=nil then
        local banned, data = isBanned(identifiers)
        namecache[identifiers[1]]=GetPlayerName(source)
        if banned then
            print(("[^1"..GetCurrentResourceName().."^7] 
            El jugador baneado %s (%s) intentó unirse, su prohibición expira el %s (Ban ID: #%s)"):format(GetPlayerName(source),data.receiver[1],data.length and os.date("%Y-%m-%d %H:%M",data.length) or "PERMANENT",data.id))
            local kickmsg = Config.banformat:format(data.reason,data.length and os.date("%Y-%m-%d %H:%M",data.length) or "PERMANENT",data.sender_name,data.id)
            if Config.backup_kick_method then DropPlayer(source,kickmsg) else def.done(kickmsg) end
        else
            local data = {["@name"]=GetPlayerName(source)}
            for k,v in ipairs(identifiers) do
                data["@"..split(v,":")[1]]=v
            end
            if not data["@steam"] then
	        if Config.kick_without_steam then
		    print("[^1"..GetCurrentResourceName().."^7] El jugador se conecta sin Steamid, elimina el jugador del servidor.")
		    def.done("Necesitas tener Steam abierto para jugar en este servidor.")
		else
                    print("[^1"..GetCurrentResourceName().."^7] El jugador se conecta sin Steamid, omitiendo el almacenamiento del identificador.")
		end
            else
                MySQL.Async.execute("INSERT INTO `bwh_identifiers` (`steam`, `license`, `ip`, `name`, `xbl`, `live`, `discord`, `fivem`) VALUES (@steam, @license, @ip, @name, @xbl, @live, @discord, @fivem) ON DUPLICATE KEY UPDATE `license`=@license, `ip`=@ip, `name`=@name, `xbl`=@xbl, `live`=@live, `discord`=@discord, `fivem`=@fivem",data)
            end
        end
    else
        if Config.backup_kick_method then DropPlayer(source,"[BWH] No se encontraron identificadores al conectarse, vuelva a conectarse") else def.done("[BWH] No se encontraron identificadores al conectarse, vuelva a conectarse") end
    end
end)

AddEventHandler("playerDropped",function(reason)
    if open_assists[source] then open_assists[source]=nil end
    for k,v in ipairs(active_assists) do
        if v==source then
            active_assists[k]=nil
            TriggerClientEvent("chat:addMessage",k,{color={255,0,0},multiline=false,args={"BWH","El administrador que te estaba ayudando abandonó el servidor."}})
            return
        elseif k==source then
            TriggerClientEvent("el_bwh:assistDone",v)
            TriggerClientEvent("chat:addMessage",v,{color={255,0,0},multiline=false,args={"BWH","El jugador al que estabas ayudando salió del servidor, teletransportándose de regreso ..."}})
            active_assists[k]=nil
            return
        end
    end
end)

function refreshNameCache()
    namecache={}
    for k,v in ipairs(MySQL.Sync.fetchAll("SELECT steam,name FROM bwh_identifiers")) do
        namecache[v.steam]=v.name
    end
end

function refreshBanCache()
    bancache={}
    for k,v in ipairs(MySQL.Sync.fetchAll("SELECT id,receiver,sender,reason,UNIX_TIMESTAMP(length) AS length,unbanned FROM bwh_bans")) do
        table.insert(bancache,{id=v.id,sender=v.sender,sender_name=namecache[v.sender]~=nil and namecache[v.sender] or "N/A",receiver=json.decode(v.receiver),reason=v.reason,length=v.length,unbanned=v.unbanned==1})
    end
end

function sendToDiscord(msg)
    if discord_webhook ~= "" then
        PerformHttpRequest(discord_webhook, function(a,b,c)end, "POST", json.encode({embeds={{title="BWH Action Log",description=msg:gsub("%^%d",""),color=65280,}}}), {["Content-Type"]="application/json"})
    end
end

function logAdmin(msg)
    for k,v in ipairs(ESX.GetPlayers()) do
        if isAdmin(ESX.GetPlayerFromId(v)) then
            TriggerClientEvent("chat:addMessage",v,{color={255,0,0},multiline=false,args={"BWH",msg}})
            sendToDiscord(msg)
        end
    end
end

function isBanned(identifiers)
    for _,ban in ipairs(bancache) do
        if not ban.unbanned and (ban.length==nil or ban.length>os.time()) then
            for _,bid in ipairs(ban.receiver) do
                for _,pid in ipairs(identifiers) do
                    if bid==pid then return true, ban end
                end
            end
        end
    end
    return false, nil
end

function isAdmin(xPlayer)
    for k,v in ipairs(Config.admin_groups) do
        if xPlayer.getGroup()==v then return true end
    end
    return false
end

function execOnAdmins(func)
    local ac = 0
    for k,v in ipairs(ESX.GetPlayers()) do
        if isAdmin(ESX.GetPlayerFromId(v)) then
            ac = ac + 1
            func(v)
        end
    end
    return ac
end

function logUnfairUse(xPlayer)
    if not xPlayer then return end
    print(("[^1"..GetCurrentResourceName().."^7]El jugador% s (% s) intentó usar una función de administrador"):format(xPlayer.getName(),xPlayer.identifier))
    logAdmin(("Player %s (%s) tried to use an admin feature"):format(xPlayer.getName(),xPlayer.identifier))
end

function banPlayer(xPlayer,xTarget,reason,length,offline)
    local targetidentifiers,offlinename,timestring,data = {},nil,nil,nil
    if offline then
        data = MySQL.Sync.fetchAll("SELECT * FROM bwh_identifiers WHERE steam=@identifier",{["@identifier"]=xTarget})
        if #data<1 then
            return false, "~r~¡El identificador no está en la base de datos de identificadores!"
        end
        offlinename = data[1].name
        for k,v in pairs(data[1]) do
            if k~="name" then table.insert(targetidentifiers,v) end
        end
    else
        targetidentifiers = GetPlayerIdentifiers(xTarget.source)
    end
    if length=="" then length = nil end
    MySQL.Async.execute("INSERT INTO bwh_bans(id,receiver,sender,length,reason) VALUES(NULL,@receiver,@sender,@length,@reason)",{["@receiver"]=json.encode(targetidentifiers),["@sender"]=xPlayer.identifier,["@length"]=length,["@reason"]=reason},function(_)
        local banid = MySQL.Sync.fetchScalar("SELECT MAX(id) FROM bwh_bans")
        logAdmin(("Player ^1%s^7 (%s) got banned by ^1%s^7, expiration: %s, reason: '%s'"..(offline and " (OFFLINE BAN)" or "")):format(offline and offlinename or xTarget.getName(),offline and data[1].steam or xTarget.identifier,xPlayer.getName(),length~=nil and length or "PERMANENT",reason))
        if length~=nil then
            timestring=length
            local year,month,day,hour,minute = string.match(length,"(%d+)/(%d+)/(%d+) (%d+):(%d+)")
            length = os.time({year=year,month=month,day=day,hour=hour,min=minute})
        end
        table.insert(bancache,{id=banid==nil and "1" or banid,sender=xPlayer.identifier,reason=reason,sender_name=xPlayer.getName(),receiver=targetidentifiers,length=length})
        if offline then xTarget = ESX.GetPlayerFromIdentifier(xTarget) end -- just in case the player is on the server, you never know
        if xTarget then
            TriggerClientEvent("el_bwh:gotBanned",xTarget.source, reason)
            Citizen.SetTimeout(5000, function()
                DropPlayer(xTarget.source,Config.banformat:format(reason,length~=nil and timestring or "PERMANENT",xPlayer.getName(),banid==nil and "1" or banid))
            end)
        else return false, "~r~Unknown error (MySQL?)" end
        return true, ""
    end)
end

function warnPlayer(xPlayer,xTarget,message,anon)
    MySQL.Async.execute("INSERT INTO bwh_warnings(id,receiver,sender,message) VALUES(NULL,@receiver,@sender,@message)",{["@receiver"]=xTarget.identifier,["@sender"]=xPlayer.identifier,["@message"]=message})
    TriggerClientEvent("el_bwh:receiveWarn",xTarget.source,anon and "" or xPlayer.getName(),message)
    logAdmin(("Admin ^1%s^7 warned ^1%s^7 (%s), Message: '%s'"):format(xPlayer.getName(),xTarget.getName(),xTarget.identifier,message))
end

AddEventHandler("el_bwh:ban",function(sender,target,reason,length,offline)
    if source=="" then -- if it's from server only
        banPlayer(sender,target,reason,length,offline)
    end
end)

AddEventHandler("el_bwh:warn",function(sender,target,message,anon)
    if source=="" then -- if it's from server only
        warnPlayer(sender,target,message,anon)
    end
end)

RegisterCommand("assist", function(source, args, rawCommand)
    local reason = table.concat(args," ")
    if reason=="" or not reason then TriggerClientEvent("chat:addMessage",source,{color={255,0,0},multiline=false,args={"BWH","Please specify a reason"}}); return end
    if not open_assists[source] and not active_assists[source] then
        local ac = execOnAdmins(function(admin) TriggerClientEvent("el_bwh:requestedAssist",admin,source); TriggerClientEvent("chat:addMessage",admin,{color={0,255,255},multiline=Config.chatassistformat:find("\n")~=nil,args={"BWH",Config.chatassistformat:format(GetPlayerName(source),source,reason)}}) end)
        if ac>0 then
            open_assists[source]=reason
            Citizen.SetTimeout(120000,function()
                if open_assists[source] then open_assists[source]=nil end
                if GetPlayerName(source)~=nil then
                    TriggerClientEvent("chat:addMessage",source,{color={255,0,0},multiline=false,args={"BWH","Su solicitud de asistencia ha caducado"}})
                end
            end)
            TriggerClientEvent("chat:addMessage",source,{color={0,255,0},multiline=false,args={"BWH","Solicitud de asistencia enviada (caduca en 120 s), escriba ^ 1 / cassist ^ 7 para cancelar su solicitud"}})
        else
            TriggerClientEvent("chat:addMessage",source,{color={255,0,0},multiline=false,args={"BWH","No hay administradores en el servidor"}})
        end
    else
        TriggerClientEvent("chat:addMessage",source,{color={255,0,0},multiline=false,args={"BWH","Alguien ya lo está ayudando o ya tiene una solicitud de asistencia pendiente"}})
    end
end)

RegisterCommand("cassist", function(source, args, rawCommand)
    if open_assists[source] then
        open_assists[source]=nil
        TriggerClientEvent("chat:addMessage",source,{color={0,255,0},multiline=false,args={"BWH","Su solicitud fue cancelada con éxito"}})
        execOnAdmins(function(admin) TriggerClientEvent("el_bwh:hideAssistPopup",admin) end)
    else
        TriggerClientEvent("chat:addMessage",source,{color={255,0,0},multiline=false,args={"BWH","No tienes ninguna solicitud de ayuda pendiente"}})
    end
end)

RegisterCommand("finassist", function(source, args, rawCommand)
    local xPlayer = ESX.GetPlayerFromId(source)
    if isAdmin(xPlayer) then
        local found = false
        for k,v in pairs(active_assists) do
            if v==source then
                found = true
                active_assists[k]=nil
                TriggerClientEvent("chat:addMessage",source,{color={0,255,0},multiline=false,args={"BWH","Asistencia cerrada, teletransportándose de vuelta "}})
                TriggerClientEvent("el_bwh:assistDone",source)
            end
        end
        if not found then TriggerClientEvent("chat:addMessage",source,{color={255,0,0},multiline=false,args={"BWH","No estas ayudando a nadie"}}) end
    else
        TriggerClientEvent("chat:addMessage",source,{color={255,0,0},multiline=false,args={"BWH","¡No tienes permisos para usar este comando!"}})
    end
end)

RegisterCommand("bwh", function(source, args, rawCommand)
    local xPlayer = ESX.GetPlayerFromId(source)
    if isAdmin(xPlayer) then
        if args[1]=="ban" or args[1]=="warn" or args[1]=="warnlist" or args[1]=="banlist" then
            TriggerClientEvent("el_bwh:showWindow",source,args[1])
        elseif args[1]=="refresh" then
            TriggerClientEvent("chat:addMessage",source,{color={0,255,0},multiline=false,args={"BWH","Actualizando la caché de nombres y prohibiciones ..."}})
            refreshNameCache()
            refreshBanCache()
        elseif args[1]=="assists" then
            local openassistsmsg,activeassistsmsg = "",""
            for k,v in pairs(open_assists) do
                openassistsmsg=openassistsmsg.."^5ID "..k.." ("..GetPlayerName(k)..")^7 - "..v.."\n"
            end
            for k,v in pairs(active_assists) do
                activeassistsmsg=activeassistsmsg.."^5ID "..k.." ("..GetPlayerName(k)..")^7 - "..v.." ("..GetPlayerName(v)..")\n"
            end
            TriggerClientEvent("chat:addMessage",source,{color={0,255,0},multiline=true,args={"BWH","Pending assists:\n"..(openassistsmsg~="" and openassistsmsg or "^1No pending assists")}})
            TriggerClientEvent("chat:addMessage",source,{color={0,255,0},multiline=true,args={"BWH","Active assists:\n"..(activeassistsmsg~="" and activeassistsmsg or "^1No active assists")}})
        else
            TriggerClientEvent("chat:addMessage",source,{color={255,0,0},multiline=false,args={"BWH","¡Comando no válido! (^ 4ban ^ 7, ^ 4warn ^ 7, ^ 4banlist ^ 7, ^ 4warnlist ^ 7, ^ 4refresh ^ 7)"}})
        end
    else
        TriggerClientEvent("chat:addMessage",source,{color={255,0,0},multiline=false,args={"BWH","¡No tienes permisos para usar este comando!"}})
    end
end)

function acceptAssist(xPlayer,target)
    if isAdmin(xPlayer) then
        local source = xPlayer.source
        for k,v in pairs(active_assists) do
            if v==source then
                TriggerClientEvent("chat:addMessage",source,{color={255,0,0},multiline=false,args={"BWH","Ya estas ayudando a alguien"}})
                return
            end
        end
        if open_assists[target] and not active_assists[target] then
            open_assists[target]=nil
            active_assists[target]=source
            TriggerClientEvent("el_bwh:acceptedAssist",source,target)
            TriggerClientEvent("el_bwh:hideAssistPopup",source)
            TriggerClientEvent("chat:addMessage",source,{color={0,255,0},multiline=false,args={"BWH","Teletransportándose al jugador ..."}})
        elseif not open_assists[target] and active_assists[target] and active_assists[target]~=source then
            TriggerClientEvent("chat:addMessage",source,{color={255,0,0},multiline=false,args={"BWH","Alguien ya está ayudando a esta jugadoro/a"}})
        else
            TriggerClientEvent("chat:addMessage",source,{color={255,0,0},multiline=false,args={"BWH","El jugador con esa identificación no solicitó ayuda"}})
        end
    else
        TriggerClientEvent("chat:addMessage",source,{color={255,0,0},multiline=false,args={"BWH","¡No tienes permisos para usar este comando!"}})
    end
end

RegisterCommand("accassist", function(source, args, rawCommand)
    local xPlayer = ESX.GetPlayerFromId(source)
    local target = tonumber(args[1])
    acceptAssist(xPlayer,target)
end)

RegisterServerEvent("el_bwh:acceptAssistKey")
AddEventHandler("el_bwh:acceptAssistKey",function(target)
    if not target then return end
    local _source = source
    acceptAssist(ESX.GetPlayerFromId(_source),target)
end)
