def checkMySnake(currentHead, myBody)
  goRight = { :x => currentHead[:x] + 1, :y => currentHead[:y] }
  goLeft = { :x => currentHead[:x] - 1, :y => currentHead[:y] }
  goUp = { :x => currentHead[:x], :y => currentHead[:y] - 1 }
  goDown = { :x => currentHead[:x], :y => currentHead[:y] + 1 }

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
