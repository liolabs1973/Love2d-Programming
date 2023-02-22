--[[
Dans cet exemple, la fonction Text.print() crée un objet qui peut être mis à jour 
et affiché dans la fonction love.update() et love.draw() respectivement. Les paramètres 
text, x, y, color et font définissent le texte à afficher, sa position, sa couleur et 
sa police de caractères. Les paramètres fadeIn, textDuration et fadeOut définissent 
les effets de fondu entrant, la durée de l'affichage du texte et les effets de fondu 
sortant, respectivement. Si la valeur de textDuration est négative, le texte reste 
affiché indéfiniment.

La méthode isAlive() est utilisée pour déterminer si l'objet doit continuer à être mis 
à jour et affiché. Cela dépend de la valeur de textDuration, fadeIn et fadeOut.

Notez que ce module peut être personnalisé selon vos besoins en modifiant les paramètres 
et les méthodes en conséquence.

]]--

-- main.lua

local Text = require("text")
local Timer = require("timer")

local delayTimer1 = nil
local delayTimer2 = nil
local delayTimer3 = nil

local myText = nil

local red   = {1,0,0,1}
local green = {0,1,0,1}
local blue  = {0,0,1,1}

function love.load()
  myText = Text.print("Hello world!", 100, 100, red, love.graphics.newFont(32), 2, 5, 2)
  
  myText2 = Text.print("Liolabs Studio Present", 100, 100, green, love.graphics.newFont(32), 2, 5, 2)
  
  myText3 = Text.print("A new retro Game", 100, 100, green, love.graphics.newFont(32), 2, 5, 2)
  
  DelayTimer1 = Timer.delay(1)
  DelayTimer3 = Timer.delay(3)
  DelayTimer5 = Timer.delay(5)
end

function love.update(dt)
  
      if myText then
        myText.update(dt)
      end
    
  
  
      if myText2 then
        myText.update(dt)
      end
  
  
      if myText3 then
        myText.update(dt)
      end
 
end

function love.draw()
  
  if myText then
    myText.draw()
  end
  
  if myText2 then
    myText2.draw()
  end
  
  if myText3 then
    myText3.draw()
  end
  
end