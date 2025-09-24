local grassint = 0
local grassitem = grass_block
local obj = grass
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
        grassint = grassint + 1
        if grassint >= 5 then
            CS.UnityEngine.Object.Destroy(obj)
            local dropitem = Object.Instantiate(grassitem)
            dropitem.transform.position = position
        end
end