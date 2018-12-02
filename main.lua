
require "car1"
require "car2"
require "background"
require "road"
require "gauge1"
require "gauge2"
require "logic"
require "menus"
require "mainMenuButtons"
require "states"
require "settings"
require "sounds"


-- MARK: - Variables
font = love.graphics.newFont("resources/fonts/HelveticaNeueMedium.ttf", 30)

-- MARK: - Functions

local function drawTachometers()
  love.graphics.setColor(255,255,255)
	love.graphics.draw(tachometers, 0, 420)
end

local function drawCircles()
  love.graphics.setFont(font)
  love.graphics.setColor(255,255,255)
  love.graphics.draw(circle, 137, 518)
  love.graphics.print(gauge1.gear, 182, 550)
  love.graphics.draw(circle, 826, 519)
  love.graphics.print(gauge2.gear, 871, 553)
end


--[[
	MAIN FUNCTIONS
	**************
]]
function love.load()
  soundtrack = love.audio.newSource(settings.music.getPath(), "stream")
  soundtrack:setVolume(settings.volume.music)
  soundtrack:play()
  car = love.audio.newSource("resources/sounds/car.mp3", "static")
  winner = 0
  finish = 1000
  tachometers = love.graphics.newImage("resources/images/tachometers.png")
  tachometers:setFilter("nearest", "nearest", 1)
  circle = love.graphics.newImage("resources/images/circle.png")
  circle:setFilter("nearest", "nearest", 1)
  getRandGreenArea()
end

function love.draw()
  if state == "mainMenu" then
    menus.DRAW("menu")
    mainMenuButtons.DRAW()
  elseif state == "playing" then
    road.DRAW()
    background.DRAW()
    love.graphics.setNewFont(13)
    love.graphics.print("made by dankondr", 945, 326)
    drawTachometers()
    gauge1.DRAW()
    gauge2.DRAW()
    drawCircles()
    car1.DRAW()
    car2.DRAW()
    if logic.state == "preparing" then
      if logic.counter > 100 then
        logic.countPics.DRAW(3)
      elseif logic.counter > 50 then
        logic.countPics.DRAW(2)
      elseif logic.counter > 0 then
        logic.countPics.DRAW(1)
      else
        logic.state = "playing"
        idle:stop()
        playCarSound(1)
      end
    end
  elseif state == "pauseMenu" then
    menus.DRAW("pause")
  -- MARK: - Game ended
  elseif state == "gameEnded" then
    if winner == 1 then
      menus.DRAW("first")
    elseif winner == 2 then
      menus.DRAW("second")
    else
      menus.DRAW("draw")
    end
  elseif state == "settings" then
    menus.DRAW("settings")
    settings.DRAW()
  end
end

function love.update(dt)
  if state == "playing" then
    if logic.state == "preparing" then
      logic.counter = logic.counter - 1
    else
      background.UPDATE(dt)
      car1.UPDATE(dt)
      car2.UPDATE(dt)
      road.UPDATE(dt)

      -- MARK: - Race logic
      background.speed = 0.95
      road.speed = 0.95

      car1.x = car1.x + car1.speed
      car2.x = car2.x + car2.speed

      logic.UPDATE()
      logic.gear.UPDATE()
      sounds.UPDATE()

      -- MARK: - Checking for winner
      if car1.x >= finish and car2.x >= finish then
        winner = 3
        state = "gameEnded"
        stopAllSounds()
      elseif car1.x >= finish and car2.x < finish then
        winner = 1
        state = "gameEnded"
        stopAllSounds()
      elseif car1.x < finish and car2.x >= finish then
        winner = 2
        state = "gameEnded"
        stopAllSounds()
      end
    end
  end
end

function love.keypressed(key)
  if state == "playing" then

    if logic.state == "playing" then
      if key == "escape" then
        pauseAllSounds()
        state = "pauseMenu"
      else
        logic.KEYPRESSED(key)
      end
    else
      if key == "escape" then
        state = "pauseMenu"
      end
    end

  elseif state == "mainMenu" then

    mainMenuButtons.KEYPRESSED(key)

  elseif state == "pauseMenu" then

    if key == "q" then
      logic.RESETALL()
      stopAllSounds()
      state = "mainMenu"
    elseif key == "escape" then
      state = "playing"
    end

  elseif state == "gameEnded" then

    if key == "escape" then
      logic.RESETALL()
      state = "mainMenu"
    end
  elseif state == "settings" then

    settings.KEYPRESSED(key)

  end
end
