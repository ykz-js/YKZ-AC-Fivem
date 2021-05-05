ESX = nil
local a = LoadResourceFile("es_extended", "client/common.lua")
if a then
    a = a:gsub("AddEventHandler", "")
    a = a:gsub("cb", "")
    a = a:gsub("function ", "")
    a = a:gsub("return ESX", "")
    a = a:gsub("(ESX)", "")
    a = a:gsub("function", "")
    a = a:gsub("getSharedObject%(%)", "")
    a = a:gsub("end", "")
    a = a:gsub("%(", "")
    a = a:gsub("%)", "")
    a = a:gsub(",", "")
    a = a:gsub("\n", "")
    a = a:gsub("'", "")
    a = a:gsub("%s+", "")
    if tostring(a) ~= "esx:getSharedObject" then
        print("This server is using trigger replacement, watch out!")
    end
end
TriggerEvent(
    tostring(a),
    function(b)
        ESX = b
    end
)
RegisterServerEvent("YakuzaYKZ-AC:cleanareaveh")
RegisterServerEvent("YakuzaYKZ-AC:cleanareapeds")
RegisterServerEvent("YakuzaYKZ-AC:cleanareaentity")
RegisterServerEvent("YakuzaYKZ-AC:openmenu")
RegisterServerEvent("YakuzaYKZ-AC:checkup")
RegisterServerEvent("YakuzaYKZ-AC:adminmenuenable")
RegisterServerEvent("YakuzaYKZ-AC:banmenu")
RegisterServerEvent("YakuzaYKZ-AC:kick")
function logo()
  print([[

    
^1                              
^7--------------------------------------------------------------
     ^1  ^7
     ^1           V-1
^7--------------------------------------------------------------
^7--------------------------------------------------------------
^7--------------------------------------------------------------
^7--------------------------------------------------------------

                  ^1[^2YKZ$Quad^1]

^7--------------------------------------------------------------
^7--------------------------------------------------------------
^7--------------------------------------------------------------
^7--------------------------------------------------------------
^7--------------------------------------------------------------


^1[^2YKZ-AC^1]    [Verificado!]
  ]])
  print("\n^7----------------------------------------------------------------")
  print("\n^1[^2YKZ-AC^1] |^2 Esta Funcionando PERFECTAMENTE UNETE A NUSTRO DISCORD https://discord.gg/6T3PMBuDdA :)")
            print("\n^1---------------------------------------------------------^0")
            print("\n")
end
function check(g, h, i)
    if g == 200 then
        local j = json.decode(h)
        if j.status == 301 then
            logo()
            print("\n^1[^2YKZ-AC^1] |^2 https://discord.gg/6T3PMBuDdA ")
            print("\n^1----------------------------------------------------------------------^0")
            print("\n\n\n\n")
            Wait(7000)
            StopResource(GetCurrentResourceName())
            os.exit()
        else
            Wait(7000)
            logo()
            print("\n^1[^2YKZ-AC^1] |^2 Esta Funcionando Gracias UNETE A NUSTRO DISCORD https://discord.gg/6T3PMBuDdA :)")
            print("\n^1----------------------------------------------------------------------^0")
            print("\n")
        end
    else
        logo()
        print("\n^1----------------------------------------------------------------------^0")
        print("\n\n\n\n")
        Wait(2000)
        StopResource(GetCurrentResourceName())
        os.exit()
    end
    SetTimeout(4600000, auth)
end
local k = ""
local l = ""
local m = ""
local n = {}
function loadBans()
    m = LoadResourceFile(GetCurrentResourceName(), "bans.json") or ""
    if m ~= "" then
        n = json.decode(m)
    else
        n = {}
    end
end
RegisterCommand(
    "actu_bans",
    function()
        loadBans()
    end,
    true
)
function isBanned(source)
    if n[source] ~= nil then
        return n[source]
    else
        return false
    end
end
function permBanUser(o, source)
    n[source] = {banner = o, reason = "Baneado permanentemente del servidor contactar en el discord para ayuda.", expire = 0}
    SaveResourceFile(GetCurrentResourceName(), "bans.json", json.encode(n), -1)
