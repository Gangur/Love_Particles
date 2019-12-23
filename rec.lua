Square = {}
Square.__index = Square

function Square: create(x, y)
    local square  = {}
    setmetatable(square, Square)
    square.x = x
    square.y = y

    square.system = System:create(x,y, 4)

    square.flag = false

    return square
end

function Square:update()

    if self.flag then
        self.system:update()
    end

end

function Square:draw()
    love.graphics.rectangle("line", self.x, self.y, 100, 100)
    if self.flag then
        self.system:draw()
    end
end

function Square:CheckClick(x, y)
    if (self.x <= x) and (self.x + 100 >= x ) then
        if (self.y <= y) and (self.y + 100 >= y ) then
            self.x = width + 200
            self.y = height + 200

            self.flag = true
            

        end
    end

    

end