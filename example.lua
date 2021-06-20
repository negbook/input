local nowtext1 = 'default' 
local nowtext2 = 'default' 

Citizen.CreateThread(function()
    SetNuiFocus(false, false)
    Wait(555)
    TriggerEvent('RequestInput','game_print',function(action,text,who)
        if action then 
                if action == 'firstrun' then 
                    nowtext1 = 'nowtext1 ready,Type your text!'
                elseif action == 'update' then 
                    print(who..':update:'..text)
                    nowtext1 = 'nowtext1' ..text
                elseif action == 'enter' then 
                    print(who..':enter:'..text)
                    nowtext1 = 'nowtext1 entered'
                end 
        end 
    end,100,100)
    TriggerEvent('RequestInput','game_print2',function(action,text,who)
        if action then 
                if action == 'firstrun' then 
                    nowtext2 = 'nowtext2 ready,Type your text!'
                elseif action == 'update' then 
                    print(who..':update:'..text)
                    nowtext2 = 'nowtext2' ..text
                elseif action == 'enter' then 
                    print(who..':enter:'..text)
                    nowtext2 = 'nowtext2 entered'
                end 
        end 
    end,100,100)
end)

CreateThread(function()
    while true do 
        Wait(0)
        local tbl = GetOffsetFromEntityInWorldCoords(PlayerPedId(),0.0,1.0,0.0)
       
        tbl = vector3(tbl.x,tbl.y,tbl.z+1.0)
        DrawText3D(tbl,nowtext1)
        tbl = vector3(tbl.x,tbl.y,tbl.z+0.5)
        DrawText3D(tbl,nowtext2)
    end 
end)


function DrawText3D(coords, text)
    local onScreen, _x, _y = World3dToScreen2d(coords.x, coords.y, coords.z)
    SetTextFont(0)
    SetTextScale(0.4, 0.4)
    SetTextProportional(1)
    SetTextEntry("STRING")
    SetTextCentre(1)
    SetTextColour(255, 255, 255, 255)
    SetTextOutline()
    
    AddTextComponentString(text)
    DrawText(_x, _y)
end
