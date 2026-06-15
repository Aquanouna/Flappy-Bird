ScoreState = Class{__includes = 'BaseState' }

local medals = {
    gold = love.graphics.newImage('gold.png'),
    silver = love.graphics.newImage('silver.png'),
    bronze = love.graphics.newImage('bronze.png')
}

function ScoreState:enter(params)
    self.score = params.score
end

function ScoreState:update(dt)

    if (self.score > Highscore) then 
        Highscore = self.score 
    end

    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then 
        gStateMachine:change('countdown')
    end
end

function ScoreState:render()
    love.graphics.setFont(flappyFont)
    love.graphics.printf('Game Over', 0,64, VIRTUAL_WIDTH, 'center')
    
    love.graphics.setFont( mediumFont)
    love.graphics.printf('Score! : ' .. tostring(self.score), 0, 100, VIRTUAL_WIDTH, 'center')
    
    if self.score >= 30 then 
        love.graphics.draw( medals['gold'], VIRTUAL_WIDTH / 2 + 40, 96)
    elseif self.score >= 20 then 
        love.graphics.draw( medals['silver'], VIRTUAL_WIDTH / 2 + 40, 96)
    elseif self.score >= 10 then 
        love.graphics.draw( medals['bronze'], VIRTUAL_WIDTH / 2 + 40, 96)
    end
    love.graphics.printf('Highest Score: ' .. tostring(Highscore), 0, 120, VIRTUAL_WIDTH, 'center')

    love.graphics.printf('Press enter to play again!', 0, 160, VIRTUAL_WIDTH, 'center')
end