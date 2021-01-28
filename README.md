# fxserver-input
Input utilities for FXServer

[INSTALLATION]

Set it as a dependency in you fxmanifest.lua

```
client_script '@input/input.lua'
```

[EVENTS]

```
AddEventHandler('RequestInput', function(name,cb,x,y)
```

[HOW IT WORKS]

```
TriggerEvent('RequestInput',WhoNameNeedThisInput,function(action,text)
    action >> "update" || "enter"
    text >> "a" "b" "c" "d" || "abcd"
end,x,y)
```

[EXAMPLE]

```
--[[
Citizen.CreateThread(function()
    SetNuiFocus(false, false)
    Wait(555)
    TriggerEvent('RequestInput','game_print',function(action,text,who)
        if action then 
                if action == 'update' then 
                    print(who..':update:'..text)
                elseif action == 'enter' then 
                    print(who..':enter:'..text)
                end 
        end 
    end,100,100)
    TriggerEvent('RequestInput','game_print2',function(action,text,who)
        if action then 
                if action == 'update' then 
                    print(who..':update:'..text)
                elseif action == 'enter' then 
                    print(who..':enter:'..text)
                end 
        end 
    end,100,100)
end)
]]--
```