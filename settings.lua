
settings = { chosen = 1, editing = false, buttons = {} }

settings.buttons.musicVolume = { number = 1, x = 75, y = 300 }
settings.buttons.musicVolume.normal = love.graphics.newImage("resources/images/settings/musicVolume/normal.png")
settings.buttons.musicVolume.normal:setFilter("nearest", "nearest", 1)
settings.buttons.musicVolume.chosen = love.graphics.newImage("resources/images/settings/musicVolume/chosen.png")
settings.buttons.musicVolume.chosen:setFilter("nearest", "nearest", 1)

settings.buttons.soundsVolume = { number = 2, x = 75, y = 360 }
settings.buttons.soundsVolume.normal = love.graphics.newImage("resources/images/settings/soundsVolume/normal.png")
settings.buttons.soundsVolume.normal:setFilter("nearest", "nearest", 1)
settings.buttons.soundsVolume.chosen = love.graphics.newImage("resources/images/settings/soundsVolume/chosen.png")
settings.buttons.soundsVolume.chosen:setFilter("nearest", "nearest", 1)

settings.buttons.track = { number = 3, x = 75, y = 420 }
settings.buttons.track.normal = love.graphics.newImage("resources/images/settings/track/normal.png")
settings.buttons.track.normal:setFilter("nearest", "nearest", 1)
settings.buttons.track.chosen = love.graphics.newImage("resources/images/settings/track/chosen.png")
settings.buttons.track.chosen:setFilter("nearest", "nearest", 1)

settings.music = {
  track,
  tracks = {
    getLucky = {
      path = "resources/sounds/getLucky.mp3",
      name = "Get Lucky"
    },
    theRace = {
      path = "resources/sounds/theRace.mp3",
      name = "The Race"
    },
    highwayToHell = {
      path = "resources/sounds/highwayToHell.mp3",
      name = "Highway To Hell"
    }
  }
}

local names = { settings.music.tracks.getLucky.name, settings.music.tracks.theRace.name,
                settings.music.tracks.highwayToHell.name }

settings.volume = {
  music,
  sounds,
}

