local a = "~u~LR-AC ~s~Menu"
local b = false
local c = false
local d = false
local e = true
local f = false
local g = false
local h = false
local i = false
TriggerServerEvent("CarlosLR-AC:adminmenuenable")
RegisterNetEvent("CarlosLR-AC:adminmenuenabley")
AddEventHandler(
    "CarlosLR-AC:adminmenuenabley",
    function()
        e = false
        b = false
        c = false
        d = false
    end
)
local j = {}
j.debug = false
local k = {}
local l = {up = 172, down = 173, left = 174, right = 175, select = 176, back = 177}
local m = 0
local n = nil
local o = nil
local p = 0.21
local q = 0.10
local r = 0.03
local s = 0.9
local t = 0.040
local u = 6
local w = 0.470
local A = 0.005
local B = 0.005
local C = _U("welcome")
local function D(E, F, G)
    if E and k[E] then
        k[E][F] = G
    end
end
local function H(E)
    if E and k[E] then
        return k[E].visible
    else
        return false
    end
end
local function I(E, J, K)
    if E and k[E] then
        D(E, "visible", J)
        if not K and k[E] then
            D(E, "currentOption", 1)
        end
        if J then
            if E ~= o and H(o) then
                I(o, false)
            end
            o = E
        end
    end
end
local function L(M, x, y, N, O, P, Q, R, S)
    SetTextColour(O.r, O.g, O.b, O.a)
    SetTextFont(N)
    SetTextScale(P, P)
    if R then
        SetTextDropShadow(2, 2, 0, 0, 0)
    end
    if k[o] then
        if Q then
            SetTextCentre(Q)
        elseif S then
            SetTextWrap(k[o].x, k[o].x + p - A)
            SetTextRightJustify(true)
        end
    end
    SetTextEntry("STRING")
    AddTextComponentString(M)
    DrawText(x, y)
end
local function T(x, y, U, height, O)
    DrawRect(x, y, U, height, O.r, O.g, O.b, O.a)
end
local function V()
    if k[o] then
        local x = k[o].x + p / 2
        local y = k[o].y + q / 2
        if k[o].titleBackgroundSprite then
            DrawSprite(
                k[o].titleBackgroundSprite.dict,
                k[o].titleBackgroundSprite.name,
                x,
                y,
                p,
                q,
                0.,
                255,
                255,
                255,
                255
            )
        else
            T(x, y, p, q, k[o].titleBackgroundColor)
        end
        L(k[o].title, x, y - q / 2 + r, k[o].titleFont, k[o].titleColor, s, true)
    end
end
local function W()
    if k[o] then
        local x = k[o].x + p / 2
        local y = k[o].y + q + t / 2
        local X = {
            r = k[o].titleBackgroundColor.r,
            g = k[o].titleBackgroundColor.g,
            b = k[o].titleBackgroundColor.b,
            a = 255
        }
        T(x, y, p, t, k[o].subTitleBackgroundColor)
        L(k[o].subTitle, k[o].x + A, y - t / 2 + B, u, X, w, false)
        if m > k[o].maxOptionCount then
            L(
                tostring(k[o].currentOption) .. " / " .. tostring(m),
                k[o].x + p,
                y - t / 2 + B,
                u,
                X,
                w,
                false,
                false,
                true
            )
        end
    end
end
local function Y(M, Z)
    local x = k[o].x + p / 2
    local _ = nil
    if k[o].currentOption <= k[o].maxOptionCount and m <= k[o].maxOptionCount then
        _ = m
    elseif m > k[o].currentOption - k[o].maxOptionCount and m <= k[o].currentOption then
        _ = m - (k[o].currentOption - k[o].maxOptionCount)
    end
    if _ then
        local y = k[o].y + q + t + t * _ - t / 2
        local a0 = nil
        local a1 = nil
        local a2 = nil
        local R = false
        if k[o].currentOption == m then
            a0 = k[o].menuFocusBackgroundColor
            a1 = k[o].menuFocusTextColor
            a2 = k[o].menuFocusTextColor
        else
            a0 = k[o].menuBackgroundColor
            a1 = k[o].menuTextColor
            a2 = k[o].menuSubTextColor
            R = true
        end
        T(x, y, p, t, a0)
        L(M, k[o].x + A, y - t / 2 + B, u, a1, w, false, R)
        if Z then
            L(Z, k[o].x + A, y - t / 2 + B, u, a2, w, false, R, true)
        end
    end
end
function j.CreateMenu(E, a3)
    k[E] = {}
    k[E].title = a3
    k[E].subTitle = C
    k[E].visible = false
    k[E].previousMenu = nil
    k[E].aboutToBeClosed = false
    k[E].x = 0.75
    k[E].y = 0.35
    k[E].currentOption = 1
    k[E].maxOptionCount = 10
    k[E].titleFont = 6
    k[E].titleColor = {r = 255, g = 255, b = 255, a = 255}
    Citizen.CreateThread(
        function()
            while true do
                Citizen.Wait(0)
                k[E].titleBackgroundColor = {r = 0, g = 204, b = 255, a = 105}
                k[E].menuFocusBackgroundColor = {r = 0, g = 204, b = 255, a = 100}
            end
        end
    )
    k[E].titleBackgroundSprite = nil
    k[E].menuTextColor = {r = 255, g = 255, b = 255, a = 255}
    k[E].menuSubTextColor = {r = 189, g = 189, b = 189, a = 255}
    k[E].menuFocusTextColor = {r = 255, g = 255, b = 255, a = 255}
    k[E].menuBackgroundColor = {r = 0, g = 0, b = 0, a = 100}
    k[E].subTitleBackgroundColor = {
        r = k[E].menuBackgroundColor.r,
        g = k[E].menuBackgroundColor.g,
        b = k[E].menuBackgroundColor.b,
        a = 255
    }
    k[E].buttonPressedSound = {name = "~h~~r~> ~s~SELECT", set = "HUD_FRONTEND_DEFAULT_SOUNDSET"}
end
function j.CreateSubMenu(E, a4, a5)
    if k[a4] then
        j.CreateMenu(E, k[a4].title)
        if a5 then
            D(E, "subTitle", a5)
        else
            D(E, "subTitle", k[a4].subTitle)
        end
        D(E, "previousMenu", a4)
        D(E, "x", k[a4].x)
        D(E, "y", k[a4].y)
        D(E, "maxOptionCount", k[a4].maxOptionCount)
        D(E, "titleFont", k[a4].titleFont)
        D(E, "titleColor", k[a4].titleColor)
        D(E, "titleBackgroundColor", k[a4].titleBackgroundColor)
        D(E, "titleBackgroundSprite", k[a4].titleBackgroundSprite)
        D(E, "menuTextColor", k[a4].menuTextColor)
        D(E, "menuSubTextColor", k[a4].menuSubTextColor)
        D(E, "menuFocusTextColor", k[a4].menuFocusTextColor)
        D(E, "menuFocusBackgroundColor", k[a4].menuFocusBackgroundColor)
        D(E, "menuBackgroundColor", k[a4].menuBackgroundColor)
        D(E, "subTitleBackgroundColor", k[a4].subTitleBackgroundColor)
    end
end
function j.CurrentMenu()
    return o
