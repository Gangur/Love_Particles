require("vector")
require("particle")
require("system")

function love.load()
  width = love.graphics.getWidth()
  height = love.graphics.getHeight()
  
  system = System:create(width/2,height/2-100, 50)
end

function love.draw()
  system:draw()
end

function love.update(dt)
  system:update()
end

function love.keypressed(key) 
end
