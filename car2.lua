
car2 =
{
  x = 10,
  y = 370,
  speed = 0.01,
  w = 889, -- 177.8
  h = 255, -- 51
}

-- MARK: - Animation
car2.animationImages =
{
	"resources/images/car_alpha/1.png",
  "resources/images/car_alpha/2.png",
  "resources/images/car_alpha/3.png",
  "resources/images/car_alpha/4.png",
  "resources/images/car_alpha/5.png",
  "resources/images/car_alpha/6.png",
  "resources/images/car_alpha/7.png",
  "resources/images/car_alpha/8.png",
  "resources/images/car_alpha/9.png",
  "resources/images/car_alpha/10.png",
  "resources/images/car_alpha/11.png",
  "resources/images/car_alpha/11.png",
  "resources/images/car_alpha/12.png",
  "resources/images/car_alpha/13.png",
  "resources/images/car_alpha/14.png",
  "resources/images/car_alpha/15.png",
  "resources/images/car_alpha/16.png",
  "resources/images/car_alpha/17.png",
  "resources/images/car_alpha/18.png",
  "resources/images/car_alpha/19.png",
  "resources/images/car_alpha/20.png",
  "resources/images/car_alpha/21.png"
}

car2.animtimer = 0
car2.pnum = 1
car2.image = love.graphics.newImage(car2.animationImages[1])
car2.image:setFilter("nearest", "nearest", 1)

local function animation(image, frameconst, dt)
	car2.image = love.graphics.newImage(image[car2.pnum])
	car2.image:setFilter("nearest", "nearest", 1)
	car2.animtimer = car2.animtimer + dt
	if car2.animtimer > frameconst then
		car2.pnum = car2.pnum + 1
		car2.animtimer = 0
	end
	if car2.pnum > #image then
		car2.pnum = 1
	end
end

-- MARK: - Functions
local function drawCar()
	love.graphics.setColor(255,255,255)
	love.graphics.draw(car2.image, car2.x, car2.y, 0, 0.2)
end

local function movement(dt)
  animation(car2.animationImages, (1 - car2.speed) / 5, dt)
end

--[[
	MAIN FUNCTIONS
	**************
]]

function car2.UPDATE(dt)
	movement(dt)
end

function car2.DRAW()
	drawCar()
end

function car2.RESET()
  car2.x = 10
  car2.y = 370
  car2.speed = 0.01
end
