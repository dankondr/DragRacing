
gauge2 =
{
  x = 880,
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

gauge2.image = love.graphics.newImage("resources/images/arrow.png")
gauge2.image:setFilter("nearest", "nearest", 1)

-- MARK: - Functions
local function drawController()
	love.graphics.setColor(gauge2.color.r, gauge2.color.g, gauge2.color.b)
	love.graphics.draw(gauge2.image, gauge2.x, gauge2.y, gauge2.angle, 1.1)
end


--[[
	MAIN FUNCTIONS
	**************
]]


function gauge2.DRAW()
	drawController()
end

function gauge2.RESET()
  gauge2.x = 880
  gauge2.y = 565
  gauge2.angle = -4.1
  gauge2.color.r = 255
  gauge2.color.g = 255
  gauge2.color.b = 255
  gauge2.accel = 0.01
  gauge2.gear = 1
  gauge2.gearChanged = false
end
