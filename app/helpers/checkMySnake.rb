def checkMySnake(currentHead, myBody)
  goDown = { :x => currentHead[:x], :y => currentHead[:y] + 1 }
  goUp = { :x => currentHead[:x], :y => currentHead[:y] - 1 }
  goLeft = { :x => currentHead[:x] - 1, :y => currentHead[:y] }
  goRight = { :x => currentHead[:x] + 1, :y => currentHead[:y] }

  if myBody.include?(goRight)
    $potential[:right] -= 10
  end

  if myBody.include?(goLeft)
    $potential[:left] -= 10
  end

  if myBody.include?(goDown)
    $potential[:down] -= 10
  end

  if myBody.include?(goUp)
    $potential[:up] -= 10
  end
end