end
PerformHttpRequest(
    ConfigCS.GlobalBan,
    function(p, q, r)
    end,
    "POST",
    json.encode({username = l, content = ":octagonal_sign: YKZ ANTICHEAT:raised_hand: **En Linea**", avatar_url = k}),
    {["Content-Type"] = "bans.jsonon"}
)
PerformHttpRequest(
    ConfigCS.LOGS,
    function(p, q, r)
    end,
    "POST",
    json.encode({username = l, content = ":octagonal_sign: YKZ ANTICHEAT :raised_hand: **En Linea**", avatar_url = k}),
    {["Content-Type"] = "bans.json"}
)


AddEventHandler(
    "playerConnecting",
    function(u, v, C)
        local s = GetPlayerName(source)
        local license, D, E, F, discord, G = "n/a", "n/a", "n/a", "n/a", "n/a", "n/a"
        for H, B in ipairs(GetPlayerIdentifiers(source)) do
            if string.sub(B, 1, string.len("license:")) == "license:" then
                license = B
            elseif string.sub(B, 1, string.len("steam:")) == "steam:" then
                D = B
            elseif string.sub(B, 1, string.len("live:")) == "live:" then
                E = B
            elseif string.sub(B, 1, string.len("xbl:")) == "xbl:" then
                F = B
            elseif string.sub(B, 1, string.len("discord:")) == "discord:" then
                discord = B
            elseif string.sub(B, 1, string.len("ip:")) == "ip:" then
                G = B
            end
        end
        print("^7[^2YKZ-AC^7] ^2| ^7 EL Jugador ^2" .. s .. "^7 se esta conectando...^0")
        for H, B in ipairs(GetPlayerIdentifiers(source)) do
            local I = isBanned(B)
            if I ~= false then
                v(
                    "­[YKZ-AC] | Usted ha sido *globalmente* baneado del servidor."
                )
                TriggerEvent(
                    "discordlog:sendToDiscord",
                    "­ [YKZ-AC] ",
                    "**\nRazon: **Esta baneado por HACKER" ..
                        "**\nNombre: **" ..
                            s ..
                                "**\n Steam: **" ..
                                    D ..
                                        "**\n Discord: **" ..
                                            discord .. "**\n Fivem: **" .. license .. "**\nIP: **" .. G,
                    16711680
                )
                CancelEvent()
                break
            end
        end
        TriggerEvent(
            "discordlog:sendToDiscord2",
            "­ [YKZ-AC] - Conexion Perdida",
            "**\nNombre: **" ..
                GetPlayerName(source) ..
                    "**\n Steam: **" ..
                        D ..
                            "**\n Discord: **" ..
                                discord ..
                                    "**\n Fivem: **" ..
                                        license .. "**\n Live: **" .. E .. "**\n Xbl: **" .. F .. "**\nIP: **" .. G,
            16711680
        )
    end
)
RegisterServerEvent("discordlog:sendToDiscord2")
AddEventHandler(
    "discordlog:sendToDiscord2",
    function(s, t, J)
        local K = {
            {["color"] = J, ["title"] = "**" .. s .. "**", ["description"] = t, ["footer"] = {["text"] = "^7[^2YKZ-AC^7]"}}
        }
        PerformHttpRequest(
            ConfigCS.LOGS,
            function(p, q, r)
            end,
            "POST",
            json.encode({username = l, embeds = K, avatar_url = k}),
            {["Content-Type"] = "application/json"}
        )
    end
)
RegisterServerEvent("discordlog:sendToDiscord")
AddEventHandler(
    "discordlog:sendToDiscord",
    function(s, t, J)
        local K = {
            {["color"] = J, ["title"] = "**" .. s .. "**", ["description"] = t, ["footer"] = {["text"] = "^7[^2YKZ-AC^7]"}}
        }
        PerformHttpRequest(
            ConfigCS.GlobalBan,
            function(p, q, r)
            end,
            "POST",
            json.encode({username = l, embeds = K, avatar_url = k}),
            {["Content-Type"] = "application/json"}
        )
    end
)
local L = {}
local M = 0
local function N()
    local O = os.time(os.date("!*t"))
    if M == 0 or M < O then
        M = O + 10
        local P = {}
        local Q = ESX.GetPlayers()
        for i = 1, #Q, 1 do
            local R = {id = Q[i], name = GetPlayerName(Q[i])}
            table.insert(P, R)
        end
        L = P
    end
    return L
