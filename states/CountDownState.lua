CountDownState = Class{__includes = BaseState}

COUNTDOWN_TIME = 0.75

function CountDownState:init()
    self.count = 3
    self.timer = 0
end

function CountDownState:update(dt)
    self.timer = self.timer + dt

    if self.count == 3 and self.timer <= dt then 
        sounds['countdown']:play()
    end

    if self.count == 0 then 
        sounds['start']:play()
        gStateMachine:change('play', {})
    end

    if self.timer > COUNTDOWN_TIME then 
        if self.count > 1 then
            sounds['countdown']:play()
        end
        self.count = self.count - 1
        self.timer = self.timer % COUNTDOWN_TIME
    end
end

function CountDownState:render()
    love.graphics.setFont(hugeFont)
    love.graphics.printf(tostring(self.count), 0, 120, VIRTUAL_WIDTH, 'center')
end