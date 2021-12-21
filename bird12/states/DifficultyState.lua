--[[
    Countdown State
    Author: Colton Ogden
    cogden@cs50.harvard.edu

    Counts down visually on the screen (3,2,1) so that the player knows the
    game is about to begin. Transitions to the PlayState as soon as the
    countdown is complete.
]] DifficultyState = Class {
    __includes = BaseState
}

function PauseState:init()
end

--[[
    Keeps track of the diffuclty that the user choosees and transitions to our PlayState.
]]
function DifficultyState:update(dt)
    if love.keyboard.wasPressed('1') then
        gStateMachine:change('play', {
            difficulty = 1
        })
    elseif love.keyboard.wasPressed('2') then
        gStateMachine:change('play', {
            difficulty = 2
        })
    elseif love.keyboard.wasPressed('3') then
        gStateMachine:change('play', {
            difficulty = 3
        })
    end
end

function DifficultyState:render()
    love.graphics.setFont(mediumFont)
    love.graphics.printf("Pick your difficulty", 0, 120, VIRTUAL_WIDTH, 'center')
    love.graphics.printf("1 (easy) 2 (medium) 3 (hard)", 0, 180, VIRTUAL_WIDTH, 'center')
end
