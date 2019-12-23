require("vector")
require("particle")
require("system")
require("rec")

function love.load()
  width = love.graphics.getWidth()
  height = love.graphics.getHeight()
  
  system = System:create(width/2,height/2-100, 4)

  arr_squ = {}
  for i = 1, 20 do
    arr_squ[i] = Square:create(math.random(0,width-100), math.random(0,height-100))
  end
  
end

function love.draw()
  for i = 1, 20 do
    arr_squ[i]:draw()
  end

  system:draw()
end

function love.update(dt)
  system:update()

  for i = 1, 20 do
    arr_squ[i]:update()
  end

end

function love.mousepressed(x, y, button, istouch)
  if button == 1 then
    for i = 1, 20 do
      arr_squ[i]:CheckClick(x, y)
    end
    
    --for i = 1, quantity do
    --  particles[i]:clicked(x, y)
    --end
      -- system:clicked(x, y)
  end
end

