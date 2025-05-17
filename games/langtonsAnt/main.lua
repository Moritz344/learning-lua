
-- Langtons Ant


function love.load()

    love.window.setMode(1820,910, {resizable=true,vsync=false})
    
    map = {}
    map.blockSize = 20 
    map.x = 0
    map.y = 0
    
    map.rows = 100
    map.cols = 100

    map.colorWhite = {255 , 255 , 255}
    map.colorBlack = {0 , 0 , 0}

    map.grid = {}
    for row = 1, map.rows do
        map.grid[row] = {}
        for col = 1, map.cols do
            map.grid[row][col] = "white"  -- oder einfach true/false
        end
    end

    
    ant = {}
    
    ant.x = 965
    ant.y = 495

    ant.direction = "up"

    ant.speed = map.blockSize 
    ant.Size = 10

    


end

function turnRight()
  if ant.direction == "up" then
    ant.direction = "right"
  elseif ant.direction == "right" then
    ant.direction = "down"
  elseif ant.direction == "down" then
    ant.direction = "left"
  elseif ant.direction == "left" then
    ant.direction = "up"
  end

end

function turnLeft()
  if ant.direction == "up" then
    ant.direction = "left"
  elseif ant.direction == "left" then
    ant.direction = "down"
  elseif ant.direction == "down" then
    ant.direction = "right"
  elseif ant.direction == "right" then
    ant.direction = "up"
  end
end

function antMoveForward()
  if ant.direction == "up" then
    ant.y = ant.y - ant.speed 
  elseif ant.direction == "down" then
    ant.y = ant.y + ant.speed
  elseif ant.direction == "right" then
    ant.x = ant.x + ant.speed 
  elseif ant.direction == "left" then
    ant.x = ant.x - ant.speed
  end
end




function love.update(dx)
    local col = math.floor(ant.x / map.blockSize) + 1
    local row = math.floor(ant.y / map.blockSize) + 1


    if map.grid[row] and map.grid[row][col] then
        if map.grid[row][col] == "white" then
            map.grid[row][col] = "black"
            turnRight()
            antMoveForward()
        else
            map.grid[row][col] = "white"
            turnLeft()
            antMoveForward()
        end
    end




end

function drawGrid()
  -- 16 x 12 y
  for row = 1,map.rows  do
    for col = 1,map.cols  do
      local x = map.x + (col - 1) * map.blockSize
      local y = map.y + (row - 1)  * map.blockSize

      for index,value in ipairs(map.grid) do
        --print(index,value)
      end
        
      if map.grid[row][col] == "white" then
        love.graphics.setColor(map.colorWhite)
      else
        love.graphics.setColor(map.colorBlack)
      end

      love.graphics.rectangle("fill", x, y, map.blockSize, map.blockSize)
      love.graphics.setColor(map.colorBlack)
      love.graphics.rectangle("line", x, y, map.blockSize, map.blockSize)
    end
  end
end

function drawBlock()
    
  love.graphics.setColor(map.colorWhite)
  love.graphics.rectangle("fill", ant.x, ant.y, map.blockSize, map.blockSize)
    
end

function love.draw()
  drawGrid()
  
  love.graphics.setColor(255,0,0)
  love.graphics.circle("fill",ant.x,ant.y,ant.Size,ant.angle)


end
