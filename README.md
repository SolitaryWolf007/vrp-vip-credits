# vrp-vip-credits

### PT
Trecho de codigo para incrementar em sua base vRP 1.0 (ou ate mesmo 0.5 ?)
Para utilizar em lojas/scripts que dependam que o jogador tenha um numero minimo de creditos para utilizar um comando, função.

```lua
-- @user_id: user_id
-- @type: Nome da chave do Credito ("vip:plate","coc:veh")
-- @return: Valor de Creditos (>= 0)
local int = vRP.getVipCredits(user_id,type) 

-- @user_id: user_id
-- @type: nome da chave do Credito ("vip:plate","coc:veh")
-- @value: Quantidade de Creditos (> 0)
-- @return: true ou false
local success = vRP.useVipCredits(user_id,type,value)

-- @user_id: user_id
-- @type: nome da chave do Credito ("vip:plate","coc:veh")
-- @value: Quantidade de Creditos (> 0)
-- @return: true ou false
local success = vRP.addVipCredits(user_id,type,value)
```

### EN
Code snippet to increment your base vRP 1.0 (or even 0.5 ?)
For use in stores/scripts that depend on the player having a minimum number of credits to use a command, function.
```lua
-- @user_id: user_id
-- @type: Credit key name ("vip:plate","coc:veh")
-- @return: Credit Value (>= 0)
local int = vRP.getVipCredits(user_id,type)

-- @user_id: user_id
-- @type: Credit key name ("vip:plate","coc:veh")
-- @value: Amount of Credits (> 0)
-- @return: true or false
local success = vRP.useVipCredits(user_id,type,value)

-- @user_id: user_id
-- @type: Credit key name ("vip:plate","coc:veh")
-- @value: Amount of Credits (> 0)
-- @return: true or false
local success = vRP.addVipCredits(user_id,type,value)
```
