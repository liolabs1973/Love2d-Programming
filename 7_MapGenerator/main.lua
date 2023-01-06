----------------------------------------------------------------------------------------
-- Map Generator By Liolabs1973                                                       --
----------------------------------------------------------------------------------------
-- 

local dungeon = {}
dungeon.width = 9
dungeon.height = 6 
dungeon.map = {}

function DungeonCreate(nColumn, nLine)
    dungeon.map = {}
    for nLine = 1, dungeon.height do
        dungeon.map[nLine] = {}
        for nColumn = 1, dungeon.width do 
            dungeon.map[nLine][nColumn] = nil
        end
    end
end

function DungeonDraw(X, Y, caseWidth, caseHeight, space, R, V, B)
    local x = X 
    local y = Y 
    for nLine = 1, dungeon.height do
    x = X
        for nColumn = 1, dungeon.width do 
            if dungeon.map[nLine][nColumn] == nil then 
                love.graphics.setColor(R/255,V/255,B/255)
            else 
                love.graphics.setColor(1,1,1)
            end
            love.graphics.rectangle("fill", x, y, caseWidth, caseHeight)
            x = x + caseWidth + space 
        end
        y = y + caseHeight + space 
    end
    love.graphics.setColor(1,1,1)
end
    

function love.load()
    DungeonCreate(dungeon.width,dungeon.height)
end 

function love.update()

end 

function love.draw()
    DungeonDraw(5,5,34,13,5,60,60,60)
end 

