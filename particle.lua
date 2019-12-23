Particle = {}
Particle.__index = Particle

function Particle: create(x,y)
    local particle  = {}
    setmetatable(particle, Particle)
    particle.location = Vector:create(x,y)
    particle.velocity = Vector:create(math.random(-50,50)/10,
                                        math.random(-50,50)/10)
    particle.acceleration = Vector:create(0, 0.05)
    particle.decay = math.random(3, 10) * 0.1
    particle.gravity = Vector:create(0, 0.1)
    particle.livetime = 100
    particle.texture = love.graphics.newImage("ball.png")
    return particle
end

function Particle:update()
    self.velocity:add(self.acceleration)
    self.velocity:add(self.gravity)

    self.location:add(self.velocity)
    self.acceleration:mul(0)
    
    self.livetime = self.livetime - self.decay
end

function Particle: draw()
    love.graphics.draw(self.texture, self.location.x, self.location.y, 1, 1)
end

function Particle: isDead()
    return self.livetime < 0
  end