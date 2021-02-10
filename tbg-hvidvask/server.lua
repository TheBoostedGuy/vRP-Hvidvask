local Tunnel = module("vrp", "lib/Tunnel") 
local Proxy = module("vrp", "lib/Proxy")
vRP = Proxy.getInterface("vRP")


local DISCORD_WEBHOOK = "INDSÆT WEBHOOK HER!"


RegisterServerEvent('theboostedguy:starthvidvask')
AddEventHandler('theboostedguy:starthvidvask', function()
  local user_id = vRP.getUserId({source})
  if vRP.getInventoryItemAmount({user_id,Config.Item}) < Config.HvidvaskAmount then
    TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Du har ikke nok sorte penge på dig!', length = 2500, style = { ['background-color'] = '#dc1313', ['color'] = '#ffffff' } })
    PerformHttpRequest(DISCORD_WEBHOOK, function(err, text, headers) end, 'POST', json.encode({content = "ID: " ..user_id.. " havde ikke nok penge til at hvidvaske 1000kr!", tts = false}), { ['Content-Type'] = 'application/json' })
  else
    vRP.tryGetInventoryItem({user_id,Config.Item,Config.HvidvaskAmount})
    vRP.giveMoney({user_id, Config.HvidvaskUdbytte})
    TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = 'Du modtog 850kr!', length = 2500, style = { ['background-color'] = '#4ad066', ['color'] = '#ffffff' } })
    PerformHttpRequest(DISCORD_WEBHOOK, function(err, text, headers) end, 'POST', json.encode({content = "ID: " ..user_id.. " hvidvaskede 1000kr og modtog 850kr!", tts = false}), { ['Content-Type'] = 'application/json' })
  end
end)
