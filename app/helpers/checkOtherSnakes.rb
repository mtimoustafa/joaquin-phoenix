def checkOtherSnakes(currentHead, enemySnakes)
  goDown = { :x => currentHead[:x] + 1, :y => currentHead[:y] }
  goUp = { :x => currentHead[:x] - 1, :y => currentHead[:y] }
  goLeft = { :x => currentHead[:x], :y => currentHead[:y] - 1 }
  goRight = { :x => currentHead[:x], :y => currentHead[:y] + 1 }

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
