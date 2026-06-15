PausedState = Class{__includes = BaseState}

function PausedState:enter(params)
    self.bird = params.bird
    self.pipePairs = params.pipePairs
    self.timer = params.timer
    self.lastY = params.lastY
    self.score = params.score
end

function PausedState:update(dt)
    PAUSE = true
    if love.keyboard.wasPressed('p') then
        PAUSE = false
        gStateMachine:change('play', {bird = self.bird, pipePairs = self.pipePairs, score = self.score, timer = self.timer, lastY = self.lastY})
    end
end

function PausedState:render()
    self.bird:render()
    
    for k,pair in pairs(self.pipePairs) do
        pair:render()
    end

    love.graphics.setFont(flappyFont)
    love.graphics.printf('Game Paused!', 0, 64, VIRTUAL_WIDTH, 'center')
    love.graphics.print('Score: ' .. tostring(self.score), 8, 8)
end