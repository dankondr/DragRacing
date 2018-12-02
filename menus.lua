
menus = {}

menus.mainMenu = love.graphics.newImage("resources/images/mainMenu.png")
menus.mainMenu:setFilter("nearest", "nearest", 1)

menus.gamePaused = love.graphics.newImage("resources/images/gamePaused.png")
menus.gamePaused:setFilter("nearest", "nearest", 1)

menus.firstPlayerWon = love.graphics.newImage("resources/images/endScreen/firstPlayerWon.png")
menus.firstPlayerWon:setFilter("nearest", "nearest", 1)

menus.draw = love.graphics.newImage("resources/images/endScreen/draw.png")
menus.draw:setFilter("nearest", "nearest", 1)

menus.secondPlayerWon = love.graphics.newImage("resources/images/endScreen/secondPlayerWon.png")
menus.secondPlayerWon:setFilter("nearest", "nearest", 1)

menus.settings = love.graphics.newImage("resources/images/settings.png")
menus.settings:setFilter("nearest", "nearest", 1)

function menus.DRAW(name)
	love.graphics.setColor(255,255,255)
	if name == "first" then
    love.graphics.draw(menus.firstPlayerWon)
  elseif name == "second" then
    love.graphics.draw(menus.secondPlayerWon)
  elseif name == "draw" then
    love.graphics.draw(menus.draw)
  elseif name == "pause" then
    love.graphics.draw(menus.gamePaused)
  elseif name == "menu" then
    love.graphics.draw(menus.mainMenu)
  elseif name == "settings" then
    love.graphics.draw(menus.settings)
  end
end