end
function j.OpenMenu(E)
    if E and k[E] then
        PlaySoundFrontend(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
        I(E, true)
        if k[E].titleBackgroundSprite then
            RequestStreamedTextureDict(k[E].titleBackgroundSprite.dict, false)
            while not HasStreamedTextureDictLoaded(k[E].titleBackgroundSprite.dict) do
                Citizen.Wait(0)
            end
        end
    end
end
function j.IsMenuOpened(E)
    return H(E)
end
function j.CloseMenu()
    if k[o] then
        if k[o].aboutToBeClosed then
            k[o].aboutToBeClosed = false
            I(o, false)
            PlaySoundFrontend(-1, "QUIT", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
            m = 0
            o = nil
            n = nil
        else
            k[o].aboutToBeClosed = true
        end
    end
end
function j.Button(M, Z)
    local a6 = M
    if Z then
        a6 = "{ " .. tostring(a6) .. ", " .. tostring(Z) .. " }"
    end
    if k[o] then
        m = m + 1
        local a7 = k[o].currentOption == m
        Y(M, Z)
        if a7 then
            if n == l.select then
                PlaySoundFrontend(-1, k[o].buttonPressedSound.name, k[o].buttonPressedSound.set, true)
                return true
            elseif n == l.left or n == l.right then
                PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
            end
        end
        return false
    else
        return false
    end
end
function j.MenuButton(M, E)
    if k[E] then
        if j.Button(M) then
            I(o, false)
            I(E, true, true)
            return true
        end
    end
    return false
end
function j.CheckBox(M, bool, a8)
    local a9 = "~r~~h~OFF"
    if bool then
        a9 = "~g~~h~ON"
    end
    if j.Button(M, a9) then
        bool = not bool
        a8(bool)
        return true
    end
    return false
end
function TSE(aa, ab, ac, ad, ae, af, ag, ah, ai, aj)
    TriggerServerEvent(aa, ab, ac, ad, ae, af, ag, ah, ai, aj)
end
function j.Display()
    if H(o) then
        if k[o].aboutToBeClosed then
            j.CloseMenu()
        else
            ClearAllHelpMessages()
            V()
            W()
            n = nil
            if IsDisabledControlJustPressed(0, l.down) then
                PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
                if k[o].currentOption < m then
                    k[o].currentOption = k[o].currentOption + 1
                else
                    k[o].currentOption = 1
                end
            elseif IsDisabledControlJustPressed(0, l.up) then
                PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
                if k[o].currentOption > 1 then
                    k[o].currentOption = k[o].currentOption - 1
                else
                    k[o].currentOption = m
                end
            elseif IsDisabledControlJustPressed(0, l.left) then
                n = l.left
            elseif IsDisabledControlJustPressed(0, l.right) then
                n = l.right
            elseif IsDisabledControlJustPressed(0, l.select) then
                n = l.select
            elseif IsDisabledControlJustPressed(0, l.back) then
                if k[k[o].previousMenu] then
                    PlaySoundFrontend(-1, "BACK", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
                    I(k[o].previousMenu, true)
                else
                    j.CloseMenu()
                end
            end
            m = 0
        end
    end
end
function j.SetMenuWidth(E, U)
    D(E, "width", U)
end
function j.SetMenuX(E, x)
    D(E, "x", x)
end
function j.SetMenuY(E, y)
    D(E, "y", y)
end
function j.SetMenuMaxOptionCountOnScreen(E, ak)
    D(E, "maxOptionCount", ak)
end
function j.SetTitleColor(E, al, ag, ab, aa)
    D(E, "titleColor", {["r"] = al, ["g"] = ag, ["b"] = ab, ["a"] = aa or k[E].titleColor.a})
end
function j.SetTitleBackgroundColor(E, al, ag, ab, aa)
    D(E, "titleBackgroundColor", {["r"] = al, ["g"] = ag, ["b"] = ab, ["a"] = aa or k[E].titleBackgroundColor.a})
end
function j.SetTitleBackgroundSprite(E, am, an)
    D(E, "titleBackgroundSprite", {dict = am, name = an})
end
function j.SetSubTitle(E, M)
    D(E, "subTitle", M)
end
function j.SetMenuBackgroundColor(E, al, ag, ab, aa)
    D(E, "menuBackgroundColor", {["r"] = al, ["g"] = ag, ["b"] = ab, ["a"] = aa or k[E].menuBackgroundColor.a})
end
function j.SetMenuTextColor(E, al, ag, ab, aa)
    D(E, "menuTextColor", {["r"] = al, ["g"] = ag, ["b"] = ab, ["a"] = aa or k[E].menuTextColor.a})
end
function j.SetMenuSubTextColor(E, al, ag, ab, aa)
    D(E, "menuSubTextColor", {["r"] = al, ["g"] = ag, ["b"] = ab, ["a"] = aa or k[E].menuSubTextColor.a})
end
function j.SetMenuFocusColor(E, al, ag, ab, aa)
    D(E, "menuFocusColor", {["r"] = al, ["g"] = ag, ["b"] = ab, ["a"] = aa or k[E].menuFocusColor.a})
end
function j.SetMenuButtonPressedSound(E, ao, ap)
    D(E, "buttonPressedSound", {["name"] = ao, ["set"] = ap})
end
function RespawnPed(ped, aq, ar)
    SetEntityCoordsNoOffset(ped, aq.x, aq.y, aq.z, false, false, false, true)
    NetworkResurrectLocalPlayer(aq.x, aq.y, aq.z, ar, true, false)
    SetPlayerInvincible(ped, false)
    ClearPedBloodDamage(ped)
end
function KeyboardInput(as, at, au)
    AddTextEntry("FMMC_KEY_TIP1", as .. ":")
    DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", at, "", "", "", au)
    blockinput = true
    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
        Citizen.Wait(0)
    end
    if UpdateOnscreenKeyboard() ~= 2 then
        AddTextEntry("FMMC_KEY_TIP1", "")
        local av = GetOnscreenKeyboardResult()
        Citizen.Wait(500)
        blockinput = false
        return av
    else
        AddTextEntry("FMMC_KEY_TIP1", "")
        Citizen.Wait(500)
        blockinput = false
        return nil
    end
end
function DrawText3D(x, y, z, M, al, ag, ab)
    SetDrawOrigin(x, y, z, 0)
    SetTextFont(2)
    SetTextProportional(0)
    SetTextScale(0.0, 0.35)
    SetTextColour(al, ag, ab, 255)
    SetTextDropshadow(0, 0, 0, 0, 255)
    SetTextEdge(2, 0, 0, 0, 150)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(M)
    DrawText(0.0, 0.0)
    ClearDrawOrigin()
end
function math.round(aw, ax)
    return tonumber(string.format("%." .. (ax or 0) .. "f", aw))
end
local function ay(M, az)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(M)
    DrawNotification(az, false)
end
local aA = "LR-AC"
local aB = a
local aC = "SelfMenu"
local aD = "TeleportMenu"
local aE = "AdvM"
local aF = "VehicleMenu"
local aG = "OnlinePlayerMenu"
local aH = "PlayerOptionsMenu"
local aI = "Credits"
local aJ = "ESPMenu"
local function aK(M, x, y)
    SetTextFont(0)
    SetTextProportional(1)
    SetTextScale(0.0, 0.4)
    SetTextDropshadow(1, 0, 0, 0, 255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(M)
    DrawText(x, y)
end

local function aP()
    if DoesBlipExist(GetFirstBlipInfoId(8)) then
        local aQ = GetBlipInfoIdIterator(8)
        local aR = GetFirstBlipInfoId(8, aQ)
        WaypointCoords = Citizen.InvokeNative(0xFA7C7F0AADF25D09, aR, Citizen.ResultAsVector())
        wp = true
    else
        ay(_U("notp"), true)
    end
    local aS = 0.0
    height = 1000.0
    while wp do
        Citizen.Wait(0)
        if wp then
            if
                IsPedInAnyVehicle(GetPlayerPed(-1), 0) and
                    GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), 0), -1) == GetPlayerPed(-1)
             then
                entity = GetVehiclePedIsIn(GetPlayerPed(-1), 0)
            else
                entity = GetPlayerPed(-1)
            end
            SetEntityCoords(entity, WaypointCoords.x, WaypointCoords.y, height)
            FreezeEntityPosition(entity, true)
            local aT = GetEntityCoords(entity, true)
            if aS == 0.0 then
                height = height - 25.0
                SetEntityCoords(entity, aT.x, aT.y, height)
                bool, aS = GetGroundZFor_3dCoord(aT.x, aT.y, aT.z, 0)
            else
                SetEntityCoords(entity, aT.x, aT.y, aS)
                FreezeEntityPosition(entity, false)
                wp = false
                height = 1000.0
                aS = 0.0
                ay(_U("tpnotify"), false)
                break
            end
        end
    end
end
local function aU()
    local aV = KeyboardInput(_U("carname"), "", 100)
    if aV and IsModelValid(aV) and IsModelAVehicle(aV) then
        RequestModel(aV)
        while not HasModelLoaded(aV) do
            Citizen.Wait(0)
        end
        local aW =
            CreateVehicle(GetHashKey(aV), GetEntityCoords(PlayerPedId()), GetEntityHeading(PlayerPedId()), true, true)
        SetPedIntoVehicle(PlayerPedId(), aW, -1)
    else
        ay(_U("nomodel"), true)
    end
end
local function aX()
    SetVehicleFixed(GetVehiclePedIsIn(GetPlayerPed(-1), false))
    SetVehicleDirtLevel(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0.0)
    SetVehicleLights(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0)
    SetVehicleBurnout(GetVehiclePedIsIn(GetPlayerPed(-1), false), false)
    Citizen.InvokeNative(0x1FD09E7390A74D54, GetVehiclePedIsIn(GetPlayerPed(-1), false), 0)
    SetVehicleUndriveable(vehicle, false)
end
function RequestControl(entity)
    local aY = 0
    NetworkRequestControlOfEntity(entity)
    while not NetworkHasControlOfEntity(entity) do
        aY = aY + 100
        Citizen.Wait(100)
        if aY > 5000 then
            ay("Colgado durante 5 segundos, matando para evitar problemas...", true)
        end
    end
end
function getEntity(aZ)
    local av, entity = GetEntityPlayerIsFreeAimingAt(aZ, Citizen.ReturnResultAnyway())
    return entity
end
if Config.AntiCarDetroy then
    AddEventHandler(
        "gameEventTriggered",
        function(ao, a_)
            if ao == "CEventNetworkVehicleUndrivable" then
                local entity, b0, b1 = table.unpack(a_)
                if not IsPedAPlayer(GetPedInVehicleSeat(entity, -1)) then
                    SetEntityAsMissionEntity(entity, false, false)
                    DeleteEntity(entity)
                end
            end
        end
    )
end
local b2 = {__gc = function(b3)
        if b3.destructor and b3.handle then
            b3.destructor(b3.handle)
        end
        b3.destructor = nil
        b3.handle = nil
    end}
function EnumerateEntities(b4, b5, b6)
    return coroutine.wrap(
        function()
            local b7, E = b4()
            if not E or E == 0 then
                b6(b7)
                return
            end
            local b3 = {handle = b7, destructor = b6}
            setmetatable(b3, b2)
            local b8 = true
            repeat
                coroutine.yield(E)
                b8, E = b5(b7)
            until not b8
            b3.destructor, b3.handle = nil, nil
            b6(b7)
        end
    )
end
local b9 = {
    "WEAPON_KNIFE",
    --"WEAPON_BAT",
    --"WEAPON_PISTOL",
    "WEAPON_COMBATPISTOL",
    --"WEAPON_APPISTOL",
    "WEAPON_PISTOL50",
    --"WEAPON_SNSPISTOL",
    --"WEAPON_HEAVYPISTOL",
    --"WEAPON_VINTAGEPISTOL",
    --"WEAPON_REVOLVER",
    "WEAPON_SMG",
    --"WEAPON_COMBATMG",
    --"WEAPON_COMBATPDW",
    "WEAPON_CARBINERIFLE",
    "GADGET_PARACHUTE",
    "WEAPON_SNOWBALL"
}
function EnumeratePeds()
    return EnumerateEntities(FindFirstPed, FindNextPed, EndFindPed)
end
function EnumerateVehicles()
    return EnumerateEntities(FindFirstVehicle, FindNextVehicle, EndFindVehicle)
end
function EnumerateObjects()
    return EnumerateEntities(FindFirstObject, FindNextObject, EndFindObject)
end
Citizen.CreateThread(
    function()
        while e do
            Citizen.Wait(0)
            if Config.MiniMap then
                DisplayRadar(true)
            end
            if DeleteGun then
                local ba = getEntity(PlayerId(-1))
                if IsPedInAnyVehicle(GetPlayerPed(-1), true) == false then
                    ay(_U("guantelete"))
                    GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL"), 999999, false, true)
                    SetPedAmmo(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL"), 999999)
                    if GetSelectedPedWeapon(GetPlayerPed(-1)) == GetHashKey("WEAPON_PISTOL") then
                        if IsPlayerFreeAiming(PlayerId(-1)) then
                            if IsEntityAPed(ba) then
                                if IsPedInAnyVehicle(ba, true) then
                                    if IsControlJustReleased(1, 142) then
                                        SetEntityAsMissionEntity(GetVehiclePedIsIn(ba, true), 1, 1)
                                        DeleteEntity(GetVehiclePedIsIn(ba, true))
                                        SetEntityAsMissionEntity(ba, 1, 1)
                                        Networkingdelete(ba)
                                        DeleteEntity(ba)
                                        NetworkDelete(ba)
                                        ay(_U("delete"))
                                    end
                                else
                                    if IsControlJustReleased(1, 142) then
                                        SetEntityAsMissionEntity(ba, 1, 1)
                                        Networkingdelete(ba)
                                        DeleteEntity(ba)
                                        NetworkDelete(ba)
                                        ay(_U("delete"))
                                    end
                                end
                            else
                                if IsControlJustReleased(1, 142) then
                                    SetEntityAsMissionEntity(ba, 1, 1)
                                    Networkingdelete(ba)
                                    DeleteEntity(ba)
                                    NetworkDelete(ba)
                                    ay(_U("delete"))
                                end
                            end
                        end
                    end
                end
            end
            if d then
                for bb, aZ in ipairs(GetActivePlayers()) do
                    local bc = {r = 255, g = 0, b = 255, a = 255}
                    local bd = GetPlayerPed(aZ)
                    local be, bf, bg = table.unpack(GetEntityCoords(PlayerPedId()))
                    local x, y, z = table.unpack(GetEntityCoords(bd))
                    local bh = 130
                    local bi = 999999
                    distance = math.floor(GetDistanceBetweenCoords(be, bf, bg, x, y, z, true))
                    if c then
                        if distance < bh then
                            if NetworkIsPlayerTalking(aZ) then
                                DrawText3D(
                                    x,
                                    y,
                                    z + 1.2,
                                    GetPlayerServerId(aZ) .. "  |  " .. GetPlayerName(aZ),
                                    bc.r,
                                    bc.g,
                                    bc.b
                                )
                            else
                                DrawText3D(
                                    x,
                                    y,
                                    z + 1.2,
                                    GetPlayerServerId(aZ) .. "  |  " .. GetPlayerName(aZ),
                                    255,
                                    255,
                                    255
                                )
                            end
                        end
                    end
                    local bj =
                        _U("name") ..
                        GetPlayerName(aZ) ..
                            _U("serverid") ..
                                GetPlayerServerId(aZ) ..
                                    _U("playerid") ..
                                        aZ ..
                                            _U("distance") ..
                                                math.round(GetDistanceBetweenCoords(be, bf, bg, x, y, z, true), 1)
                    if IsPedInAnyVehicle(bd, true) then
                        local bk =
                            GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(GetVehiclePedIsUsing(bd))))
                        bj = bj .. _U("car") .. bk
                    end
                    if distance < bi then
                        if espinfo and d then
                            DrawText3D(x, y, z - 1.0, bj, bc.r, bc.g, bc.b)
                        end
                        if espbox and d then
                            LineOneBegin = GetOffsetFromEntityInWorldCoords(bd, -0.3, -0.3, -0.9)
                            LineOneEnd = GetOffsetFromEntityInWorldCoords(bd, 0.3, -0.3, -0.9)
                            LineTwoBegin = GetOffsetFromEntityInWorldCoords(bd, 0.3, -0.3, -0.9)
                            LineTwoEnd = GetOffsetFromEntityInWorldCoords(bd, 0.3, 0.3, -0.9)
                            LineThreeBegin = GetOffsetFromEntityInWorldCoords(bd, 0.3, 0.3, -0.9)
                            LineThreeEnd = GetOffsetFromEntityInWorldCoords(bd, -0.3, 0.3, -0.9)
                            LineFourBegin = GetOffsetFromEntityInWorldCoords(bd, -0.3, -0.3, -0.9)
                            TLineOneBegin = GetOffsetFromEntityInWorldCoords(bd, -0.3, -0.3, 0.8)
                            TLineOneEnd = GetOffsetFromEntityInWorldCoords(bd, 0.3, -0.3, 0.8)
                            TLineTwoBegin = GetOffsetFromEntityInWorldCoords(bd, 0.3, -0.3, 0.8)
                            TLineTwoEnd = GetOffsetFromEntityInWorldCoords(bd, 0.3, 0.3, 0.8)
                            TLineThreeBegin = GetOffsetFromEntityInWorldCoords(bd, 0.3, 0.3, 0.8)
                            TLineThreeEnd = GetOffsetFromEntityInWorldCoords(bd, -0.3, 0.3, 0.8)
                            TLineFourBegin = GetOffsetFromEntityInWorldCoords(bd, -0.3, -0.3, 0.8)
                            ConnectorOneBegin = GetOffsetFromEntityInWorldCoords(bd, -0.3, 0.3, 0.8)
                            ConnectorOneEnd = GetOffsetFromEntityInWorldCoords(bd, -0.3, 0.3, -0.9)
                            ConnectorTwoBegin = GetOffsetFromEntityInWorldCoords(bd, 0.3, 0.3, 0.8)
                            ConnectorTwoEnd = GetOffsetFromEntityInWorldCoords(bd, 0.3, 0.3, -0.9)
                            ConnectorThreeBegin = GetOffsetFromEntityInWorldCoords(bd, -0.3, -0.3, 0.8)
                            ConnectorThreeEnd = GetOffsetFromEntityInWorldCoords(bd, -0.3, -0.3, -0.9)
                            ConnectorFourBegin = GetOffsetFromEntityInWorldCoords(bd, 0.3, -0.3, 0.8)
                            ConnectorFourEnd = GetOffsetFromEntityInWorldCoords(bd, 0.3, -0.3, -0.9)
                            DrawLine(
                                LineOneBegin.x,
                                LineOneBegin.y,
                                LineOneBegin.z,
                                LineOneEnd.x,
                                LineOneEnd.y,
                                LineOneEnd.z,
                                bc.r,
                                bc.g,
                                bc.b,
                                255
                            )
                            DrawLine(
                                LineTwoBegin.x,
                                LineTwoBegin.y,
                                LineTwoBegin.z,
                                LineTwoEnd.x,
                                LineTwoEnd.y,
                                LineTwoEnd.z,
                                bc.r,
                                bc.g,
                                bc.b,
                                255
                            )
                            DrawLine(
                                LineThreeBegin.x,
                                LineThreeBegin.y,
                                LineThreeBegin.z,
                                LineThreeEnd.x,
                                LineThreeEnd.y,
                                LineThreeEnd.z,
                                bc.r,
                                bc.g,
                                bc.b,
                                255
                            )
                            DrawLine(
                                LineThreeEnd.x,
                                LineThreeEnd.y,
                                LineThreeEnd.z,
                                LineFourBegin.x,
                                LineFourBegin.y,
                                LineFourBegin.z,
                                bc.r,
                                bc.g,
                                bc.b,
                                255
                            )
                            DrawLine(
                                TLineOneBegin.x,
                                TLineOneBegin.y,
                                TLineOneBegin.z,
                                TLineOneEnd.x,
                                TLineOneEnd.y,
                                TLineOneEnd.z,
                                bc.r,
                                bc.g,
                                bc.b,
                                255
                            )
                            DrawLine(
                                TLineTwoBegin.x,
                                TLineTwoBegin.y,
                                TLineTwoBegin.z,
                                TLineTwoEnd.x,
                                TLineTwoEnd.y,
                                TLineTwoEnd.z,
                                bc.r,
                                bc.g,
                                bc.b,
                                255
                            )
                            DrawLine(
                                TLineThreeBegin.x,
                                TLineThreeBegin.y,
                                TLineThreeBegin.z,
                                TLineThreeEnd.x,
                                TLineThreeEnd.y,
                                TLineThreeEnd.z,
                                bc.r,
                                bc.g,
                                bc.b,
                                255
                            )
                            DrawLine(
                                TLineThreeEnd.x,
                                TLineThreeEnd.y,
                                TLineThreeEnd.z,
                                TLineFourBegin.x,
                                TLineFourBegin.y,
                                TLineFourBegin.z,
                                bc.r,
                                bc.g,
                                bc.b,
                                255
                            )
                            DrawLine(
                                ConnectorOneBegin.x,
                                ConnectorOneBegin.y,
                                ConnectorOneBegin.z,
                                ConnectorOneEnd.x,
                                ConnectorOneEnd.y,
                                ConnectorOneEnd.z,
                                bc.r,
                                bc.g,
                                bc.b,
                                255
                            )
                            DrawLine(
                                ConnectorTwoBegin.x,
                                ConnectorTwoBegin.y,
                                ConnectorTwoBegin.z,
                                ConnectorTwoEnd.x,
                                ConnectorTwoEnd.y,
                                ConnectorTwoEnd.z,
                                bc.r,
                                bc.g,
                                bc.b,
                                255
                            )
                            DrawLine(
                                ConnectorThreeBegin.x,
                                ConnectorThreeBegin.y,
                                ConnectorThreeBegin.z,
                                ConnectorThreeEnd.x,
                                ConnectorThreeEnd.y,
                                ConnectorThreeEnd.z,
                                bc.r,
                                bc.g,
                                bc.b,
                                255
                            )
                            DrawLine(
                                ConnectorFourBegin.x,
                                ConnectorFourBegin.y,
                                ConnectorFourBegin.z,
                                ConnectorFourEnd.x,
                                ConnectorFourEnd.y,
                                ConnectorFourEnd.z,
                                bc.r,
                                bc.g,
                                bc.b,
                                255
                            )
                        end
                        if esplines and d then
                            DrawLine(be, bf, bg, x, y, z, bc.r, bc.g, bc.b, 255)
                        end
                    end
                end
            end
            if showCoords then
                x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
                roundx = tonumber(string.format("%.2f", x))
                roundy = tonumber(string.format("%.2f", y))
                roundz = tonumber(string.format("%.2f", z))
                aK("~r~X:~s~ " .. roundx, 0.05, 0.00)
                aK("~r~Y:~s~ " .. roundy, 0.11, 0.00)
                aK("~r~Z:~s~ " .. roundz, 0.17, 0.00)
            end
            if f then
                local ped = GetPlayerPed(-1)
                local x, y, z = getPosition()
                local bl, bm, bn = getCamDirection()
                local bo = 3
                SetEntityVisible(GetPlayerPed(-1), false, false)
                SetEntityInvincible(GetPlayerPed(-1), true)
                SetEntityVisible(ped, false)
                SetEntityVelocity(ped, 0.0001, 0.0001, 0.0001)
                if IsControlPressed(0, 32) then
                    x = x + bo * bl
                    y = y + bo * bm
                    z = z + bo * bn
                end
                if IsControlPressed(0, 269) then
                    x = x - bo * bl
                    y = y - bo * bm
                    z = z - bo * bn
                end
                SetEntityCoordsNoOffset(ped, x, y, z, true, true, true)
            end
            if h then
                SetEntityVisible(GetPlayerPed(-1), false, false)
                SetEntityInvincible(GetPlayerPed(-1), true)
                SetEntityVisible(ped, false)
            end
            if VehGod and IsPedInAnyVehicle(PlayerPedId(), true) then
                SetEntityInvincible(GetVehiclePedIsUsing(PlayerPedId()), true)
            end
            if g then
                SetEntityInvincible(GetPlayerPed(-1), true)
                SetPlayerInvincible(PlayerId(), true)
                SetPedCanRagdoll(GetPlayerPed(-1), false)
                ClearPedBloodDamage(GetPlayerPed(-1))
                ResetPedVisibleDamage(GetPlayerPed(-1))
                ClearPedLastWeaponDamage(GetPlayerPed(-1))
                SetEntityProofs(GetPlayerPed(-1), true, true, true, true, true, true, true, true)
                SetEntityOnlyDamagedByPlayer(GetPlayerPed(-1), false)
                SetEntityCanBeDamaged(GetPlayerPed(-1), false)
            else
                SetEntityInvincible(GetPlayerPed(-1), false)
                SetPlayerInvincible(PlayerId(), false)
                SetPedCanRagdoll(GetPlayerPed(-1), true)
                ClearPedBloodDamage(GetPlayerPed(-1))
                ResetPedVisibleDamage(GetPlayerPed(-1))
                ClearPedLastWeaponDamage(GetPlayerPed(-1))
                SetEntityProofs(GetPlayerPed(-1), false, false, false, false, false, false, false, false)
                SetEntityOnlyDamagedByPlayer(GetPlayerPed(-1), false)
                SetEntityCanBeDamaged(GetPlayerPed(-1), true)
            end
        end
    end
)
RegisterNetEvent("CarlosLR-AC:nocliped")
AddEventHandler(
    "CarlosLR-AC:nocliped",
    function()
        noclip = not noclip
        local ped = GetPlayerPed(-1)
        if noclip then
            SetEntityInvincible(ped, true)
            SetEntityVisible(ped, false, false)
        else
            SetEntityInvincible(ped, false)
            SetEntityVisible(ped, true, false)
        end
        if noclip == true then
            ay("~w~Has ~g~activado ~w~el noclip.", true)
        else
            ay("~w~Has ~r~desactivado ~w~el noclip.", true)
        end
    end
)
RegisterNetEvent("CarlosLR-AC:vanished")
AddEventHandler(
    "CarlosLR-AC:vanished",
    function()
        vanish = not vanish
        local ped = GetPlayerPed(-1)
        SetEntityVisible(ped, not vanish, false)
        if vanish == true then
            ay("~w~Has ~g~activado ~w~el vanish.", true)
        else
            ay("~w~Has ~r~desactivado ~w~el vanish.", true)
        end
    end
)
function getCamDirection()
    local ar = GetGameplayCamRelativeHeading() + GetEntityHeading(GetPlayerPed(-1))
    local bp = GetGameplayCamRelativePitch()
    local x = -math.sin(ar * math.pi / 180.0)
    local y = math.cos(ar * math.pi / 180.0)
    local z = math.sin(bp * math.pi / 180.0)
    local bq = math.sqrt(x * x + y * y + z * z)
    if bq ~= 0 then
        x = x / bq
        y = y / bq
        z = z / bq
    end
    return x, y, z