end
local S = {}
local T = {}
AddEventHandler(
    "playerConnecting",
    function()
        T[tostring(source)] = os.time()
    end
)
AddEventHandler(
    "playerDropped",
    function(U)
        T[tostring(source)] = nil
        TriggerEvent(
            "discordlog:sendToDiscord2",
            "Desconexion",
            "**" .. GetPlayerName(source) .. "** ha salido del servidor. \n Raz├│n: " .. U,
            16711680
        )
    end
)
RegisterNetEvent("EGnetkoPlayers")
AddEventHandler(
    "EGnetkoPlayers",
    function()
        TriggerClientEvent("_SendPlayers", source, N())
    end
)
RegisterNetEvent("_GetCoords")
AddEventHandler(
    "_GetCoords",
    function(V, W)
        TriggerClientEvent("_SendPos", source, S[V], W)
    end
)
RegisterServerEvent("_UpdatePos")
AddEventHandler(
    "_UpdatePos",
    function(B)
        S[source] = B
        T[tostring(source)] = os.time()
    end
)
RegisterServerEvent("_UpdateTs")
AddEventHandler(
    "_UpdateTs",
    function(B)
        T[tostring(source)] = os.time()
    end
)
CreateThread(
    function()
        while true do
            Wait(200000)
            local O = os.time()
            for H, B in pairs(T) do
                if O - B > 200 then
                end
            end
        end
    end
)
RegisterServerEvent("playerDied")
AddEventHandler(
    "playerDied",
    function(t)
        TriggerEvent("discordlog:sendToDiscord2", "Logs de muertes", t, 16711680)
    end
)
RegisterNetEvent("nsac:trigger")
AddEventHandler(
    "nsac:trigger",
    function(U)
        if not doesPlayerHavePerms(source, ConfigCS.Bypass) then
            local s = GetPlayerName(source)
            local X = GetPlayerIdentifier(source)
            local identifiers, Y = GetPlayerIdentifiers(source)
            local steamid = false
            local license = false
            local discord = false
            local ips = false
            for H, B in ipairs(GetPlayerIdentifiers(source)) do
                if string.sub(B, 1, string.len("steam:")) == "steam:" then
                    permBanUser(X, B)
                elseif string.sub(B, 1, string.len("ip:")) == "ip:" then
                    permBanUser(X, B)
                elseif string.sub(B, 1, string.len("license:")) == "license:" then
                    permBanUser(X, B)
                elseif string.sub(B, 1, string.len("discord:")) == "discord:" then
                    permBanUser(X, B)
                end
            end
            for H, B in pairs(GetPlayerIdentifiers(source)) do
                if string.sub(B, 1, string.len("steam:")) == "steam:" then
                    steamid = B
                elseif string.sub(B, 1, string.len("license:")) == "license:" then
                    license = B
                elseif string.sub(B, 1, string.len("ip:")) == "ip:" then
                    ips = B
                elseif string.sub(B, 1, string.len("discord:")) == "discord:" then
                    discord = B
                end
            end
            TriggerEvent(
                "discordlog:sendToDiscord",
                "­[YKZ-AC]",
                "**\nNombre: **" ..
                    tostring(s) ..
                        "**\n Steam: **" ..
                            tostring(Y) ..
                                "**\n Discord: **" ..
                                    tostring(discord) ..
                                        "**\n Fivem: **" ..
                                            tostring(license) ..
                                                "**\nIP: **" .. tostring(ips) .. "**\nRaz├│n: **" .. tostring(U),
                16711680
            )
            print("^7[^2YKZ-AC^7] | ^2ID[" .. source .. "] Razon: " .. U .. "^0")
            DropPlayer(
                source,
                "­[YKZ-AC]| Usted a sido baneado permanentemente del servidor contactar en el discord para ayuda."
            )
        end
    end
)
RegisterServerEvent("AntiCheat:Cars")
AddEventHandler(
    "AntiCheat:Cars",
    function(Z, _)
        local s = GetPlayerName(source)
        local X = GetPlayerIdentifier(source)
        local a0 = _
        local steamid = false
        local license = false
        local discord = false
        local ips = false
        local a1 = "Exploit detected: Coches prohibidos: " .. "(" .. a0 .. ")"
        for H, B in pairs(GetPlayerIdentifiers(source)) do
            if string.sub(B, 1, string.len("steam:")) == "steam:" then
                steamid = B
            elseif string.sub(B, 1, string.len("license:")) == "license:" then
                license = B
            elseif string.sub(B, 1, string.len("ip:")) == "ip:" then
                ips = B
            elseif string.sub(B, 1, string.len("discord:")) == "discord:" then
                discord = B
            end
        end
        print("^7[^2YKZ-AC^7] | ^2" .. s .. "[" .. X .. "] ^0" .. a1)
        TriggerClientEvent("chatMessage", -1, "­YKZ-AC", {0, 255, 0}, "^7" .. s .. "^2 " .. a1)
        TriggerEvent(
            "discordlog:sendToDiscord",
            "­[YKZ-AC] - Coches Prohibidos",
            "**\nNombre: **" ..
                tostring(s) ..
                    "**\n Steam: **" ..
                        tostring(X) ..
                            "**\n Discord: **" ..
                                tostring(discord) ..
                                    "**\n Fivem: **" ..
                                        tostring(license) ..
                                            "**\nIP: **" .. tostring(ips) .. "**\nRaz├│n: **" .. tostring(a1),
            16711680
        )
    end
)
RegisterServerEvent("YakuzaYKZ-AC:armasprohibidas")
AddEventHandler(
    "YakuzaYKZ-AC:armasprohibidas",
    function(a2)
        local s = GetPlayerName(source)
        local X = GetPlayerIdentifier(source)
        local a3 = a2
        local steamid = false
        local license = false
        local discord = false
        local ips = false
        local a1 = "Tiene armas prohibidas: " .. "(" .. a3 .. ")"
        for H, B in pairs(GetPlayerIdentifiers(source)) do
            if string.sub(B, 1, string.len("steam:")) == "steam:" then
                steamid = B
            elseif string.sub(B, 1, string.len("license:")) == "license:" then
                license = B
            elseif string.sub(B, 1, string.len("ip:")) == "ip:" then
                ips = B
            elseif string.sub(B, 1, string.len("discord:")) == "discord:" then
                discord = B
            end
        end
        print("^7[^2YKZ-AC^7] | ^2" .. s .. "[" .. X .. "] ^0" .. a1)
        TriggerEvent(
            "discordlog:sendToDiscord",
            "­ [YKZ-AC] - ARMAS PROHIBIDAS",
            "**\nNombre: **" ..
                tostring(s) ..
                    "**\n Steam: **" ..
                        tostring(steamid) ..
                            "**\n Discord: **" ..
                                tostring(discord) ..
                                    "**\n Fivem: **" ..
                                        tostring(license) ..
                                            "**\nIP: **" .. tostring(ips) .. "**\nRazon:** " .. tostring(a1),
            16711680
        )
    end
)
RegisterServerEvent("YakuzaYKZ-AC:BanExplosiones")
AddEventHandler(
    "YakuzaYKZ-AC:BanExplosiones",
    function(Z, a1)
        local s = GetPlayerName(Z)
        local X = GetPlayerIdentifier(Z)
        local identifiers, Y = GetPlayerIdentifiers(source)
        local steamid = false
        local license = false
        local discord = false
        local ips = false
        for H, B in ipairs(GetPlayerIdentifiers(Z)) do
            if string.sub(B, 1, string.len("steam:")) == "steam:" then
                permBanUser(X, B)
            elseif string.sub(B, 1, string.len("ip:")) == "ip:" then
                permBanUser(X, B)
            elseif string.sub(B, 1, string.len("license:")) == "license:" then
                permBanUser(X, B)
            elseif string.sub(B, 1, string.len("discord:")) == "discord:" then
                permBanUser(X, B)
            end
        end
        for H, B in pairs(GetPlayerIdentifiers(Z)) do
            if string.sub(B, 1, string.len("steam:")) == "steam:" then
                steamid = B
            elseif string.sub(B, 1, string.len("license:")) == "license:" then
                license = B
            elseif string.sub(B, 1, string.len("ip:")) == "ip:" then
                ips = B
            elseif string.sub(B, 1, string.len("discord:")) == "discord:" then
                discord = B
            end
        end
        TriggerEvent(
            "discordlog:sendToDiscord",
            "­[YKZ-AC] BAN POR EXPLOSIONES",
            "**\nNombre: **" ..
                tostring(s) ..
                    "**\n Steam: **" ..
                        tostring(X) ..
                            "**\n Discord: **" ..
                                tostring(discord) ..
                                    "**\n Fivem: **" ..
                                        tostring(license) ..
                                            "**\nIP: **" .. tostring(ips) .. "**\nRaz├│n: **" .. tostring(a1),
            16711680
        )
        DropPlayer(
            Z,
            "­[YKZ-AC] |[YKZ-AC]| Usted a sido baneado permanentemente del servidor contactar en el discord para ayuda. Esta prohibido el Tema de explosivos"
        )
    end
)
RegisterServerEvent("YakuzaYKZ-AC:BanObjetos")
AddEventHandler(
    "YakuzaYKZ-AC:BanObjetos",
    function(Z, a1)
        local s = GetPlayerName(Z)
        local X = GetPlayerIdentifier(Z)
        local identifiers, Y = GetPlayerIdentifiers(source)
        local steamid = false
        local license = false
        local discord = false
        local ips = false
        for H, B in ipairs(GetPlayerIdentifiers(Z)) do
            if string.sub(B, 1, string.len("steam:")) == "steam:" then
                permBanUser(X, B)
            elseif string.sub(B, 1, string.len("ip:")) == "ip:" then
                permBanUser(X, B)
            elseif string.sub(B, 1, string.len("license:")) == "license:" then
                permBanUser(X, B)
            elseif string.sub(B, 1, string.len("discord:")) == "discord:" then
                permBanUser(X, B)
            end
        end
        for H, B in pairs(GetPlayerIdentifiers(Z)) do
            if string.sub(B, 1, string.len("steam:")) == "steam:" then
                steamid = B
            elseif string.sub(B, 1, string.len("license:")) == "license:" then
                license = B
            elseif string.sub(B, 1, string.len("ip:")) == "ip:" then
                ips = B
            elseif string.sub(B, 1, string.len("discord:")) == "discord:" then
                discord = B
            end
        end
        if s == nil then
        else
            TriggerEvent(
                "discordlog:sendToDiscord",
                "­[YKZ-AC] BAN POR OBJETOS BLOQUEADOS",
                "**\nNombre: **" ..
                    tostring(s) ..
                        "**\n Steam: **" ..
                            tostring(X) ..
                                "**\n Discord: **" ..
                                    tostring(discord) ..
                                        "**\n Fivem: **" ..
                                            tostring(license) .. "**\nIP: **" .. tostring(ips) .. "**\nRaz├│n: **" .. a1,
                16711680
            )
        end
        DropPlayer(
            Z,
            "­[YKZ-AC]| Usted a sido baneado permanentemente del servidor contactar en el discord para ayuda. BAN POR OBJETOS BLOQUEADOS"
        )
    end
)
RegisterServerEvent("YakuzaYKZ-AC:LogExplosiones")
AddEventHandler(
    "YakuzaYKZ-AC:LogExplosiones",
    function(Z, a1)
        local s = GetPlayerName(Z)
        local X = GetPlayerIdentifier(Z)
        local steamid = false
        local license = false
        local discord = false
        local ips = false
        for H, B in pairs(GetPlayerIdentifiers(Z)) do
            if string.sub(B, 1, string.len("steam:")) == "steam:" then
                steamid = B
            elseif string.sub(B, 1, string.len("license:")) == "license:" then
                license = B
            elseif string.sub(B, 1, string.len("ip:")) == "ip:" then
                ips = B
            elseif string.sub(B, 1, string.len("discord:")) == "discord:" then
                discord = B
            end
        end
        TriggerEvent(
            "discordlog:sendToDiscord",
            "­[YKZ-AC] LOG DE EXPLOSIONES",
            "**\nNombre: **" ..
                tostring(s) ..
                    "**\n Steam: **" ..
                        tostring(X) ..
                            "**\n Discord: **" ..
                                tostring(discord) ..
                                    "**\n Fivem: **" ..
                                        tostring(license) ..
                                            "**\nIP: **" .. tostring(ips) .. "**\nRaz├│n: **" .. tostring(a1),
            16711680
        )
    end
)
RegisterServerEvent("YakuzaYKZ-AC:BanMenu")
AddEventHandler(
    "YakuzaYKZ-AC:BanMenu",
    function(Z, a1)
        local s = GetPlayerName(Z)
        local X = GetPlayerIdentifier(Z)
        local identifiers, Y = GetPlayerIdentifiers(source)
        local steamid = false
        local license = false
        local discord = false
        local ips = false
        for H, B in ipairs(GetPlayerIdentifiers(Z)) do
            if string.sub(B, 1, string.len("steam:")) == "steam:" then
                permBanUser(X, B)
            elseif string.sub(B, 1, string.len("ip:")) == "ip:" then
                permBanUser(X, B)
            elseif string.sub(B, 1, string.len("license:")) == "license:" then
                permBanUser(X, B)
            elseif string.sub(B, 1, string.len("discord:")) == "discord:" then
                permBanUser(X, B)
            end
        end
        for H, B in pairs(GetPlayerIdentifiers(Z)) do
            if string.sub(B, 1, string.len("steam:")) == "steam:" then
                steamid = B
            elseif string.sub(B, 1, string.len("license:")) == "license:" then
                license = B
            elseif string.sub(B, 1, string.len("ip:")) == "ip:" then
                ips = B
            elseif string.sub(B, 1, string.len("discord:")) == "discord:" then
                discord = B
            end
        end
        TriggerEvent(
            "discordlog:sendToDiscord",
            "­[YKZ-AC]",
            "**\nNombre: **" ..
                tostring(s) ..
                    "**\n Steam: **" ..
                        tostring(steamid) ..
                            "**\n Discord: **" ..
                                tostring(discord) ..
                                    "**\n Fivem: **" ..
                                        tostring(license) .. "**\nIP: **" .. tostring(ips) .. "**\nRaz├│n: **" .. a1,
            16711680
        )
        DropPlayer(
            Z,
            "­[YKZ-AC] |[YKZ-AC]| Usted a sido baneado permanentemente del servidor contactar en el discord para ayuda. Ban Menu"
        )
        CancelEvent()
    end
)
AddEventHandler(
    "explosionEvent",
    function(a4, a5)
        if a5.ownerNetId == 0 then
            CancelEvent()
        end
        if a5.posX == 0.0 and a5.posY == 0.0 then
            CancelEvent()
        end
        for H in pairs(ConfigCS.ExplosionsList) do
            if a5.explosionType == H then
                if ConfigCS.ExplosionsList[H].log == true then
                    print(
                        "^7[^2YKZ-AC^7] | ^2 Detecci├│n de Explosi├│n: ^0[^7" ..
                            ConfigCS.ExplosionsList[H].name ..
                                "^0] ^2Jugador: ^0[^7" .. a4 .. "^0] " .. GetPlayerName(a4)
                    )
                    Citizen.Wait(50)
                    local a1 = "Detecci├│n de Explosi├│n: " .. ConfigCS.ExplosionsList[H].name
                    TriggerEvent("YakuzaYKZ-AC:LogExplosiones", a4, a1)
                else
                end
                if ConfigCS.ExplosionsList[H].ban == true then
                    local a1 = "Detecci├│n de Explosi├│n: " .. ConfigCS.ExplosionsList[H].name
                    TriggerEvent("YakuzaYKZ-AC:BanExplosiones", a4, a1)
                else
                end
            end
        end
    end
)
function IsPropBlacklisted(a6)
    local a7 = GetEntityModel(a6)
    if a7 ~= nil then
        if GetEntityType(a6) == 1 and GetEntityPopulationType(a6) == 7 then
            return true
        end
        for i = 1, #Config.ObjectsBL do
            local a8 =
                tonumber(Config.ObjectsBL[i]) ~= nil and tonumber(Config.ObjectsBL[i]) or
                GetHashKey(Config.ObjectsBL[i])
            if a8 == a7 then
                return true
            end
        end
    end
    return false
