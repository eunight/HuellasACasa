local StateManager = {
    current = nil
}

function StateManager.switch(newState)
    -- Si el estado actual tiene una función de salida, ejecútala para limpiar memoria
    if StateManager.current and StateManager.current.exit then
        StateManager.current:exit()
    end
    
    StateManager.current = require('states.' .. newState)
    
    -- Inicia el nuevo estado
    if StateManager.current.enter then
        StateManager.current:enter()
    end
end

function StateManager.update(dt)
    if StateManager.current and StateManager.current.update then
        StateManager.current:update(dt)
    end
end

function StateManager.draw()
    if StateManager.current and StateManager.current.draw then
        StateManager.current:draw()
    end
end

function StateManager.keypressed(key)
    if StateManager.current and StateManager.current.keypressed then
        StateManager.current:keypressed(key)
    end
end

return StateManager