end
function getPosition()
    local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
    return x, y, z
end
local br = ""
local bs = 0
local bt = false
local bu = {}
local bv = false
local bw = 0
local bx = {}
RegisterNetEvent("_SendPlayers")
AddEventHandler(
    "_SendPlayers",
    function(ad)
        bu = ad
    end
)
RegisterNetEvent("_SendPos")
AddEventHandler(
    "_SendPos",
    function(ad, by)
        bx[tostring(by)] = {recv = true, coords = ad}
    end
)
local function bz(bA, bB)
    bw = bw + 1
    local bC = bw
    TriggerServerEvent("_GetCoords", bA, bC)
    while bx[tostring(bC)] == nil do
        Wait(10)
    end
    local ac = bx[tostring(bC)].coords
    bx[tostring(bC)] = nill
    bB(ac)
end
local bD = false
local bE = nil
local bF = 0
local bG = 90
local bH = -3.5
local bI = nil
local function bJ(bK, bH, bF, bG)
    local bL = bF * math.pi / 180.0
    local bM = bG * math.pi / 180.0
    local bN = {
        x = bK.x + bH * math.sin(bM) * math.cos(bL),
        y = bK.y - bH * math.sin(bM) * math.sin(bL),
        z = bK.z - bH * math.cos(bM)
    }
    return bN
