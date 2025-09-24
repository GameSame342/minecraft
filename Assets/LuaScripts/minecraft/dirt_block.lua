local dirtint = 0
local grassitem = dirt_block
local obj = dirt
local deleteTimers = {}
local isInsideTrigger = false-- флаг, указывающий, находится ли объект сейчас в триггере
local Object = CS.UnityEngine.Object
local position = obj.transform.position

function RrukaEnter()
    if not isInsideTrigger then
        isInsideTrigger = true
        ruka()
    end
end

function RrukaExit()
    if isInsideTrigger then
        isInsideTrigger = false
        -- Здесь можно вызвать другую функцию, если нужно
        -- Например, print("Объект вышел из триггера")
    end
end

function ruka()
        dirtint = dirtint + 1
        if dirtint >= 5 then
            CS.UnityEngine.Object.Destroy(obj)
            local dropitem = Object.Instantiate(grassitem)
            dropitem.transform.position = position
        end
end