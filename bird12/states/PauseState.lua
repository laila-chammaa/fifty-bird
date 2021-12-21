--[[
    PauseState Class
    
    Author: Laila Chamma'a

    The PauseState pauses the state of the game
]]

PauseState = Class{__includes = BaseState}

function PauseState:init()
    self.pausedGame = 1
end

function PauseState:update(dt)
    if love.keyboard.wasPressed('p') then
        sounds['music']:play()
        gStateMachine:change('play')
        gStateMachine:change('play', {
            play = self.pausedGame
        })
    end
end

--[[
    Called when this state is transitioned to from another state.
]]
function PauseState:enter(params)
    self.pausedGame = params.pausedGame
end

function PauseState:render()
    love.graphics.setFont(flappyFont)
    love.graphics.printf('Paused Fifty Bird', 0, 64, VIRTUAL_WIDTH, 'center')

    love.graphics.setFont(mediumFont)
    love.graphics.printf('Press P to unpause', 0, 100, VIRTUAL_WIDTH, 'center')
end