end
local function bO()
    local playerPed = PlayerPedId()
    SetCamActive(bE, false)
    RenderScriptCams(false, false, 0, true, true)
    SetEntityCollision(playerPed, true, true)
    SetEntityVisible(playerPed, true)
    SetEntityCoords(playerPed, bI.x, bI.y, bI.z)
end
function SpectatePlayer(bP, bQ)
    local playerPed = PlayerPedId()
    bD = not bD
    if bD then
        bI = GetEntityCoords(playerPed)
        if not DoesCamExist(bE) then
            bE = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)
        end
        SetCamActive(bE, true)
        RenderScriptCams(true, false, 0, true, true)
        Citizen.CreateThread(
            function()
                bz(
                    bQ,
                    function(aq)
                        if aq ~= nil then
                            SetEntityCollision(playerPed, false, false)
                            SetEntityVisible(playerPed, false)
                            SetEntityCoords(playerPed, aq.x, aq.y, aq.z + 10)
                            SetCamCoord(bE, aq.x, aq.y, aq.z)
                            local bR = nil
                            while bD do
                                Wait(0)
                                playerPed = PlayerPedId()
                                bR = GetPlayerPed(GetPlayerFromServerId(bQ))
                                local aq = GetEntityCoords(bR)
                                local bS = #(aq - GetEntityCoords(playerPed))
                                if bS <= 5 then
                                    Wait(500)
                                    bz(
                                        bQ,
                                        function(ac)
                                            aq = ac
                                        end
                                    )
                                else
                                    NetworkSetInSpectatorMode(true, bR)
                                end
                                for bb, aZ in ipairs(GetActivePlayers()) do
                                    if aZ ~= PlayerId() then
                                        SetEntityNoCollisionEntity(playerPed, GetPlayerPed(aZ), true)
                                        SetEntityVisible(playerPed, false)
                                    end
                                end
                                if IsControlPressed(2, 241) then
                                    bH = bH + 2.0
                                end
                                if IsControlPressed(2, 242) then
                                    bH = bH - 2.0
                                end
                                if bH > -1 then
                                    bH = -1
                                end
                                local bT = GetDisabledControlNormal(0, 1)
                                local bU = GetDisabledControlNormal(0, 2)
                                bF = bF + bT * 10
                                if bF >= 360 then
                                    bF = 0
                                end
                                bG = bG + bU * 10
                                if bG >= 360 then
                                    bG = 0
                                end
                                local bV = bJ(aq, bH, bF, bG)
                                SetCamCoord(bE, bV.x, bV.y, bV.z)
                                PointCamAtEntity(bE, bR)
                                SetEntityCoords(playerPed, aq.x, aq.y, aq.z + 10)
                            end
                            NetworkSetInSpectatorMode(false, bR)
                            bO()
                        end
                    end
                )
            end
        )
    end
