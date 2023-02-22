--[[
    text.lua 
    
    Module qui permet d'afficher du texte avec différentes possibilités dans une fenêtre de jeu:
    
    disposer des fonctions suivantes : 
    
    une fonction qui affiche un texte dans une police de caractère prédéfinie dans la fonction love.load() 
    du fichier main.lua, à une position passée en paramètre à l'aide de paramètre tels que x et y, dans 
    une couleur spécifique. je souhaite également que cette fonction prennent 3 paramètres supplémentaires : 
    
        1) FadeIn qui me permettra de faire apparaitre le texte progressivement en fonction de la valeur 
            introduite par l'utilisateur par exemple si FadeIn=5, cela signifiera que le texte apparaitra 
            en 5 secondes. 
        
        2) un paramètre TextDuration qui correspondra à son temps d'affichage à l'écran, exemple si 
            TextDuration = 3, le texte restera affiché pendant 3 secondes si TextDuration = -1, il devra 
            rester infiniment affiché. 
        
        3) Un paramètre FadeOut qui fera disparaitre le texte progressivement, si FadeOut = 4, le temps de 
        disparition sera de 4 secondes sauf si biensur TextDuration est un nombre négatif.
]]--

local Text = {}

function Text.print(text, x, y, color, font, fadeIn, textDuration, fadeOut)
  font = font or love.graphics.getFont()
  color = color or {1, 1, 1, 1}
  fadeIn = fadeIn or 0
  textDuration = textDuration or -1
  fadeOut = fadeOut or 0
  
  local alpha = 0
  local timer = 0
  local isFadingIn = fadeIn > 0
  local isFadingOut = fadeOut > 0 and textDuration >= 0
  
  local function update(dt)
    if isFadingIn then
      alpha = alpha + dt / fadeIn
      if alpha >= 1 then
        alpha = 1
        isFadingIn = false
      end
    elseif isFadingOut then
      alpha = alpha - dt / fadeOut
      if alpha <= 0 then
        alpha = 0
        isFadingOut = false
      end
    elseif textDuration >= 0 then
      timer = timer + dt
      if timer >= textDuration then
        timer = 0
        isFadingOut = fadeOut > 0
      end
    end
  end
  
  local function draw()
    love.graphics.setColor(color[1], color[2], color[3], color[4] * alpha)
    love.graphics.setFont(font)
    love.graphics.print(text, x, y)
  end
  
  return {
    update = update,
    draw = draw,
    isAlive = function() return textDuration < 0 or timer < textDuration + fadeIn + fadeOut end
  }
end

return Text