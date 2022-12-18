function love.load() 
  positionImg1=0
  positionImg2=0
  positionImg3=0
  positionImg4=0
  img1 = love.graphics.newImage("Tiles/background1.png")
  img2 = love.graphics.newImage("Tiles/background2.png")
  img3 = love.graphics.newImage("Tiles/background3.png")
  img4 = love.graphics.newImage("Tiles/background4b.png")
end

function love.update(dt)
  positionImg1 = positionImg1 + 10 * dt
  if positionImg1 >= img1:getWidth() then
    positionImg1 = 0
  end
  
  positionImg2 = positionImg2 + 20 * dt
  if positionImg2 >= img2:getWidth() then
    positionImg2 = 0
  end
  
  positionImg3 = positionImg3 + 30 * dt
  if positionImg3 >= img3:getWidth() then
    positionImg3 = 0
  end
  
  positionImg4 = positionImg4 + 40 * dt
  if positionImg4 >= img4:getWidth() then
    positionImg4 = 0
  end
end

function love.draw()
  love.graphics.draw(img1, positionImg1,0)
  love.graphics.draw(img1, positionImg1 - img1:getWidth(),0)
  love.graphics.draw(img2, positionImg2,0)
  love.graphics.draw(img2, positionImg2 - img2:getWidth(),0)
  love.graphics.draw(img3, positionImg3,0)
  love.graphics.draw(img3, positionImg3 - img3:getWidth(),0)
  love.graphics.draw(img4, positionImg4,0)
  love.graphics.draw(img4, positionImg4 - img4:getWidth(),0)
end