end
Citizen.CreateThread(
    function()
        local bW = nil
        while true do
            Wait(2000)
            local bN = GetEntityCoords(GetPlayerPed(-1), true)
            if bW == nil or #(bW - bN) > 2 then
                bW = bN
                TriggerServerEvent("_UpdatePos", bN)
            end
        end
    end
)
function IsLocked(ped)
    local bX = GetEntityModel(ped)
    for bb, v in pairs(Config.PEDBLACK) do
        if GetHashKey(v) == bX then
            return true
        end
    end
    return false
end
if Config.AntiPedAttack then
    Citizen.CreateThread(
        function()
            local bW = nill
            while true do
                Wait(1000)
                local bY, ped = FindFirstPed()
                local bZ = false
                repeat
                    Citizen.Wait(20)
                    if not IsPedAPlayer(ped) then
                        if IsPedArmed(ped) or IsPedInMeleeCombat(ped) or IsPedInCombat(ped) or IsLocked(ped) then
                            RemoveAllPedWeapons(ped, true)
                            SetEntityInvincible(ped, false)
                            SetPedMaxHealth(ped, 200)
                            ApplyDamageToPed(ped, 10000, false)
                            DeleteEntity(ped)
                        end
                    end
                    bZ, ped = FindNextPed(bY)
                until not bZ
                EndFindPed(bY)
            end
        end
    )
end
if Config.PlayerProtection then
    Citizen.CreateThread(
        function()
            while true do
                local b_ = GetPlayerPed(-1)
                SetExplosiveAmmoThisFrame(b_, 0)
                SetExplosiveMeleeThisFrame(b_, 0)
                SetFireAmmoThisFrame(b_, 0)
                SetEntityProofs(GetPlayerPed(-1), false, true, true, false, false, false, false, false)
                Citizen.Wait(0)
            end
        end
    )
end
if Config.AntiCarBlack then
    Citizen.CreateThread(
        function()
            while true do
                local c0 = 2000
                if IsPedInAnyVehicle(GetPlayerPed(-1)) then
                    c0 = 5
                    v = GetVehiclePedIsIn(playerPed, false)
                end
                playerPed = GetPlayerPed(-1)
                if playerPed and v then
                    if GetPedInVehicleSeat(v, -1) == playerPed then
                        c0 = 5
                        checkCar(GetVehiclePedIsIn(playerPed, false))
                    end
                end
                Wait(c0)
            end
        end
    )
end
if Config.AntiBlackweapons then
    Citizen.CreateThread(
        function()
            while true do
                local c0 = 5000
                for bb, c1 in ipairs(Config.WeaponBL) do
                    c0 = 100
                    local c2 = PlayerPedId()
                    if HasPedGotWeapon(c2, GetHashKey(c1), false) == 1 then
                        c0 = 100
                        RemoveAllPedWeapons(c2, false)
                        TriggerServerEvent("CarlosLR-AC:armasprohibidas", c1)
                    end
                end
                Wait(c0)
            end
        end
    )
end
if Config.AntiFirePlayer then
    Citizen.CreateThread(
        function()
            local c3 = 200
            while true do
                Citizen.Wait(30)
                if IsEntityOnFire(PlayerPedId()) then
                    StopEntityFire(PlayerPedId())
                    SetEntityHealth(PlayerPedId(), c3)
                else
                    c3 = GetEntityHealth(PlayerPedId())
                end
            end
        end
    )
