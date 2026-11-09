local Sol = require 'entities.Sol'
local Luna = require 'entities.Luna'
local bump = require 'libs.bump'

local PlayState = {}
local GRAVITY = 800

function PlayState:enter()
    self.world = bump.newWorld(64)
    
    self.sol = Sol.new(100, 100)
    self.luna = Luna.new(150, 100)
    self.suelo = { x = 0, y = 400, w = 1200, h = 50, is_ground = true }

    self.world:add(self.sol, self.sol.x, self.sol.y, self.sol.w, self.sol.h)
    self.world:add(self.luna, self.luna.x, self.luna.y, self.luna.w, self.luna.h)
    self.world:add(self.suelo, self.suelo.x, self.suelo.y, self.suelo.w, self.suelo.h)

    self.activo = self.sol
end

function PlayState:update(dt)
    -- Controles para el personaje activo únicamente
    self.activo.vx = 0
    if love.keyboard.isDown('right') or love.keyboard.isDown('d') then
        self.activo.vx = self.activo.speed
    elseif love.keyboard.isDown('left') or love.keyboard.isDown('a') then
        self.activo.vx = -self.activo.speed
    end

    -- Actualizar física de ambos (para que el inactivo siga sufriendo gravedad si está en el aire)
    self.sol:update(dt, self.world, GRAVITY)
    self.luna:update(dt, self.world, GRAVITY)
end

function PlayState:keypressed(key)
    if key == 'space' or key == 'w' or key == 'up' then
        self.activo:jump()
    elseif key == 'tab' then
        self.activo = (self.activo == self.sol) and self.luna or self.sol
    end
end