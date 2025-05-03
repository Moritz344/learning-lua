
-- TODO: sound + score

function love.load()
  player = {}
  player.x = 200
  player.y = 300
  player.width = 10
  player.height = 50
  player.speed = 5
  player.score = 0

  WindowMinHeight = 0
  WindowMaxHeight = 550

  player_2 = {}
  player_2.score = 0
  player_2.x = 600
  player_2.y = 300
  player_2.speed = 5
  
  ball = {}
  ball.x = 400
  ball.y = 300
  ball.speed_x = 3
  ball.speed_y = 3
  ball.size = 10

  myFont = love.graphics.newFont(32)
  love.graphics.setFont(myFont)



  ball.checkCollision = function(ball,paddle)
        return ball.x < paddle.x + 10 and
               paddle.x < ball.x + ball.size and
               ball.y < paddle.y + 50 and
               paddle.y < ball.y + ball.size
  end

end

function playerMovement()
  if love.keyboard.isDown("w") then
    player.y = player.y - player.speed
  elseif love.keyboard.isDown("s") then
    player.y = player.y + player.speed
  end
end

function playerCollision()
  if player.y < WindowMinHeight then
    player.y = WindowMinHeight
  elseif player.y > WindowMaxHeight then
    player.y = WindowMaxHeight
  end
end


function ballMovement()
  ball.x = ball.x + ball.speed_x
  ball.y = ball.y - ball.speed_y

end

function ballCollision()
  if ball.y < WindowMinHeight then
    ball.speed_y  = ball.speed_y * -1
  elseif ball.y > WindowMaxHeight + 40 then
    ball.speed_y = ball.speed_y * -1
  end

  if ball.x > 800 then
    player.score = player.score + 1
    ball.speed_x = ball.speed_x * -1
  elseif ball.x < 10 then
    player_2.score = player_2.score + 1
    ball.speed_x = ball.speed_x * -1
  end

  if ball:checkCollision(player) then
    ball.speed_x = ball.speed_x * -1
  end
  if ball:checkCollision(player_2) then
    ball.speed_x = ball.speed_x * -1
  end
end

function player_2KI()
  
  local slower_value = math.random(0,5)
  local start_moving = math.random(200,500)


  if ball.x > start_moving then  
    if ball.y + slower_value > player_2.y then
      player_2.y = player_2.y + player_2.speed
    elseif ball.y - slower_value < player_2.y then
      player_2.y = player_2.y - player_2.speed
    end
  end

  if ball.x > player_2.x then
    player_2.speed = 0
  else 
    player_2.speed = 4
  end

  print(ball.x,player_2.x)

  if ball.y == player_2.y and ball.x == player_2.x then
    ball.x = 500
    ball.y = 200
  end

end

function resetScore()
  if player.score == 5 or player_2.score == 5 then
    player.score = 0
    player_2.score = 0
  end
end

function love.update(dt)
    playerMovement()
    playerCollision()

    player_2KI()
   
    ballMovement()
    ballCollision()

    resetScore()

end

function love.draw()
  -- players
  love.graphics.rectangle("fill",player.x,player.y,player.width,player.height)
  love.graphics.rectangle("fill",player_2.x,player_2.y,player.width,player.height)
  --
  
  love.graphics.print(player.score,160,10)
  love.graphics.print(player_2.score,640,10)

  -- ball
  love.graphics.circle("fill",ball.x,ball.y,ball.size)

end
