
require "states"

mainMenuButtons = { chosen = 1 }

mainMenuButtons.play = { number = 1, x = 50, y = 300 }
mainMenuButtons.play.normal = love.graphics.newImage("resources/images/mainMenuButtons/play/normal.png")
mainMenuButtons.play.normal:setFilter("nearest", "nearest", 1)
mainMenuButtons.play.chosen = love.graphics.newImage("resources/images/mainMenuButtons/play/chosen.png")
mainMenuButtons.play.chosen:setFilter("nearest", "nearest", 1)

mainMenuButtons.settings = { number = 2, x = 50, y = 360 }
mainMenuButtons.settings.normal = love.graphics.newImage("resources/images/mainMenuButtons/settings/normal.png")
mainMenuButtons.settings.normal:setFilter("nearest", "nearest", 1)
mainMenuButtons.settings.chosen = love.graphics.newImage("resources/images/mainMenuButtons/settings/chosen.png")
mainMenuButtons.settings.chosen:setFilter("nearest", "nearest", 1)

mainMenuButtons.quit = { number = 3, x = 50, y = 420 }
mainMenuButtons.quit.normal = love.graphics.newImage("resources/images/mainMenuButtons/quit/normal.png")
mainMenuButtons.quit.normal:setFilter("nearest", "nearest", 1)
mainMenuButtons.quit.chosen = love.graphics.newImage("resources/images/mainMenuButtons/quit/chosen.png")
mainMenuButtons.quit.chosen:setFilter("nearest", "nearest", 1)

function mainMenuButtons.DRAW()
  love.graphics.setColor(255, 255, 255)
  if mainMenuButtons.chosen == 1 then
    love.graphics.draw(mainMenuButtons.play.chosen, mainMenuButtons.play.x, mainMenuButtons.play.y)
    love.graphics.draw(mainMenuButtons.settings.normal, mainMenuButtons.settings.x, mainMenuButtons.settings.y)
    love.graphics.draw(mainMenuButtons.quit.normal, mainMenuButtons.quit.x, mainMenuButtons.quit.y)
  elseif mainMenuButtons.chosen == 2 then
    love.graphics.draw(mainMenuButtons.play.normal, mainMenuButtons.play.x, mainMenuButtons.play.y)
    love.graphics.draw(mainMenuButtons.settings.chosen, mainMenuButtons.settings.x, mainMenuButtons.settings.y)
    love.graphics.draw(mainMenuButtons.quit.normal, mainMenuButtons.quit.x, mainMenuButtons.quit.y)
  elseif mainMenuButtons.chosen == 3 then
    love.graphics.draw(mainMenuButtons.play.normal, mainMenuButtons.play.x, mainMenuButtons.play.y)
    love.graphics.draw(mainMenuButtons.settings.normal, mainMenuButtons.settings.x, mainMenuButtons.settings.y)
    love.graphics.draw(mainMenuButtons.quit.chosen, mainMenuButtons.quit.x, mainMenuButtons.quit.y)
  end
end

function mainMenuButtons.KEYPRESSED(key)
  if key == "return" or key == "space" then
    if mainMenuButtons.chosen == 1 then
      state = "playing"
      playIdleSound()
    elseif mainMenuButtons.chosen == 2 then
      state = "settings"
    elseif mainMenuButtons.chosen == 3 then
      love.event.quit()
    end
  elseif key == "up" or key == "w" then
    if mainMenuButtons.chosen == 1 then
      mainMenuButtons.chosen = 3
    elseif mainMenuButtons.chosen == 2 then
      mainMenuButtons.chosen = 1
    elseif mainMenuButtons.chosen == 3 then
      mainMenuButtons.chosen = 2
    end
  elseif key == "down" or key == "s" then
    if mainMenuButtons.chosen == 1 then
      mainMenuButtons.chosen = 2
    elseif mainMenuButtons.chosen == 2 then
      mainMenuButtons.chosen = 3
    elseif mainMenuButtons.chosen == 3 then
      mainMenuButtons.chosen = 1
    end
  end
end
