PipePair = Class {}

local gap_height = 90

function PipePair: init(y)
    self.x = VIRTUAL_WIDTH +32
    self.y = y 

    self.pipes = {
        ['upper'] = Pipe('top', self.y),
        ['lower'] = Pipe('bottom', self.y + PIPE_HEIGHT + gap_height)
    }
    self.scored = false
    self.remove = false
end

function PipePair:update(dt)
    gap_height = math.random(90,110)

    if self.x > -PIPE_WIDTH then 
        self.x = self.x  - PIPE_SPEED * dt
        self.pipes['lower'].x = self.x
        self.pipes['upper'].x = self.x
    else
        self.remove = true
    end
end

function PipePair:render()
    for k, pipe in pairs(self.pipes) do 
        pipe:render()
    end
end
