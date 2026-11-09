local MenuState = {}

function MenuState:enter()
    self.opciones = {"Iniciar Juego (Ir a Intro)", "Controles", "Salir"}
    self.seleccion = 1
end

function MenuState:update(dt)
    -- Lógica del menú
end

function MenuState:draw()
    love.graphics.print("HUELLAS A CASA", 300, 150)
    love.graphics.print("Presiona ENTER para avanzar al estado Intro", 250, 200)
end

function MenuState:keypressed(key)
    local StateManager = require 'core.StateManager'
    
    if key == 'return' then
        StateManager.switch('IntroState') -- Aquí saltas a tu siguiente pantalla
    end
end

return MenuState