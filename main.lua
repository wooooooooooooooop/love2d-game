function love.load()
    love.window.setTitle("asdasdsd")

    backgroundColor = { 107 / 255, 140 / 255, 255 / 255 } -- blue

    groundY = 350

    player = {
        x = 50,
        y = groundY - 32,
        width = 32,
        height = 32,
        speed = 200,
        jumpPower = -400,
        gravity = 800,
        velocityY = 0,
        isJumping = false
    }

    print("Player initialized:", player)
end

function love.update(dt)
    if player == nil then
        print("Warning: player was nil! Resetting...")
        player = { x = 50, y = groundY - 32, width = 32, height = 32, speed = 200, jumpPower = -400, gravity = 800, velocityY = 0, isJumping = false }
    end

    if player.velocityY == nil then
        print("Warning: player.velocityY was nil! Resetting...")
        player.velocityY = 0
    end

    if love.keyboard.isDown("a") then
        player.x = player.x - player.speed * dt
    elseif love.keyboard.isDown("d") then
        player.x = player.x + player.speed * dt
    end

    player.velocityY = player.velocityY + player.gravity * dt
    player.y = player.y + player.velocityY * dt

    if player.y + player.height >= groundY then
        player.y = groundY - player.height
        player.velocityY = 0
        player.isJumping = false
    end
end

function love.keypressed(key)
    if key == "space" and not player.isJumping then
        player.velocityY = player.jumpPower
        player.isJumping = true
        print("Player jumped! velocityY:", player.velocityY)
    end
end

function love.draw()
    love.graphics.clear(backgroundColor[1], backgroundColor[2], backgroundColor[3])

    love.graphics.setColor(0.3, 0.6, 0.2)
    love.graphics.rectangle("fill", 0, groundY, love.graphics.getWidth(), 50)

    love.graphics.setColor(1, 0, 0)
    love.graphics.rectangle("fill", player.x, player.y, player.width, player.height)
end
