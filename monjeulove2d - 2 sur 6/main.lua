function love.load()
 -- Fonction qui va contenir tous les éléments à charger pour faire 
 -- fonctionner le jeu vidéo.
    -- Variables numériques
    Energie = 100
    NombreDeVie = Energie / 25
    Bonus  = 1
    BonusDegat = 2
    Longueur = 36.57
    Degats = 100 * BonusDegat
    NombreMonstres = 500
    -- Variable Booléenne
    GameOver = false
    -- Variable de type Chaine de caractère
    String1 = "Zoltan"
    String2 = "le Barbare"
    
    Player = {}
    --Player = { "Un", "Deux", "Trois", "Quatre" }
    --
    --Player[1] = "Un"
    --Player[2] = "Deux"
    --Player[3] = "Trois"
    --Player[4] = "Quatre"
    Player.Degats = 3.7
    
    
    
    
end

function love.update()
-- Fonction qui va mettre à jour l'ensemble des éléments qui compose
-- votre jeu vidéo.
end

function love.draw()
-- Fonction qui va dessiner les éléments du jeu sur l'écran
  love.graphics.print(String1 .. " " .. String2, 100, 50)
  love.graphics.print("Nombre de Vie : " .. NombreDeVie + Bonus, 100 , 70)
  love.graphics.print("Nombre de Dégats : " .. Degats, 100, 90)
  love.graphics.print("Nombre de Monstres : " .. NombreMonstres - Degats, 100, 110)
  love.graphics.print("Player : " .. Player.Degats,100,130)
end