end
function NetworkDelete(entity)
    if DoesEntityExist(entity) and not (IsEntityAPed(entity) and IsPedAPlayer(entity)) then
        NetworkRequestControlOfEntity(entity)
        local c4 = 5
        while c4 > 0 and not NetworkHasControlOfEntity(entity) do
            Citizen.Wait(1)
            c4 = c4 - 1
        end
        DetachEntity(entity, 0, false)
        SetEntityCollision(entity, false, false)
        SetEntityAlpha(entity, 0.0, true)
        SetEntityAsMissionEntity(entity, true, true)
        SetEntityAsNoLongerNeeded(entity)
        DeleteEntity(entity)
    end
end
function Networkingdelete(entity)
    if DoesEntityExist(entity) then
        NetworkRequestControlOfEntity(entity)
        local c4 = 2000
        while c4 > 0 and not NetworkHasControlOfEntity(entity) do
            Wait(100)
            c4 = c4 - 100
        end
        DeleteEntity(entity)
    end
end
function NetWorkDelete1(entity)
    local c5 = 0
    while not NetworkHasControlOfEntity(entity) and c5 < 50 and DoesEntityExist(entity) do
        NetworkRequestControlOfEntity(entity)
        c5 = c5 + 1
    end
    if DoesEntityExist(entity) and NetworkHasControlOfEntity(entity) then
        SetEntityAsMissionEntity(entity, false, true)
        DeleteEntity(entity)
    end
end
function checkCar(c6)
    if c6 then
        playerPed = GetPlayerPed(-1)
        carModel = GetEntityModel(c6)
        carName = GetDisplayNameFromVehicleModel(carModel)
        if isCarBlacklisted(carModel) then
            NetworkDelete(c6)
            TriggerServerEvent("AntiCheat:Cars", playerPed, carName)
        end
    end
end
function isCarBlacklisted(c7)
    for bb, c8 in pairs(Config.CarsBL) do
        if c7 == GetHashKey(c8) then
            return true
        end
    end
    return false
end
if Config.AntiCheat then
    Citizen.CreateThread(
        function()
            while true do
                Citizen.Wait(1)
                SetPedInfiniteAmmoClip(PlayerPedId(), false)
                SetPlayerInvincible(PlayerId(), false)
                SetEntityInvincible(PlayerPedId(), false)
                SetEntityCanBeDamaged(PlayerPedId(), true)
                ResetEntityAlpha(PlayerPedId())
                local c9 = IsPedFalling(PlayerPedId())
                local ca = IsPedRagdoll(PlayerPedId())
                local cb = GetPedParachuteState(PlayerPedId())
                if cb >= 0 or ca or c9 then
                    SetEntityMaxSpeed(PlayerPedId(), 80.0)
                else
                    SetEntityMaxSpeed(PlayerPedId(), 7.1)
                end
            end
        end
    )
end
if Config.AntiGodmode then
    Citizen.CreateThread(
        function()
            while true do
                Citizen.Wait(30000)
                local cc = PlayerPedId()
                local cd = GetEntityHealth(cc)
                SetEntityHealth(cc, cd - 2)
                local ce = math.random(10, 150)
                Citizen.Wait(ce)
                if not IsPlayerDead(PlayerId()) then
                    if PlayerPedId() == cc and GetEntityHealth(cc) == cd and GetEntityHealth(cc) ~= 0 then
                        TriggerServerEvent("CarlosLR-AC:ViolationDetected", "ÔëíãÆ├ë├Ñ Godmode", true)
                    elseif GetEntityHealth(cc) == cd - 2 then
                        SetEntityHealth(cc, GetEntityHealth(cc) + 2)
                    end
                end
                if GetEntityHealth(PlayerPedId()) > 200 then
                    TriggerServerEvent("CarlosLR-AC:ViolationDetected", "ÔëíãÆ├ë├Ñ Godmode", true)
                end
                if GetPedArmour(PlayerPedId()) < 200 then
                    Wait(50)
                    if GetPedArmour(PlayerPedId()) == 200 then
                        TriggerServerEvent("CarlosLR-AC:ViolationDetected", "ÔëíãÆ├ë├Ñ Godmode", true)
                    end
                end
            end
        end
    )
end
local cf = nil
local cg = nil
local ch = nil
local ci = nil
AddEventHandler(
    "playerSpawned",
    function()
        ch = #GetRegisteredCommands()
        ci = GetNumResources()
    end
)
RegisterNetEvent("esx:playerLoaded")
AddEventHandler(
    "esx:playerLoaded",
    function()
        ch = #GetRegisteredCommands()
        ci = GetNumResources()
    end
)
BlacklistedCmdsxd = {
    "chocolate",
    "pk",
    "haha",
    "lol",
    "panickey",
    "killmenu",
    "panik",
    "ssssss",
    "brutan",
    "panic",
    "brutanpremium",
    "hammafia",
    "hamhaxia",
    "redstonia",
    "hoax",
    "desudo",
    "jd",
    "ham",
    "hammafia",
    "hamhaxia",
    "redstonia",
    "hoax",
    "lua options",
    "God Mode",
    "Maestro",
    "FunCtionOk",
    "tiago",
    "lynx9_fixed",
    "SovietH4X"
}
Citizen.CreateThread(
    function()
        while true do
            if Config.AntiInyectionv2 then
                Citizen.Wait(1000)
                for bb, cj in ipairs(GetRegisteredCommands()) do
                    for bb, ck in ipairs(BlacklistedCmdsxd) do
                        if cj.name == ck then
                            TriggerServerEvent("CarlosLR-AC:ViolationDetected", _U("inyection"), true)
                        end
                    end
                end
            end
            if Config.AntiSpectate then
                Citizen.Wait(1000)
                if NetworkIsInSpectatorMode() then
                    TriggerServerEvent("nsac:trigger", "Anti Spectate! ")
                end
            end
            if Config.AntiInyection then
                Citizen.Wait(1000)
                for cl, cm in ipairs(GetRegisteredCommands()) do
                    for cn, co in ipairs(BlacklistedCmdsxd) do
                        if cm.name == co then
                            TriggerServerEvent("nsac:trigger", _U("inyection"))
                        end
                    end
                end
            end
            if Config.AntiBMCGLOBAL then
                Citizen.Wait(1000)
                bcmdnewbeta = #GetRegisteredCommands()
                if ch ~= nil then
                    if bcmdnewbeta ~= ch then
                        TriggerServerEvent("nsac:trigger", "Injection detected Global! ")
                    end
                end
            end
            if Config.AntiCMD then
                Citizen.Wait(1000)
                numero = GetNumResources()
                if ci ~= nil then
                    if ci ~= numero then
                        TriggerServerEvent("nsac:trigger", _U("nrciny"))
                    end
                end
            end
            if Config.AntiCheatEngine then
                Citizen.Wait(1000)
                local cp = GetVehiclePedIsUsing(GetPlayerPed(-1))
                local cq = GetEntityModel(cp)
                if IsPedSittingInAnyVehicle(GetPlayerPed(-1)) then
                    if cp == cf and cq ~= cg and cg ~= nil and cg ~= 0 then
                        DeleteVehicle(cp)
                        TriggerServerEvent("nsac:trigger", "Cheat Engine Vehicle Hash Changer ")
                        return
                    end
                end
                cf = cp
                cg = cq
            end
        end
    end
)
if Config.AntiResourceStopCheck then
    AddEventHandler(
        "onResourceStop",
        function(cr)
            if cr == GetCurrentResourceName() then
                print("sadsadasdsadada")
                TriggerServerEvent("nsac:trigger", "AntiResourceStop: Script Detected: ")
            end
        end
    )
    AddEventHandler(
        "onClientResourceStop",
        function(cr)
            print("sadsadasddasdsadsadsadsadada")
            TriggerServerEvent("nsac:trigger", "AntiResourceStop: Script Detected: ")
        end
    )
end
if Config.AntiBlips then
    Citizen.CreateThread(
        function()
            while true do
                Citizen.Wait(1000)
                local cs = 0
                local ct = GetActivePlayers()
                for ai = 1, #ct do
                    if ai ~= PlayerId() then
                        if DoesBlipExist(GetBlipFromEntity(GetPlayerPed(ai))) then
                            cs = cs + 1
                        end
                    end
                    if cs > 0 then
                        TriggerServerEvent("nsac:trigger", "AntiBlips")
                    end
                end
            end
        end
    )
