local StateManager = require 'core.StateManager'

function love.load()
    love.window.setTitle("Huellas a Casa")
    love.graphics.setDefaultFilter('nearest', 'nearest') -- Vital para tu pixel art
    
    -- Arrancamos en la pantalla de inicio
    StateManager.switch('MenuState')
end

function love.update(dt)
    StateManager.update(dt)
end

function love.draw()
    StateManager.draw()
end

function love.keypressed(key)
    -- Botón de emergencia universal para salir
    if key == 'escape' then
        love.event.quit()
    end
    StateManager.keypressed(key)
end