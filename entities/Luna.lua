local Luna = {}
Luna.__index = Luna

function Luna.new(x, y)
    local instance = {
        x = x,
        y = y,
        w = 24,
        h = 44,
        vx = 0,
        vy = 0,
        speed = 160,          -- Más lenta en tierra
        jump_force = -420,    -- Salto significativamente más alto
        gravity_scale = 0.90, -- Más tiempo suspendida en el aire
        is_grounded = false,
        color = {0, 0.5, 1}
    }
    return setmetatable(instance, Luna)
end

function Luna:update(dt, world, GRAVITY)
    self.vy = self.vy + (GRAVITY * self.gravity_scale) * dt

    local target_x = self.x + self.vx * dt
    local target_y = self.y + self.vy * dt

    local actual_x, actual_y, cols, len = world:move(self, target_x, target_y, self.filter)
    self.x = actual_x
    self.y = actual_y

    self.is_grounded = false
    for i = 1, len do
        if cols[i].normal.y == -1 then
            self.is_grounded = true
            self.vy = 0
        elseif cols[i].normal.y == 1 then
            self.vy = 0
        end
    end
end

function Luna:jump()
    if self.is_grounded then
        self.vy = self.jump_force
        self.is_grounded = false
    end
end

function Luna.filter(item, other)
    if other.is_ground then return 'slide' end
    return nil
end

return Luna