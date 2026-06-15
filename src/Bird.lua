Bird= Class{}

local GRAVITY = 17

function Bird:init()
    self.image = love.graphics.newImage('bird.png')
    self.width = self.image:getWidth()
    self.height = self.image:getHeight()

    self.x = VIRTUAL_WIDTH/2 - self.width/2
    self.y = VIRTUAL_HEIGHT/2 - self.height/2

    self.dy = 0
end

function Bird:render()
    love.graphics.draw(self.image,self.x,self.y)
end

function Bird:collides(pipe)
    if (self.x + 2) <= pipe.x + PIPE_WIDTH and (self.x + 2) + (self.width - 4) >= pipe.x and self.y + 2 <= pipe.y + PIPE_HEIGHT  and (self.y + 2) + (self.height - 4) >= pipe.y  then
        return true
    else
        return false
    end
end

function Bird:update(dt)
    self.dy = self.dy + GRAVITY * dt

    if love.keyboard.wasPressed('space') or love.mouse.wasPressed(1) then 
        sounds['jump']:play()
        self.dy= -3
    end
    
    self.y= self.y + self.dy 
end
