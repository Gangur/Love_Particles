System = {}
System.__index = System

function System:create(x,y, n)
    local system = {}
    setmetatable(system, System)
    system.origin = Vector:create(x, y)
    system.n = n or 10
    system.particles = {}
    system.index = 0
    return system
end

function System:draw()
    for k, v in pairs(self.particles) do
        v:draw()
    end
end

function System:update()
    if #self.particles < self.n then
        self.particles[self.index] = Particle:create(self.origin.x, self.origin.y)
        self.index = self.index + 1
    end
    for k, v in pairs(self.particles) do
        if v:isDead() then
            v = Particle:create(self.origin.x, self.origin.y)
            self.particles[k] = v 
        end
        v:update()
    end
end