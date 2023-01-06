function love.load()
    anim8 = require 'Libraries/anim8'
    love.graphics.setDefaultFilter("nearest", "nearest")

    player = {}
    player.x = 400
    player.y = 200
    player.speed = 5
    player.spriteSheet = love.graphics.newImage('Assets/Sprites/Grinch.png')
    
    player.grid = anim8.newGrid( 64, 64 ,player.spriteSheet:getWidth(), player.spriteSheet:getHeight() )

    player.animations = {}
    player.animations.speed = 0.1
    player.animations.down = anim8.newAnimation(player.grid('1-9', 11), player.animations.speed)
    player.animations.up = anim8.newAnimation(player.grid('1-9', 9), player.animations.speed)
    player.animations.left = anim8.newAnimation(player.grid('1-9', 10), player.animations.speed)
    player.animations.right = anim8.newAnimation(player.grid('1-9', 12), player.animations.speed)
    player.animations.backdance = anim8.newAnimation(player.grid('1-7',1), player.animations.speed)
    player.animations.leftdance = anim8.newAnimation(player.grid('1-7',2), player.animations.speed)
    player.animations.frontdance = anim8.newAnimation(player.grid('1-7',3), player.animations.speed)
    player.animations.rightdance = anim8.newAnimation(player.grid('1-7',4), player.animations.speed)
    player.animations.backshoot = anim8.newAnimation(player.grid('1-8',5), player.animations.speed)
    player.animations.pushleft = anim8.newAnimation(player.grid('1-8',6), player.animations.speed)
    player.animations.Prepareshoot = anim8.newAnimation(player.grid('1-8',7), player.animations.speed)
    player.animations.pushright = anim8.newAnimation(player.grid('1-8',8), player.animations.speed)
    player.animations.backopenright = anim8.newAnimation(player.grid('1-9',13), player.animations.speed)
    player.animations.shootleft = anim8.newAnimation(player.grid('1-9',14), player.animations.speed)
    player.animations.frontopenright = anim8.newAnimation(player.grid('1-9',15), player.animations.speed)
    player.animations.shootright = anim8.newAnimation(player.grid('1-9',16), player.animations.speed)
    player.animations.frontshoot = anim8.newAnimation(player.grid('1-9',19), player.animations.speed)
    player.animations.die = anim8.newAnimation(player.grid('1-7',21), player.animations.speed)
    -- Default animation
    player.anim = player.animations.left

    background = love.graphics.newImage('Assets/Backgrounds/fond.2.jpg')
end

function love.update(dt)
    local isMoving = false

    if love.keyboard.isDown('right') then
        player.x = player.x + player.speed 
        player.anim = player.animations.right
        isMoving = true
    end
    if love.keyboard.isDown('left') then
        player.x = player.x - player.speed
        player.anim = player.animations.left
        isMoving = true
    end
    if love.keyboard.isDown('up') then
        player.y = player.y - player.speed
        player.anim = player.animations.up
        isMoving = true
    end
    if love.keyboard.isDown('down') then
        player.y = player.y + player.speed
        player.anim = player.animations.down
        isMoving = true
    end
    if love.keyboard.isDown('a') then
        player.anim = player.animations.backdance
        isMoving = true
    end

    if love.keyboard.isDown('w') then
        player.anim = player.animations.frontshoot
        isMoving = true
    end



    if isMoving == false then
        player.anim:gotoFrame(1)
    end

    player.anim:update(dt)

    
end

function love.draw()
    love.graphics.draw(background,0,0,0,4,4)
    player.anim:draw(player.spriteSheet, player.x, player.y, nil, 2, nil, 32, 32)
    
    love.graphics.rectangle("fill", 824, 0, 200, 768)
 end
    