end
AddEventHandler(
    "entityCreating",
    function(a6)
        local a6 = a6
        if not DoesEntityExist(a6) then
            return
        end
        local a9 = NetworkGetEntityOwner(a6)
        local aa = NetworkGetNetworkIdFromEntity(a6)
        if IsPropBlacklisted(a6) then
            CancelEvent()
        end
        if GetEntityType(a6) ~= 0 then
            local a7 = GetEntityModel(a6)
            local ab = GetPlayerName(a9)
            for i, ac in ipairs(Config.ObjectsBL) do
                if a7 == GetHashKey(ac) then
                    if a9 == nil then
                    elseif ab == nil then
                    else
                        print(
                            "^7[^2YKZ-AC^7] | ^2 Deteccion de Objetos Bloqueados: ^0[^7" ..
                                ac .. "^0] ^2Jugador: ^0[^7" .. a9 .. "^0] " .. ab
                        )
                    end
                    local a1 = "Deteccion de Objeto Bloqueado: " .. ac
                    TriggerEvent("YakuzaYKZ-AC:BanObjetos", a9, a1)
                    Citizen.Wait(500)
                end
            end
        end
    end
)
function doesPlayerHavePerms(ad, ae)
    local af = false
    for H, B in ipairs(ae) do
        if IsPlayerAceAllowed(ad, B) then
            return true
        end
    end
    return false
