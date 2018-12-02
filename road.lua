
road =
{
  speed = 0, -- maximum speed is 1
  x = 0,
  y = 350,
  w = 1080,
  h = 70
}

-- Animation
road.animationImages =
{
	"resources/images/road/1.png",
  "resources/images/road/2.png",
  "resources/images/road/3.png",
  "resources/images/road/4.png",
  "resources/images/road/5.png",
  "resources/images/road/6.png"
}

road.animtimer = 0
road.pnum = 1
road.image = love.graphics.newImage(road.animationImages[1])
road.image:setFilter("nearest", "nearest", 1)

local function animation(image, frameconst, dt)
	road.image = love.graphics.newImage(image[road.pnum])
	road.image:setFilter("nearest", "nearest", 1)
	road.animtimer = road.animtimer + dt
	if road.animtimer > frameconst then
		road.pnum = road.pnum + 1
		road.animtimer = 0
	end
	if road.pnum > #image then
		road.pnum = 1
	end
end

-- Functions
local function drawRoad()
	love.graphics.setColor(255,255,255)
	love.graphics.draw(road.image, road.x, road.y)
end

local function movement(dt)
  animation(road.animationImages, 1 - road.speed, dt)
end

--[[
	MAIN FUNCTIONS
	**************
]]

function road.UPDATE(dt)
	movement(dt)
end

function road.DRAW()
	drawRoad()
end
