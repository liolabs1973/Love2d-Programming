function love.load()
    camera = require 'Libraries/camera'
    cam = camera()

    anim8 = require 'Libraries/anim8'
    love.graphics.setDefaultFilter("nearest", "nearest")

    sti = require 'Libraries/sti'
    gameMap = sti('Maps/TestMap.lua')

    sidehud = {}
    sidehud.width = 200
    sidehud.height = 768

    bottomhud = {}
    bottomhud.Width = 1024
    bottomhud.height = 100

    player = {}
    player.x = 400
    player.y = 200
    player.speed = 5
    player.sprite = love.graphics.newImage('Assets/Sprites/icon.png')
    player.spriteSheet = love.graphics.newImage('Assets/Sprites/kratos(2017).png')
    player.grid = anim8.newGrid( 64, 64 ,player.spriteSheet:getWidth(), player.spriteSheet:getHeight() )

    player.animations = {}
    player.animations.speed = 0.1
    player.animations.down = anim8.newAnimation(player.grid('1-9', 11), player.animations.speed)
    player.animations.up = anim8.newAnimation(player.grid('1-9', 9), player.animations.speed)
    player.animations.left = anim8.newAnimation(player.grid('1-9', 10), player.animations.speed)
    player.animations.right = anim8.newAnimation(player.grid('1-9', 12), player.animations.speed)

    player.anim = player.animations.left

    background = love.graphics.newImage('Assets/Backgrounds/fond.2.jpg')
end

function love.update(dt)
    local isMoving = false

    if love.keyboard.isDown("right") then
        player.x = player.x + player.speed 
        player.anim = player.animations.right
        isMoving = true
    end
    if love.keyboard.isDown("left") then
        player.x = player.x - player.speed
        player.anim = player.animations.left
        isMoving = true
    end
    if love.keyboard.isDown("up") then
        player.y = player.y - player.speed
        player.anim = player.animations.up
        isMoving = true
    end
    if love.keyboard.isDown("down") then
        player.y = player.y + player.speed
        player.anim = player.animations.down
        isMoving = true
    end

    if isMoving == false then
        player.anim:gotoFrame(1)
    end

    player.anim:update(dt)

    cam:lookAt(player.x, player.y)

    local w = love.graphics.getWidth() - sidehud.width
    local h = love.graphics.getHeight() - bottomhud.height

    if cam.x < w/2 then
        cam.x = w/2
    end

    if cam.y < h/2 then
        cam.y = h/2
    end

    local mapW = gameMap.width * gameMap.tilewidth
    local mapH = gameMap.height * gameMap.tileheight

    -- Right border
    if cam.x > (mapW - w/2)  then
        cam.x = (mapW - w/2) + sidehud.width
    end
    -- Bottom border
    if cam.y > (mapH - h/2) then
        cam.y = (mapH - h/2)
    end

end

function love.draw()
    cam:attach()
        gameMap:drawLayer(gameMap.layers["Ground"])
        gameMap:drawLayer(gameMap.layers["Trees"])
        player.anim:draw(player.spriteSheet, player.x, player.y, nil, 2, nil, 32, 32)
    cam:detach()
    love.graphics.rectangle("fill", 824, 0, 200, 768)
 end
    

