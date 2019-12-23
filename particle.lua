Particle = {}
Particle.__index = Particle

function Particle: create(x, y, x0, y0)
    local particle  = {}
    setmetatable(particle, Particle)
    particle.location1 = Vector:create(x,y)
    particle.location2 = Vector:create(x0,y0)
    particle.velocity = Vector:create(math.random(-50,50)/10,
                                        math.random(-50,50)/10)
    particle.acceleration = Vector:create(0, 0.05)
    particle.decay = math.random(3, 10) * 0.1
    particle.gravity = Vector:create(0, 0.1)
    particle.livetime = 100
    particle.texture = love.graphics.newImage("ball.png")
    particle.x0 = x0
    particle.y0 = y0
    return particle
end

function Particle:update()
    self.velocity:add(self.acceleration)
    self.velocity:add(self.gravity)

    self.location1:add(self.velocity)
    self.location2:add(self.velocity)

    self.acceleration:mul(0)
    
    self.livetime = self.livetime - self.decay
end

function Particle: draw()
    love.graphics.setColor(255,255,255,1)
    love.graphics.line(self.location1.x, self.location1.y, self.location2.x, self.location2.y)
    
end

function Particle: isDead()
    return self.livetime < 0
  end