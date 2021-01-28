local cbs = {} 

RegisterNUICallback("update", function(data, cb)
    for i,v in pairs(cbs) do 
        if(v) then 
        v('update',data.string,i)
        end 
    end 
    cb(SetNuiFocus(true, false))
end)
--[[
RegisterNUICallback("clear", function(data, cb)
    for i,v in pairs(cbs) do 
        if(v) then 
        v('clear',data.string)
        end 
    end 
    cb(SetNuiFocus(true, false))
end)
]]--

RegisterNUICallback("enter", function(data, cb)
    SendNUIMessage({
        action    = 'closeInput'
        })
        for i,v in pairs(cbs) do 
            if(v) then 
            v('enter',data.string,i)
            cbs[i] = nil 
            end 
        end 
    
    cb(SetNuiFocus(false, false))
end)

RegisterNetEvent('RequestInput')
AddEventHandler('RequestInput', function(name,cb,x,y)
	SendNUIMessage({
        action    = 'displayInput',
    })
    if x and y then 
        SendNUIMessage({
            action    = 'setIMEPos',
            x    = x,
            y    = y
        })
    end 
    if cbs and not cbs[name] then 
        cbs[name] = cb 
        cbs[name]('firstrun',nil,name)
    end     
	SetNuiFocus(true, false)
end)
