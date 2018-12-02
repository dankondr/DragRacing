
require "gauge1"
require "gauge2"
require "car1"
require "car2"
require "sounds"

logic = { state = "preparing", counter = 150, countPics = {}, gear = {} }
-- states: preparing, playing
logic.countPics.one = love.graphics.newImage("resources/images/count/one.png")
logic.countPics.one:setFilter("nearest", "nearest", 1)
logic.countPics.two = love.graphics.newImage("resources/images/count/two.png")
logic.countPics.two:setFilter("nearest", "nearest", 1)
logic.countPics.three = love.graphics.newImage("resources/images/count/three.png")
logic.countPics.three:setFilter("nearest", "nearest", 1)

-- MARK: - Functions
function logic.countPics.DRAW(num)
  if num == 1 then
    love.graphics.draw(logic.countPics.one, 500, 200)
  elseif num == 2 then
    love.graphics.draw(logic.countPics.two, 500, 200)
  elseif num == 3 then
    love.graphics.draw(logic.countPics.three, 500, 200)
  end
end

-- MARK: - Random green area
function getRandGreenArea()
  love.math.setRandomSeed(love.timer.getTime())
  green = {}
  green.begin = love.math.random(-1, -0.3)
  green.ending = green.begin + 0.5
  red = {}
  red.begin = green.ending
  red.ending = 0.8
  preGreenArea = green.begin - 0.1
end

local function updateColor()
  if gauge1.angle < preGreenArea then
    gauge1.color.r = 255
    gauge1.color.g = 255
    gauge1.color.b = 255
  elseif gauge1.angle < green.begin then
    gauge1.color.r = 255
    gauge1.color.g = 255
    gauge1.color.b = 0
  elseif gauge1.angle < green.ending then
    gauge1.color.r = 0
    gauge1.color.g = 255
    gauge1.color.b = 0
  elseif gauge1.angle < red.ending then
    gauge1.color.r = 255
    gauge1.color.g = 0
    gauge1.color.b = 0
  end

  if gauge2.angle < preGreenArea then
    gauge2.color.r = 255
    gauge2.color.g = 255
    gauge2.color.b = 255
  elseif gauge2.angle < green.begin then
    gauge2.color.r = 255
    gauge2.color.g = 255
    gauge2.color.b = 0
  elseif gauge2.angle < green.ending then
    gauge2.color.r = 0
    gauge2.color.g = 255
    gauge2.color.b = 0
  elseif gauge2.angle < red.ending then
    gauge2.color.r = 255
    gauge2.color.g = 0
    gauge2.color.b = 0
  end
end

local function limit()
  if logic.state == "playing" then
    if gauge1.angle <= -4.1 then
      gauge1.angle = -4.1
    elseif gauge1.angle >= 0.8 then
      gauge1.angle = 0.8
    end

    if gauge2.angle <= -4.1 then
      gauge2.angle = -4.1
    elseif gauge2.angle >= 0.8 then
      gauge2.angle = 0.8
    end
  end
end

function logic.KEYPRESSED(key)
  if key == "lshift" then
    if gauge1.gear < 6 then
      playGearSound()
      if gauge1.angle < preGreenArea then
        gauge1.accel = -0.1
      elseif gauge1.angle < green.begin then
        gauge1.accel = 0.5
      elseif gauge1.angle < green.ending then
        gauge1.accel = 1
      elseif gauge1.angle <= red.ending then
        if gauge1.accel == -0.2 then
          gauge1.accel = -0.4
        else
          gauge1.accel = -0.2
        end
      end
      gauge1.gearChanged = true
      gauge1.gear = gauge1.gear + 1
      playCarSound(gauge1.gear)
      car1.speed = car1.speed + gauge1.accel
      getRandGreenArea()
    end
  elseif key == "rshift" then
    if gauge2.gear < 6 then
      playGearSound()
      if gauge2.angle < preGreenArea then
        gauge2.accel = -0.1
      elseif gauge2.angle < green.begin then
        gauge2.accel = 0.5
      elseif gauge2.angle < green.ending then
        gauge2.accel = 1
      elseif gauge2.angle <= red.ending then
        if gauge2.accel == -0.2 then
          gauge2.accel = -0.4
        else
          gauge2.accel = -0.2
        end
      end
      gauge2.gearChanged = true
      gauge2.gear = gauge2.gear + 1
      playCarSound(gauge2.gear)
      car2.speed = car2.speed + gauge2.accel
      getRandGreenArea()
    end
	end
end

function logic.gear.UPDATE()
  if gauge1.angle <= -3.5 then
    gauge1.gearChanged = false
  elseif gauge1.angle > 0.7 then
    gauge1.accel = -0.2
  end

  if gauge2.angle <= -3.5 then
    gauge2.gearChanged = false
  elseif gauge2.angle > 0.7 then
    gauge2.accel = -0.2
  end

  if gauge1.gearChanged == false then
    if gauge1.gear >= 3 then
      gauge1.angle = gauge1.angle + 0.15 / gauge1.gear
    else
      gauge1.angle = gauge1.angle + 0.1 / gauge1.gear
    end
  else
    gauge1.angle = gauge1.angle - 0.3
  end

  if gauge2.gearChanged == false then
    if gauge2.gear >= 3 then
      gauge2.angle = gauge2.angle + 0.15 / gauge2.gear
    else
      gauge2.angle = gauge2.angle + 0.1 / gauge2.gear
    end
  else
    gauge2.angle = gauge2.angle - 0.3
  end
end

function logic.UPDATE()
  updateColor()
  limit()
end

function logic.RESETALL()
  car1.RESET()
  car2.RESET()
  gauge1.RESET()
  gauge2.RESET()
  logic.state = "preparing"
  logic.counter = 150
end
