----------------------------------------------------------------------------------------
-- Map Generator By Liolabs1973                                                       --
----------------------------------------------------------------------------------------
-- 

local dungeon = {}
dungeon.width = 11
dungeon.height = 8
dungeon.map = {}

function RoomCreate (nLine, nColumn) 
    local newRoom = {}

    newRoom.Line = nLine
    newRoom.Column = nColumn
    newRoom.isOpen = false 
    newRoom.upDoor = false 
    newRoom.rightDoor = false
    newRoom.downDoor = false
    newRoom.leftDoor = false
    
    return newRoom
end

function DungeonCreate(nLine, nColumn)
    dungeon.map = {}
    
    for nLine = 1, dungeon.height do  
        dungeon.map[nLine] = {}
        for nColumn = 1, dungeon.width do 
            dungeon.map[nLine][nColumn] = RoomCreate(nLine, nColumn)
        end
    end

    -- Dungeon creation
    local roomsList =  {}
    local numOfRooms = 12

    -- Starting Room Creation
    local start_nLine,start_nColumn
    
    start_nLine = math.random(1, dungeon.height)
    start_nColumn = math.random(1, dungeon.width)

    local startingRoom = dungeon.map[start_nLine][start_nColumn]
    startingRoom.isOpen = true 
    table.insert(roomsList,startingRoom)

    -- Saving startingRoom 
    dungeon.startingRoom = startingRoom

    while #roomsList < numOfRooms do
        -- select a room from list
        local nRoom = math.random(1,#roomsList)
        local nLine = roomsList[nRoom].Line
        local nColumn = roomsList[nRoom].Column
        local room = roomsList[nRoom]
        local newRoom = nil
        local direction = math.random(1,4)
        local bAddRoom = false


        -- UP
        if direction == 1 and nLine > 1 then
            newRoom = dungeon.map[nLine - 1][nColumn]
            if newRoom.isOpen == false then
                room.upDoor = true
                newRoom.downDoor = true
                bAddRoom = true
            end
        -- RIGHT
        elseif direction == 2 and nColumn < dungeon.width then
            newRoom = dungeon.map[nLine][nColumn + 1]
            if newRoom.isOpen == false then
                room.rightDoor = true
                newRoom.leftDoor = true
                bAddRoom = true
            end
        -- DOWN
        elseif direction == 3 and nLine < dungeon.height then
            newRoom = dungeon.map[nLine + 1][nColumn]
            if newRoom.isOpen == false then
                room.downDoor = true
                newRoom.upDoor = true
                bAddRoom = true
            end
        -- LEFT
        elseif direction == 4 and nColumn > 1 then
            newRoom = dungeon.map[nLine][nColumn - 1]
            if newRoom.isOpen == false then
                room.leftDoor = true
                newRoom.rightDoor = true
                bAddRoom = true
            end
        end
        if bAddRoom == true then
            newRoom.isOpen = true
            table.insert(roomsList,newRoom)
        end
    end
end

function DungeonDraw(X, Y, caseWidth, caseHeight, space, R, V, B)
    local x = X 
    local y = Y 
    for nLine = 1, dungeon.height do
    x = X
        for nColumn = 1, dungeon.width do 
            local room = dungeon.map[nLine][nColumn]
            if room.isOpen == false then 
                love.graphics.setColor(R/255,V/255,B/255)
                love.graphics.rectangle("fill", x, y, caseWidth, caseHeight)
            else 
                if dungeon.startingRoom == room then  
                    love.graphics.setColor(25/255,255/255,25/255)
                else
                    love.graphics.setColor(1,1,1)
                end
                love.graphics.setColor(1,50/255,50/255)
                if room.upDoor == true then
                    love.graphics.rectangle("fill", (x + caseWidth / 2) -3,  y - 3, 4, 6)
                end
                if room.rightDoor == true then
                    love.graphics.rectangle("fill", (x + caseWidth) -3,  ( y + caseHeight / 2 ) - 3, 6, 4 )
                end
                if room.downDoor == true then
                    love.graphics.rectangle("fill", (x + caseWidth / 2) -3,  (y + caseHeight) - 3, 4, 6)
                end
                if room.leftDoor == true then
                    love.graphics.rectangle("fill", (x -3),  ( y + caseHeight / 2 ) - 3, 6, 4 )
                end
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
    DungeonCreate(dungeon.height,dungeon.width)
end 

function love.update()

end 

function love.draw()
    DungeonDraw(5,5,34,13,5,60,60,60)
end 

function love.keypressed(key)
    if key == 'space' then
        DungeonCreate(nLine,nColumn)
    end
end
