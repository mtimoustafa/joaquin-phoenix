def checkMySnake(currentHead, myBody)
  goDown = { :x => currentHead[:x], :y => currentHead[:y] + 1 }
  goUp = { :x => currentHead[:x], :y => currentHead[:y] - 1 }
  goLeft = { :x => currentHead[:x] - 1, :y => currentHead[:y] }
  goRight = { :x => currentHead[:x] + 1, :y => currentHead[:y] }

  if myBody.include?(goRight)
    $potential[:right] -= 5
  end

  if myBody.include?(goLeft)
    $potential[:left] -= 5
  end

  if myBody.include?(goDown)
    $potential[:down] -= 5
  end

  if myBody.include?(goUp)
    $potential[:up] -= 5
  end
end
