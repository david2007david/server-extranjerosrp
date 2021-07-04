Citizen.CreateThread(function()
    while true do

        --This is the Application ID (Replace this with you own)
		SetDiscordAppId(794688448446332968)
        SetDiscordRichPresenceAsset('extranjerosrpp') --Big picture asset name
        SetDiscordRichPresenceAssetText('extranjerosrpp') --Big picture hover text
        SetDiscordRichPresenceAssetSmall('logo_extranjeros_rp') --Small picture asset name
        SetDiscordRichPresenceAssetSmallText('logo_extranjeros_rp') --Small picture hover text
        --It updates every one minute just in case.
		Citizen.Wait(60000)
	end
end)
RegisterNetEvent("mole_utils:presencecount")
AddEventHandler("mole_utils:presencecount", function(count)
    SetDiscordAppId(794688448446332968)
    SetRichPresence(count.. " Jugadores")
end)
