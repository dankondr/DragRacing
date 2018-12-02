
car1 =
{
  x = 10,
  y = 320,
  speed = 0.01,
  w = 889, -- 177.8
  h = 255, -- 51
}

-- MARK: - Animation
car1.animationImages =
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

car1.animtimer = 0
car1.pnum = 1
car1.image = love.graphics.newImage(car1.animationImages[1])
car1.image:setFilter("nearest", "nearest", 1)

local function animation(image, frameconst, dt)
	car1.image = love.graphics.newImage(image[car1.pnum])
	car1.image:setFilter("nearest", "nearest", 1)
	car1.animtimer = car1.animtimer + dt
	if car1.animtimer > frameconst then
		car1.pnum = car1.pnum + 1
		car1.animtimer = 0
	end
	if car1.pnum > #image then
		car1.pnum = 1
	end
end

-- MARK: - Functions
local function drawCar()
	love.graphics.setColor(255,255,255)
	love.graphics.draw(car1.image, car1.x, car1.y, 0, 0.2)
end

local function movement(dt)
  animation(car1.animationImages, (1 - car1.speed) / 5, dt)
end

--[[
	MAIN FUNCTIONS
	**************
]]

function car1.UPDATE(dt)
	movement(dt)
end

function car1.DRAW()
	drawCar()
end

function car1.RESET()
  car1.x = 10
  car1.y = 320
  car1.speed = 0.01
end