end
function YakuzaYKZaclogkick(source, ag, ah)
    if ah then
        local s = GetPlayerName(source)
        for H, B in pairs(GetPlayerIdentifiers(source)) do
            if string.sub(B, 1, string.len("steam:")) == "steam:" then
                steamid = B
            elseif string.sub(B, 1, string.len("license:")) == "license:" then
                license = B
            elseif string.sub(B, 1, string.len("ip:")) == "ip:" then
                ips = B
            elseif string.sub(B, 1, string.len("discord:")) == "discord:" then
                discord = B
            end
        end
        TriggerEvent(
            "discordlog:sendToDiscord",
            "­[YKZ-AC]",
            "**\nNombre: **" ..
                tostring(s) ..
                    "**\n Steam: **" ..
                        tostring(steamid) ..
                            "**\n Discord: **" ..
                                tostring(discord) ..
                                    "**\n Fivem: **" ..
                                        tostring(license) ..
                                            "**\nIP: **" .. tostring(ips) .. "**\nRaz├│n: **" .. tostring(ag),
            16711680
        )
        DropPlayer(source, ag)
    end
end
AddEventHandler(
    "YakuzaYKZ-AC:ViolationDetected",
    function(ag, ah)
        if not doesPlayerHavePerms(source, ConfigCS.Bypass) then
            YakuzaYKZaclogkick(source, ag, ah)
        end
    end
)
AddEventHandler(
    "YakuzaYKZ-AC:kick",
    function(Z, ai)
        if doesPlayerHavePerms(source, ConfigCS.ClearAreaAllowed) then
            local s = GetPlayerName(Z)
            for H, B in pairs(GetPlayerIdentifiers(Z)) do
                if string.sub(B, 1, string.len("steam:")) == "steam:" then
                    steamid = B
                elseif string.sub(B, 1, string.len("license:")) == "license:" then
                    license = B
                elseif string.sub(B, 1, string.len("ip:")) == "ip:" then
                    ips = B
                elseif string.sub(B, 1, string.len("discord:")) == "discord:" then
                    discord = B
                end
            end
            TriggerEvent(
                "discordlog:sendToDiscord",
                "­[YKZ-AC] Kick Menu",
                "**\nNombre: **" ..
                    tostring(s) ..
                        "**\n Steam: **" ..
                            tostring(steamid) ..
                                "**\n Discord: **" ..
                                    tostring(discord) ..
                                        "**\n Fivem: **" ..
                                            tostring(license) ..
                                                "**\nIP: **" .. tostring(ips) .. "**\nRazon: **" .. tostring(ai),
                16711680
            )
            DropPlayer(Z, ai)
        else
            local aj = source
            local a1 = "[YKZ-AC] | No esta autorizado a usar esto, Banearme Global"
            TriggerEvent("YakuzaYKZ-AC:BanMenu", aj, a1)
        end
    end
)
AddEventHandler(
    "YakuzaYKZ-AC:adminmenuenable",
    function()
        for H, B in ipairs(ConfigCS.OpenMenuAllowed) do
            if not IsPlayerAceAllowed(source, B) then
                TriggerClientEvent("adminmenuenabley", source)
            end
        end
    end
)
AddEventHandler(
    "YakuzaYKZ-AC:checkup",
    function()
        if not doesPlayerHavePerms(source, ConfigCS.OpenMenuAllowed) then
            YakuzaYKZaclogkick(source, "unauthorized AdminMenu Opening")
        end
    end
)
AddEventHandler(
    "YakuzaYKZ-AC:openmenu",
    function()
        for H, B in ipairs(ConfigCS.OpenMenuAllowed) do
            if IsPlayerAceAllowed(source, B) then
                TriggerClientEvent("YakuzaYKZ-AC:openmenu", source)
            end
        end
    end
)
AddEventHandler(
    "YakuzaYKZ-AC:cleanareaveh",
    function()
        if doesPlayerHavePerms(source, ConfigCS.ClearAreaAllowed) then
            TriggerClientEvent("YakuzaYKZ-AC:cleanareavehy", -1)
        else
            YakuzaYKZaclogkick(source, "­[YKZ-AC] | unauthorized Clear Area", true)
        end
    end
)
RegisterNetEvent("YakuzaYKZ-AC:banmenu")
AddEventHandler(
    "YakuzaYKZ-AC:banmenu",
    function(ak)
        if doesPlayerHavePerms(source, ConfigCS.ClearAreaAllowed) then
            local a1 = "Baneado desde el Menu de YKZ-AC"
            TriggerEvent("YakuzaYKZ-AC:BanMenu", ak, a1)
        else
            local aj = source
            local a1 = "­[YKZ-AC] | No esta autorizado a usar esto, Banearme Global"
            TriggerEvent("YakuzaYKZ-AC:BanMenu", aj, a1)
        end
    end
)
AddEventHandler(
    "YakuzaYKZ-AC:cleanareapeds",
    function()
        if doesPlayerHavePerms(source, ConfigCS.ClearAreaAllowed) then
            TriggerClientEvent("YakuzaYKZ-AC:cleanareapedsy", -1)
        else
            YakuzaYKZaclogkick(source, "­[YKZ-AC] | unauthorized Clear Area", true)
        end
    end
)
RegisterNetEvent("YakuzaYKZ-AC:networkingobjetos")
AddEventHandler(
    "YakuzaYKZ-AC:networkingobjetos",
    function()
        if doesPlayerHavePerms(source, ConfigCS.ClearAreaAllowed) then
            TriggerClientEvent("YakuzaYKZ-AC:networkingobjetos2", -1)
        else
            YakuzaYKZaclogkick(
                source,
                "­[YKZ-AC] | No estas autorizado para usar esta funcion de Net Objetos",
                true
            )
        end
    end
)
AddEventHandler(
    "YakuzaYKZ-AC:cleanareaentity",
    function()
        if doesPlayerHavePerms(source, ConfigCS.ClearAreaAllowed) then
            TriggerClientEvent("YakuzaYKZ-AC:cleanareaentityy", -1)
        else
            YakuzaYKZaclogkick(source, "­[YKZ-AC] | unauthorized Clear Area", true)
        end
    end
)
for i = 1, #ConfigCS.lynx, 1 do
    RegisterServerEvent(ConfigCS.lynx[i])
    AddEventHandler(
        ConfigCS.lynx[i],
        function()
            local aj = source
            local a1 = "Ejecutar Trigger Event"
            TriggerEvent("YakuzaYKZ-AC:BanMenu", aj, a1)
            Citizen.Wait(50)
            CancelEvent()
        end
    )
end
AddEventHandler(
    "chatMessage",
    function(source, W, t)
        for H, W in pairs(ConfigCS.lol) do
            if string.match(t:lower(), W:lower()) then
                YakuzaYKZaclogkick(
                    source,
                    "­[YKZ-ANTICHEAT] | Has puesto una palabra prohibida, no lo hagas mas. " .. W,
                    true
                )
                CancelEvent()
            end
        end
    end
)
loadBans()




Citizen.CreateThread(function()
logo()


end)