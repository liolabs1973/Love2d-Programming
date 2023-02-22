--[[
-------------------- timer.lua ---------------------
le module timer.lua contient une fonction delay(Time) qui me permet de faire un pause sans interrompre 
les autres processus en cours. La variable Time exprime une durée exprimée en seconde. 

Exemple delay(3.5) cette fonction retournera la valeur true lorsque la variable Time sera à 0.
-----------------------------------------------------
]]--



local Timer = {}

function Timer.delay(time)
  local t = 0
  return function(dt)
    t = t + dt
    if t >= time then
      t = 0
      return true
    end
    return false
  end
end

return Timer

