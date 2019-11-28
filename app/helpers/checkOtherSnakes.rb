def checkOtherSnakes(currentHead, enemySnakes)
  goDown = { :x => currentHead[:x], :y => currentHead[:y] + 1 }
  goUp = { :x => currentHead[:x], :y => currentHead[:y] - 1 }
  goLeft = { :x => currentHead[:x] - 1, :y => currentHead[:y] }
  goRight = { :x => currentHead[:x] + 1, :y => currentHead[:y] }

  enemySnakes.each do |snake|
    if snake[:body].include?(goRight)
      $potential[:right] -= 5
    end

    if snake[:body].include?(goLeft)
      $potential[:left] -= 5
    end

    if snake[:body].include?(goDown)
      $potential[:down] -= 5
    end

    if snake[:body].include?(goUp)
      $potential[:up] -= 5
    end
  end
end
