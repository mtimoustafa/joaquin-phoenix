def checkOtherSnakes(currentHead, enemySnakes)
  goRight = { :x => currentHead[:x] + 1, :y => currentHead[:y] }
  goLeft = { :x => currentHead[:x] - 1, :y => currentHead[:y] }
  goUp = { :x => currentHead[:x], :y => currentHead[:y] - 1 }
  goDown = { :x => currentHead[:x], :y => currentHead[:y] + 1 }

  enemySnakes.each do |snake|
    if snake.include?(goRight)
      $potential[:right] -= 5
    end

    if snake.include?(goLeft)
      $potential[:left] -= 5
    end

    if snake.include?(goDown)
      $potential[:down] -= 5
    end

    if snake.include?(goUp)
      $potential[:up] -= 5
    end
  end
end
