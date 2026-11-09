local Sol = {}
Sol.__index = Sol

function Sol.new(x, y)
    local instance = {
        x = x,
        y = y,
        w = 32,
        h = 32,
        vx = 0,
        vy = 0,
        speed = 200,          -- Más rápido corriendo
        jump_force = -340,    -- Salto más bajo
        gravity_scale = 1.35, -- Cae rápido y firme
        is_grounded = false,
        color = {1, 0.5, 0}
    }
    return setmetatable(instance, Sol)
end

function Sol:update(dt, world, GRAVITY)
    -- Aplicar gravedad con multiplicador propio
    self.vy = self.vy + (GRAVITY * self.gravity_scale) * dt

    local target_x = self.x + self.vx * dt
    local target_y = self.y + self.vy * dt

    -- Mover en bump.lua usando filtro 'slide' para no atascarse en paredes
    local actual_x, actual_y, cols, len = world:move(self, target_x, target_y, self.filter)
    self.x = actual_x
    self.y = actual_y

    -- Verificar si está pisando suelo firme (normal.y == -1 significa colisión desde arriba)
    self.is_grounded = false
    for i = 1, len do
        if cols[i].normal.y == -1 then
            self.is_grounded = true
            self.vy = 0
        elseif cols[i].normal.y == 1 then
            self.vy = 0 -- Chocó el techo
        end
    end
end

function Sol:jump()
    if self.is_grounded then
        self.vy = self.jump_force
        self.is_grounded = false
    end
end

function Sol.filter(item, other)
    if other.is_ground then return 'slide' end
    return nil
end

return Sol