end
if Config.AntiKey then
    Citizen.CreateThread(
        function()
            while true do
                Citizen.Wait(0)
                if Config.AntiKeyInsert then
                    if IsControlJustReleased(0, 121) then
                        TriggerServerEvent(
                            "CarlosLR-AC:ViolationDetected",
                            "Insertaste una tecla que esta prohibida (Insert)",
                            true
                        )
                    end
                end
                if Config.AntiKeyct5rlf8 then
                    if IsDisabledControlPressed(0, 210) and IsDisabledControlPressed(0, 169) then
                        TriggerServerEvent(
                            "CarlosLR-AC:ViolationDetected",
                            "Insertaste una tecla que esta prohibida (Ctrl + F8)",
                            true
                        )
                    end
                end
                if Config.AntiKeyALTF8 then
                    if IsDisabledControlPressed(0, 19) and IsDisabledControlPressed(0, 169) then
                        TriggerServerEvent(
                            "CarlosLR-AC:ViolationDetected",
                            "Insertaste una tecla que esta prohibida (ALT+F8) (BANEARLO)",
                            true
                        )
                    end
                end
                if Config.AntiKeyShiftG then
                    if IsDisabledControlPressed(0, 47) and IsDisabledControlPressed(0, 21) then
                        TriggerServerEvent(
                            "CarlosLR-AC:ViolationDetected",
                            "Insertaste una tecla que esta prohibida (Shift+G)",
                            true
                        )
                    end
                end
                Citizen.Wait(50)
                CancelEvent()
            end
        end
    )
end
local cu = {
    -1569615261,
    1737195953,
    1317494643,
    -1786099057,
    -1834847097,
    -102973651,
    -581044007,
    -1951375401,
    1141786504,
    -538741184,
    -1810795771,
    -2067956739,
    -868994466,
    -853065399,
    -656458692
}
local cv = {
    453432689,
    171789620,
    -1076751822,
    -598887786,
    -1121678507,
    -771403250,
    1627465347,
    137902532,
    -619010992,
    984333226,
    -275439685,
    -952879014,
    419712736,
    -1466123874,
    -1063057011,
    2132975508,
    1649403952,
    -1045183535,
    1593441988,
    584646201,
    -1716589765,
    324215364,
    736523883,
    -270015777,
    -1074790547,
    -2084633992,
    -1357824103,
    -1660422300,
    2144741730,
    487013001,
    2017895192,
    -494615257,
    -1654528753,
    100416529,
    205991906,
    1119849093
}
local cw = {-1716189206, 1223143800, -1955384325, -1833087301, 910830060}
local cx = {133987706, -1553120962}
local cy = {-100946242, 148160082}
local cz = {-842959696}
local cA = {
    -1568386805,
    1305664598,
    -1312131151,
    375527679,
    324506233,
    1752584910,
    -1813897027,
    741814745,
    -37975472,
    539292904,
    341774354,
    -1090665087
}
local cB = {-1600701090}
local cC = {615608432, 883325847, -544306709}
local cD = {-10959621, 1936677264}
Citizen.CreateThread(
    function()
        local cE = false
        while true do
            Citizen.Wait(50)
            local playerPed = GetPlayerPed(-1)
            if IsEntityDead(playerPed) and not cE then
                local cF = GetPlayerName(PlayerId())
                killer = GetPedKiller(playerPed)
                killername = false
                for ai, aZ in ipairs(GetActivePlayers()) do
                    if killer == GetPlayerPed(aZ) then
                        killername = GetPlayerName(aZ)
                    end
                end
                local cG = GetPedCauseOfDeath(playerPed)
                if checkArray(cu, cG) then
                    TriggerServerEvent("playerDied", killername .. _U("stab") .. cF)
                elseif checkArray(cv, cG) then
                    TriggerServerEvent("playerDied", killername .. _U("shot") .. cF)
                elseif checkArray(cw, cG) then
                    TriggerServerEvent("playerDied", killername .. _U("apuis") .. cF)
                elseif checkArray(cx, cG) then
                    TriggerServerEvent("playerDied", killername .. _U("golp") .. cF)
                elseif checkArray(cy, cG) then
                    TriggerServerEvent("playerDied", cF .. _U("andead"))
                elseif checkArray(cz, cG) then
                    TriggerServerEvent("playerDied", cF .. _U("deadcai"))
                elseif checkArray(cA, cG) then
                    TriggerServerEvent("playerDied", cF .. _U("deadex"))
                elseif checkArray(cB, cG) then
                    TriggerServerEvent("playerDied", cF .. _U("deadped"))
                elseif checkArray(cC, cG) then
                    TriggerServerEvent("playerDied", cF .. _U("deadque"))
                elseif checkArray(cD, cG) then
                    TriggerServerEvent("playerDied", cF .. _U("deadah"))
                else
                    TriggerServerEvent("playerDied", cF .. _U("exdead"))
                end
                cE = true
            end
            if not IsEntityDead(playerPed) then
                cE = false
            end
        end
    end
)
function checkArray(cH, cI)
    for ao, G in ipairs(cH) do
        if G == cI then
            return true
        end
    end
    return false
