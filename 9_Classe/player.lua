Player = {}

function Player:load()
    self.x = 50
    self.y = love.graphics.getHeight()/2
    self.width = 20
    self.height = 100
    self.speed = 500
end

function Player:update(dt)
    self:move(dt)
    self:CheckBorder(dt)
end

function Player:draw()
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end

function Player:move(dt)
    -- Gestion du déplacement de la palette de jeu
    if love.keyboard.isDown("a") then
        self.y = self.y - self.speed * dt
    elseif love.keyboard.isDown("q") then
        self.y = self.y + self.speed * dt
    end
end

function Player:CheckBorder(dt)
    -- Gestion des limites de déplacement de la palette sur l'écran
    if self.y < 0 then
        self.y = 0
    elseif self.y + self.height > love.graphics.getHeight() then
        self.y = love.graphics.getHeight() - self.height
    end
end