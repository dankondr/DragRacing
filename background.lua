
background =
{
  speed = 0, -- maximum speed is 1
  x = 0,
  y = -100,
  w = 1080,
  h = 450
}

-- Animation
background.animationImages =
{
	"resources/images/city/01.png",
  "resources/images/city/02.png",
  "resources/images/city/03.png",
  "resources/images/city/04.png",
  "resources/images/city/05.png",
  "resources/images/city/06.png",
  "resources/images/city/07.png",
  "resources/images/city/08.png",
  "resources/images/city/09.png",
  "resources/images/city/10.png",
  "resources/images/city/11.png",
  "resources/images/city/12.png",
  "resources/images/city/13.png",
  "resources/images/city/14.png",
  "resources/images/city/15.png",
  "resources/images/city/16.png",
  "resources/images/city/17.png",
  "resources/images/city/18.png",
  "resources/images/city/19.png",
  "resources/images/city/20.png",
  "resources/images/city/21.png",
  "resources/images/city/22.png",
  "resources/images/city/23.png",
  "resources/images/city/24.png",
  "resources/images/city/25.png",
  "resources/images/city/26.png",
  "resources/images/city/27.png",
  "resources/images/city/28.png",
  "resources/images/city/29.png",
  "resources/images/city/30.png",
  "resources/images/city/31.png",
  "resources/images/city/32.png",
  "resources/images/city/33.png",
  "resources/images/city/34.png",
  "resources/images/city/35.png",
  "resources/images/city/36.png",
  "resources/images/city/37.png",
  "resources/images/city/38.png",
  "resources/images/city/39.png",
  "resources/images/city/40.png",
  "resources/images/city/41.png",
  "resources/images/city/42.png",
  "resources/images/city/43.png",
  "resources/images/city/44.png",
  "resources/images/city/45.png",
  "resources/images/city/46.png",
  "resources/images/city/47.png",
  "resources/images/city/48.png",
  "resources/images/city/49.png",
  "resources/images/city/50.png",
  "resources/images/city/51.png",
  "resources/images/city/52.png",
  "resources/images/city/53.png",
  "resources/images/city/54.png",
  "resources/images/city/55.png",
  "resources/images/city/56.png",
  "resources/images/city/57.png",
  "resources/images/city/58.png",
  "resources/images/city/59.png",
  "resources/images/city/60.png"
}

background.animtimer = 0
background.pnum = 1
background.image = love.graphics.newImage(background.animationImages[1])
background.image:setFilter("nearest", "nearest", 1)

local function animation(image, frameconst, dt)
	background.image = love.graphics.newImage(image[background.pnum])
	background.image:setFilter("nearest", "nearest", 1)
	background.animtimer = background.animtimer + dt
	if background.animtimer > frameconst then
		background.pnum = background.pnum + 1
		background.animtimer = 0
	end
	if background.pnum > #image then
		background.pnum = 1
	end
end

-- Functions
local function drawBackground()
	love.graphics.setColor(255,255,255)
	love.graphics.draw(background.image, background.x, background.y)
end

local function movement(dt)
  animation(background.animationImages, 1 - background.speed, dt)
end

--[[
	MAIN FUNCTIONS
	**************
]]

function background.UPDATE(dt)
	movement(dt)
end

function background.DRAW()
	drawBackground()
end

-- function player.KEYPRESSED(key)
-- 	if key == "escape" then
-- 		love.event.quit()
-- 	end
-- end