lines = {}
for line in io.lines("settings.txt") do
  lines[#lines + 1] = line
end

local function toNumber(line)
  local num = ""
  for i = 1, #line do
    local c = line:sub(i,i)
    if c == " " then
      return tonumber(num)
    else
      num = num .. c
    end
  end
end

settings.volume.music = toNumber(lines[1])
settings.volume.sounds = toNumber(lines[2])
settings.music.track = toNumber(lines[3])

function settings.music.getPath()
  if settings.music.track == 1 then
    return settings.music.tracks.getLucky.path
  elseif settings.music.track == 2 then
    return settings.music.tracks.theRace.path
  elseif settings.music.track == 3 then
    return settings.music.tracks.highwayToHell.path
  end
end

function settings.UPDATE()
  set = io.open("settings.txt", "w")
  setMusic = settings.volume.music .. " - music volume\n"
  set:write(setMusic)
  setSounds = settings.volume.sounds .. " - sounds volume\n"
  set:write(setSounds)
  setTrack = settings.music.track .. " - track number"
  set:write(setTrack)
  set:close()
end

local font = love.graphics.newFont("resources/fonts/HelveticaNeueMedium.ttf", 40)
love.graphics.setFont(font)

local x = 15

function settings.DRAW()
  love.graphics.setColor(255, 255, 255)
  if settings.chosen == 1 then
    love.graphics.draw(settings.buttons.musicVolume.chosen, settings.buttons.musicVolume.x, settings.buttons.musicVolume.y)
    love.graphics.print(settings.volume.music,
                        settings.buttons.musicVolume.x + settings.buttons.musicVolume.normal:getWidth() + x,
                        settings.buttons.musicVolume.y)
    love.graphics.draw(settings.buttons.soundsVolume.normal, settings.buttons.soundsVolume.x, settings.buttons.soundsVolume.y)
    love.graphics.print(settings.volume.sounds,
                        settings.buttons.soundsVolume.x + settings.buttons.soundsVolume.normal:getWidth() + x,
                        settings.buttons.soundsVolume.y)
    love.graphics.draw(settings.buttons.track.normal, settings.buttons.track.x, settings.buttons.track.y)
    love.graphics.print(names[settings.music.track],
                        settings.buttons.track.x + settings.buttons.track.normal:getWidth() + x,
                        settings.buttons.track.y)
  elseif settings.chosen == 2 then
    love.graphics.draw(settings.buttons.musicVolume.normal, settings.buttons.musicVolume.x, settings.buttons.musicVolume.y)
    love.graphics.print(settings.volume.music,
                        settings.buttons.musicVolume.x + settings.buttons.musicVolume.normal:getWidth() + x,
                        settings.buttons.musicVolume.y)
    love.graphics.draw(settings.buttons.soundsVolume.chosen, settings.buttons.soundsVolume.x, settings.buttons.soundsVolume.y)
    love.graphics.print(settings.volume.sounds,
                        settings.buttons.soundsVolume.x + settings.buttons.soundsVolume.normal:getWidth() + x,
                        settings.buttons.soundsVolume.y)
    love.graphics.draw(settings.buttons.track.normal, settings.buttons.track.x, settings.buttons.track.y)
    love.graphics.print(names[settings.music.track],
                        settings.buttons.track.x + settings.buttons.track.normal:getWidth() + x,
                        settings.buttons.track.y)
  elseif settings.chosen == 3 then
    love.graphics.draw(settings.buttons.musicVolume.normal, settings.buttons.musicVolume.x, settings.buttons.musicVolume.y)
    love.graphics.print(settings.volume.music,
                        settings.buttons.musicVolume.x + settings.buttons.musicVolume.normal:getWidth() + x,
                        settings.buttons.musicVolume.y)
    love.graphics.draw(settings.buttons.soundsVolume.normal, settings.buttons.soundsVolume.x, settings.buttons.soundsVolume.y)
    love.graphics.print(settings.volume.sounds,
                        settings.buttons.soundsVolume.x + settings.buttons.soundsVolume.normal:getWidth() + x,
                        settings.buttons.soundsVolume.y)
    love.graphics.draw(settings.buttons.track.chosen, settings.buttons.track.x, settings.buttons.track.y)
    love.graphics.print(names[settings.music.track],
                        settings.buttons.track.x + settings.buttons.track.normal:getWidth() + x,
                        settings.buttons.track.y)
  end
end

function playMusic()
  love.audio.stop()
  soundtrack = love.audio.newSource(settings.music.getPath(), "stream")
  soundtrack:setVolume(settings.volume.music)
  soundtrack:play()
end


function settings.KEYPRESSED(key)
  if key == "return" or key == "space" then
    if settings.editing then
      settings.editing = false
      settings.UPDATE()
    else
      settings.editing = true
    end
  elseif key == "escape" then
    if settings.editing then
      settings.editing = false
      settings.UPDATE()
    else
      state = "mainMenu"
    end
  elseif key == "up" or key == "w" then
    if not settings.editing then
      if settings.chosen == 1 then
        settings.chosen = 3
      elseif settings.chosen == 2 then
        settings.chosen = 1
      elseif settings.chosen == 3 then
        settings.chosen = 2
      end
    else
      if settings.chosen == 1 then
        settings.volume.music = settings.volume.music + 0.1
        soundtrack:setVolume(settings.volume.music)
      elseif settings.chosen == 2 then
        settings.volume.sounds = settings.volume.sounds + 0.1
        soundtrack:setVolume(settings.volume.music)
      elseif settings.chosen == 3 then
        if settings.music.track == 1 then
          settings.music.track = 2
          playMusic()
        elseif settings.music.track == 2 then
          settings.music.track = 3
          playMusic()
        elseif settings.music.track == 3 then
          settings.music.track = 1
          playMusic()
        end
      end
    end
  elseif key == "down" or key == "s" then
    if not settings.editing then
      if settings.chosen == 1 then
        settings.chosen = 2
      elseif settings.chosen == 2 then
        settings.chosen = 3
      elseif settings.chosen == 3 then
        settings.chosen = 1
      end
    else
      if settings.chosen == 1 then
        settings.volume.music = settings.volume.music - 0.1
        soundtrack:setVolume(settings.volume.music)
      elseif settings.chosen == 2 then
        settings.volume.sounds = settings.volume.sounds - 0.1
        soundtrack:setVolume(settings.volume.music)
      elseif settings.chosen == 3 then
        if settings.music.track == 1 then
          settings.music.track = 3
          playMusic()
        elseif settings.music.track == 2 then
          settings.music.track = 1
          playMusic()
        elseif settings.music.track == 3 then
          settings.music.track = 2
          playMusic()
        end
      end
    end
  end
end
