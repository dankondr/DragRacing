
gauge1 =
{
  x = 192,
  y = 565,
  w = 80,
  h = 6,
  angle = -4.1, -- from -4.1 to 0.8
  color = {
    r = 255,
    g = 255,
    b = 255
  },
  accel = 0.01,
  gear = 1,
  gearChanged = false
}

gauge1.image = love.graphics.newImage("resources/images/arrow.png")
gauge1.image:setFilter("nearest", "nearest", 1)

-- MARK: - Functions
local function drawController()
	love.graphics.setColor(gauge1.color.r, gauge1.color.g, gauge1.color.b)
	love.graphics.draw(gauge1.image, gauge1.x, gauge1.y, gauge1.angle, 1.1)
end


--[[
	MAIN FUNCTIONS
	**************
]]


function gauge1.DRAW()
	drawController()
end

function gauge1.RESET()
  gauge1.x = 192
  gauge1.y = 565
  gauge1.angle = -4.1
  gauge1.color.r = 255
  gauge1.color.g = 255
  gauge1.color.b = 255
  gauge1.accel = 0.01
  gauge1.gear = 1
  gauge1.gearChanged = false
end
