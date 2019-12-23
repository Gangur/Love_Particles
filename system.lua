System = {}
System.__index = System

function System:create(x,y)
    local system = {}
    setmetatable(system, System)
    system.origin = Vector:create(x, y)
    system.particles = {}
    system.index = 0

    system.v1 = Particle:create(x, y, x+100, y)
    system.v2 = Particle:create(x, y, x, y+100)
    system.v3 = Particle:create(x, y, x-100, y)
    system.v4 = Particle:create(x, y, x, y-100)

    return system
end

function System:draw()
    self.v1:draw()
    self.v2:draw()
    self.v3:draw()
    self.v4:draw()
end

function System:update()
    
    self.v1:update()
    self.v2:update()
    self.v3:update()
    self.v4:update()
end