--[[
Citizen.CreateThread(function()
    SetNuiFocus(false, false)
    Wait(555)
    TriggerEvent('RequestInput','game_print',function(action,text,who)
        if action then 
                if action == 'firstrun' then 

                elseif action == 'update' then 
                    print(who..':update:'..text)
                elseif action == 'enter' then 
                    print(who..':enter:'..text)
                end 
        end 
    end,100,100)
    TriggerEvent('RequestInput','game_print2',function(action,text,who)
        if action then 
                if action == 'firstrun' then 

                elseif action == 'update' then 
                    print(who..':update:'..text)
                elseif action == 'enter' then 
                    print(who..':enter:'..text)
                end 
        end 
    end,100,100)
end)
--]]