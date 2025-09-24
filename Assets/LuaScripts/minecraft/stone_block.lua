local stoneint = 0
local stoneitem = stone_block
local obj = stone
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
        stoneint = stoneint + 1
        if stoneint >= 15 then
            CS.UnityEngine.Object.Destroy(obj)
            local dropitem = Object.Instantiate(stoneitem)
            dropitem.transform.position = position
        end
end