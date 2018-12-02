
sounds = {}

gear1 = love.audio.newSource("resources/sounds/gear/gear1.mp3", "static")

gear2 = love.audio.newSource("resources/sounds/gear/gear2.mp3", "static")

gear3 = love.audio.newSource("resources/sounds/gear/gear3.mp3", "static")

gear4 = love.audio.newSource("resources/sounds/gear/gear4.mp3", "static")

gear5 = love.audio.newSource("resources/sounds/gear/gear5.mp3", "static")

jam1 = love.audio.newSource("resources/sounds/jam/jam1.mp3", "static")
jam1:setLooping(true)
jam2 = love.audio.newSource("resources/sounds/jam/jam2.mp3", "static")
jam2:setLooping(true)
jam3 = love.audio.newSource("resources/sounds/jam/jam3.mp3", "static")
jam3:setLooping(true)
jam4 = love.audio.newSource("resources/sounds/jam/jam4.mp3", "static")
jam4:setLooping(true)
jam5 = love.audio.newSource("resources/sounds/jam/jam5.mp3", "static")
jam5:setLooping(true)

gear = love.audio.newSource("resources/sounds/gearUp.mp3", "static")

idle = love.audio.newSource("resources/sounds/carIdle.mp3", "static")

function playCarSound(num)
  if num == 1 then
    gear1:setVolume(settings.volume.sounds)
    gear1:play()
  elseif num == 2 then
    gear2:setVolume(settings.volume.sounds)
    if jam1:isPlaying() then
      jam1:stop()
    else
      gear1:stop()
    end
    gear2:play()
  elseif num == 3 then
    gear3:setVolume(settings.volume.sounds)
    if jam2:isPlaying() then
      jam2:stop()
    else
      gear2:stop()
    end
    gear3:play()
  elseif num == 4 then
    gear4:setVolume(settings.volume.sounds)
    if jam3:isPlaying() then
      jam3:stop()
    else
      gear3:stop()
    end
    gear4:play()
  elseif num == 5 then
    gear5:setVolume(settings.volume.sounds)
    if jam4:isPlaying() then
      jam4:stop()
    else
      gear4:stop()
    end
    gear5:play()
  elseif num == 6 then
    gear5:setVolume(settings.volume.sounds)
    if jam5:isPlaying() then
      jam5:stop()
    else
      gear5:stop()
    end
    gear5:play()
  end
end

function playJamSound(num)
  if num == 1 then
    jam1:setVolume(settings.volume.sounds)
    jam1:play()
  elseif num == 2 then
    jam2:setVolume(settings.volume.sounds)
    if jam1:isPlaying() then
      jam1:stop()
    else
      gear1:stop()
    end
    jam2:play()
  elseif num == 3 then
    jam3:setVolume(settings.volume.sounds)
    if jam2:isPlaying() then
      jam2:stop()
    else
      gear2:stop()
    end
    jam3:play()
  elseif num == 4 then
    jam4:setVolume(settings.volume.sounds)
    if jam3:isPlaying() then
      jam3:stop()
    else
      gear3:stop()
    end
    jam4:play()
  elseif num == 5 then
    jam5:setVolume(settings.volume.sounds - 0.05)
    if jam4:isPlaying() then
      jam4:stop()
    else
      gear4:stop()
    end
    jam5:play()
  elseif num == 6 then
    jam5:setVolume(settings.volume.sounds - 0.05)
    if not jam5:isPlaying() then
      gear5:stop()
      jam5:play()
    end
  end
end

function stopAllSounds()
  gear1:stop()
  gear2:stop()
  gear3:stop()
  gear4:stop()
  gear5:stop()
  jam1:stop()
  jam2:stop()
  jam3:stop()
  jam4:stop()
  jam5:stop()
end

function pauseAllSounds()
  gear1:pause()
  gear2:pause()
  gear3:pause()
  gear4:pause()
  gear5:pause()
  jam1:pause()
  jam2:pause()
  jam3:pause()
  jam4:pause()
  jam5:pause()
end

function playGearSound(num)
  gear:setVolume(settings.volume.sounds)
  love.audio.play(gear)
end

function playIdleSound()
  idle:setVolume(settings.volume.sounds)
  love.audio.play(idle)
end

function sounds.UPDATE()
  if gauge1.angle > 0.7 and gauge1.gearChanged == false then
    playJamSound(gauge1.gear)
  end
end