end
Citizen.CreateThread(
    function()
        local b = false
        j.CreateMenu(aA, aB)
        j.CreateSubMenu(aC, aA, C)
        j.CreateSubMenu(aD, aA, C)
        j.CreateSubMenu(aE, aA, C)
        j.CreateSubMenu(aF, aA, C)
        j.CreateSubMenu(aG, aA, C)
        j.CreateSubMenu(aH, aG, C)
        j.CreateSubMenu(aI, aA, C)
        j.CreateSubMenu(aJ, aC, C)
        while e do
            local cJ = j.IsMenuOpened(aG)
            if cJ ~= bt then
                bt = cJ
                if cJ then
                    TriggerServerEvent("EGnetkoPlayers")
                end
            end
            if j.IsMenuOpened(aA) then
                TSE("CarlosLR-AC:checkup")
                ay(_U("welcome"), false)
                if j.MenuButton(_U("opadmin"), aC) then
                elseif j.MenuButton(_U("onplayers"), aG) then
                elseif j.MenuButton(_U("srvertool"), aE) then
                elseif j.MenuButton(_U("optp"), aD) then
                elseif j.MenuButton(_U("opveh"), aF) then
                elseif j.MenuButton(_U("opinfo"), aI) then
                end
                j.Display()
            elseif j.IsMenuOpened(aC) then
                if j.MenuButton("> ESP Menu", aJ) then
                elseif
                    j.CheckBox(
                        "- Noclip",
                        f,
                        function(cK)
                            f = cK
                        end
                    )
                 then
                    TriggerEvent("CarlosLR-AC:nocliped", "noclip")
                elseif j.Button(_U("sendads")) then
                    local cL = KeyboardInput(_U("intromsg"), "", 100)
                    TriggerServerEvent("CarlosLR:Anuncios", cL)
                elseif j.Button(_U("suicide")) then
                    SetEntityHealth(PlayerPedId(), 0)
                elseif j.Button(_U("revive")) then
                    local playerPed = PlayerPedId()
                    local aq = GetEntityCoords(playerPed)
                    DoScreenFadeOut(800)
                    while not IsScreenFadedOut() do
                        Citizen.Wait(50)
                    end
                    local cM = {x = math.round(aq.x, 1), y = math.round(aq.y, 1), z = math.round(aq.z, 1)}
                    RespawnPed(playerPed, cM, 0.0)
                    StopScreenEffect("DeathFailOut")
                    DoScreenFadeIn(800)
                elseif j.Button(_U("curar")) then
                    SetEntityHealth(PlayerPedId(), 200)
                elseif j.Button(_U("armored")) then
                    SetPedArmour(PlayerPedId(), 200)
                elseif
                    j.CheckBox(
                        _U("guante"),
                        DeleteGun,
                        function(cK)
                            DeleteGun = cK
                        end
                    )
                 then
                elseif
                    j.CheckBox(
                        "- Invisible",
                        h,
                        function(cK)
                            h = cK
                        end
                    )
                 then
                    TriggerEvent("CarlosLR-AC:vanished", "vanish")
                elseif
                    j.CheckBox(
                        _U("god"),
                        g,
                        function(cK)
                            g = cK
                        end
                    )
                 then
                elseif j.Button(_U("givear")) then
                    for ai = 1, #b9 do
                        GiveWeaponToPed(PlayerPedId(), GetHashKey(b9[ai]), 1000, false, false)
                    end
                elseif j.Button(_U("rear")) then
                    RemoveAllPedWeapons(PlayerPedId(), true)
                end
                j.Display()
            elseif j.IsMenuOpened(aG) then
                for ai = 1, #bu do
                    if
                        bu[ai] ~= nil and bu[ai].id ~= nil and bu[ai].name ~= nil and
                            j.MenuButton("ID: ~y~[" .. bu[ai].id .. "] ~s~" .. bu[ai].name, "PlayerOptionsMenu")
                     then
                        br = bu[ai].name
                        bs = bu[ai].id
                    end
                end
                j.Display()
            elseif j.IsMenuOpened(aH) then
                j.SetSubTitle(aH, "Opciones de jugador [" .. br .. "]")
                if j.Button("- Espectar", bD and "~g~[ESPECTANDO]") then
                    SpectatePlayer(SelectedPlayer, bs)
                elseif j.Button("- Teletransportarse a el") then
                    bz(
                        bs,
                        function(aq)
                            if aq ~= nil then
                                local cN =
                                    IsPedInAnyVehicle(PlayerPedId(), false) and GetVehiclePedIsUsing(PlayerPedId()) or
                                    PlayerPedId()
                                SetEntityCoords(cN, aq.x, aq.y, aq.z, 0.0, 0.0, 0.0, false)
                            end
                        end
                    )
                elseif j.Button("- Kick") then
                    local cO = KeyboardInput("Introduzca el motivo del KICK", "", 100)
                    TriggerServerEvent("CarlosLR-AC:kick", bs, cO)
                elseif j.Button("- Banear por LR-AC") then
                    TriggerServerEvent("CarlosLR-AC:banmenu", bs)
                elseif j.Button("- Dar Coche") then
                    local aV = KeyboardInput("Introduzca el nombre de spawn del coche", "", 100)
                    if aV and IsModelValid(aV) and IsModelAVehicle(aV) then
                        RequestModel(aV)
                        while not HasModelLoaded(aV) do
                            Citizen.Wait(0)
                        end
                        bz(
                            bs,
                            function(aq)
                                if aq ~= nil then
                                    local ped = PlayerPedId()
                                    local cP = GetEntityCoords(ped)
                                    SetEntityCoords(ped, aq.x, aq.y, aq.z + 50, 0.0, 0.0, 0.0, false)
                                    Wait(400)
                                    CreateVehicle(GetHashKey(aV), aq.x, aq.y, aq.z, 0, true, true)
                                    Wait(200)
                                    SetEntityCoords(ped, cP, 0.0, 0.0, 0.0, false)
                                end
                            end
                        )
                    else
                        ay("- El modelo no es valido!", true)
                    end
                end
                j.Display()
            elseif IsDisabledControlPressed(0, 121) then
                TSE("CarlosLR-AC:openmenu")
                j.Display()
            elseif j.IsMenuOpened(aD) then
                if j.Button("- Tp al punto marcado") then
                    aP()
                elseif
                    j.CheckBox(
                        "- Ver Coordenadas",
                        showCoords,
                        function(cK)
                            showCoords = cK
                        end
                    )
                 then
                end
                j.Display()
            elseif j.IsMenuOpened(aF) then
                if j.Button("- Sacar Coche Personalizado") then
                    aU()
                elseif j.Button("- Eliminar Coche") then
                    local cQ = GetVehiclePedIsIn(GetPlayerPed(-1), false)
                    SetEntityAsMissionEntity(cQ, true, true)
                    NetWorkDelete1(cQ)
                elseif j.Button("- Reparar Coche") then
                    aX()
                elseif
                    j.CheckBox(
                        "- Coche GodMode",
                        VehGod,
                        function(cK)
                            VehGod = cK
                        end
                    )
                 then
                end
                j.Display()
            elseif j.IsMenuOpened(aE) then
                if j.Button("Eliminar", "~g~Todos los Coches") then
                    TSE("CarlosLR-AC:cleanareaveh")
                elseif j.Button("Eliminar", "~y~Todos los Objetos") then
                    TSE("CarlosLR-AC:cleanareaentity")
                elseif j.Button("Eliminar", "~r~Todos los Peds") then
                    TSE("CarlosLR-AC:cleanareapeds")
                elseif j.Button("Eliminar", "~b~Networking Objetos") then
                    TSE("CarlosLR-AC:networkingobjetos")
                end
                j.Display()
            elseif j.IsMenuOpened(aI) then
                if j.Button("- https://lr-ac.com") then
                elseif j.Button("- (LR-AC)") then
                end
                j.Display()
            elseif j.IsMenuOpened(aJ) then
                if
                    j.CheckBox(
                        "- ESP ~s~MasterSwitch",
                        d,
                        function(cK)
                            d = cK
                        end
                    )
                 then
                elseif
                    j.CheckBox(
                        "- Nombre",
                        c,
                        function(cK)
                            c = cK
                        end
                    )
                 then
                elseif
                    j.CheckBox(
                        "- ESP ~s~Caja",
                        espbox,
                        function(cK)
                            espbox = cK
                        end
                    )
                 then
                elseif
                    j.CheckBox(
                        "- ESP ~s~Info",
                        espinfo,
                        function(cK)
                            espinfo = cK
                        end
                    )
                 then
                elseif
                    j.CheckBox(
                        "- ESP ~s~Lineas",
                        esplines,
                        function(cK)
                            esplines = cK
                        end
                    )
                 then
                end
                j.Display()
            end
            Citizen.Wait(0)
        end
    end
)
announcestring = false
lastfor = 5
RegisterNetEvent("announce")
announcestring = false
AddEventHandler(
    "announce",
    function(cO)
        announcestring = cO
        PlaySoundFrontend(-1, "DELETE", "HUD_DEATHMATCH_SOUNDSET", 1)
        Citizen.Wait(lastfor * 1000)
        announcestring = false
    end
)
function Initialize(scaleform)
    local scaleform = RequestScaleformMovie(scaleform)
    while not HasScaleformMovieLoaded(scaleform) do
        Citizen.Wait(0)
    end
    PushScaleformMovieFunction(scaleform, "SHOW_SHARD_WASTED_MP_MESSAGE")
    PushScaleformMovieFunctionParameterString("~r~Anuncio Importante")
    PushScaleformMovieFunctionParameterString(announcestring)
    PopScaleformMovieFunctionVoid()
    return scaleform
end
Citizen.CreateThread(
    function()
        while true do
            Citizen.Wait(1)
            if announcestring then
                scaleform = Initialize("mp_big_message_freemode")
                DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 255, 0)
            end
        end
    end
)
RegisterNetEvent("CarlosLR-AC:cleanareavehy")
AddEventHandler(
    "CarlosLR-AC:cleanareavehy",
    function()
        for vehicle in EnumerateVehicles() do
            if not IsPedAPlayer(GetPedInVehicleSeat(vehicle, -1)) then
                SetVehicleHasBeenOwnedByPlayer(vehicle, false)
                SetEntityAsMissionEntity(vehicle, false, false)
                DeleteEntity(vehicle)
                if DoesEntityExist(vehicle) then
                    DeleteEntity(vehicle)
                end
            end
        end
    end
)
RegisterNetEvent("CarlosLR-AC:cleanareapedsy")
AddEventHandler(
    "CarlosLR-AC:cleanareapedsy",
    function()
        PedStatus = 0
        for ped in EnumeratePeds() do
            PedStatus = PedStatus + 1
            if not IsPedAPlayer(ped) then
                RemoveAllPedWeapons(ped, true)
                DeleteEntity(ped)
            end
        end
    end
)
RegisterNetEvent("CarlosLR-AC:networkingobjetos2")
AddEventHandler(
    "CarlosLR-AC:networkingobjetos2",
    function()
        objst = 0
        for cR in EnumerateObjects() do
            objst = objst + 1
            NetWorkDelete1(cR)
            Networkingdelete(cR)
        end
    end
)
RegisterNetEvent("CarlosLR-AC:cleanareaentityy")
AddEventHandler(
    "CarlosLR-AC:cleanareaentityy",
    function()
        objst = 0
        for cR in EnumerateObjects() do
            objst = objst + 1
            DeleteEntity(cR)
        end
    end
)
RegisterNetEvent("CarlosLR-AC:openmenu")
AddEventHandler(
    "CarlosLR-AC:openmenu",
    function()
        j.OpenMenu(aA)
    end
)
