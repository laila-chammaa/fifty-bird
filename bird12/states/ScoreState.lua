--[[
    ScoreState Class
    Author: Colton Ogden
    cogden@cs50.harvard.edu

    A simple state used to display the player's score before they
    transition back into the play state. Transitioned to from the
    PlayState when they collide with a Pipe.
]] ScoreState = Class {
    __includes = BaseState
}

--[[
    When we enter the score state, we expect to receive the score
    from the play state so we know what to render to the State.
]]
function ScoreState:enter(params)
    self.score = params.score
end

function ScoreState:update(dt)
    -- go back to play if enter is pressed
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gStateMachine:change('countdown')
    end
end

function ScoreState:render()
    -- simply render the score to the middle of the screen
    love.graphics.setFont(flappyFont)
    love.graphics.printf('Oof! You lost!', 0, 64, VIRTUAL_WIDTH, 'center')

    love.graphics.setFont(mediumFont)
    love.graphics.printf('Score: ' .. tostring(self.score), 0, 100, VIRTUAL_WIDTH, 'center')

    -- adding medals
    love.graphics.push()
    love.graphics.scale(0.1, 0.1)
    if self.score > 1 and self.score < 5 then
        love.graphics.draw(medal3, VIRTUAL_WIDTH / 0.2, VIRTUAL_HEIGHT / 0.15)
    elseif self.score > 5 and self.score < 10 then
        love.graphics.draw(medal2, VIRTUAL_WIDTH / 0.2, VIRTUAL_HEIGHT / 0.15)
    elseif self.score > 10 then
        love.graphics.draw(medal1, VIRTUAL_WIDTH / 0.2, VIRTUAL_HEIGHT / 0.15)
    end
    love.graphics.pop()

    love.graphics.printf('Press Enter to Play Again!', 0, 160, VIRTUAL_WIDTH, 'center')
end
