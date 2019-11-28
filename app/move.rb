$potential = { :up => 0, :right => 0, :down => 0, :left => 0 }

def checkWall(currentHead, width, height)
  if currentHead[:y] === 0
    $potential[:up] -= 5
  end

  if currentHead[:x] === 0
    $potential[:left] -= 5
  end

  if currentHead[:y] === height - 1
    $potential[:down] -= 5
  end

  if currentHead[:x] === width - 1
    $potential[:right] -= 5
  end
end

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

def move(board, debug = false)
  myBody = board[:you][:body]
  currentHead = myBody[0]
  width = board[:board][:width]
  height = board[:board][:height]
  currentHealth = board[:you][:health]

  # Avoidant logic
  checkWall(currentHead, width, height)
  checkMySnake(currentHead, myBody)
  # checkOtherSnake

  # checkFood
  # checkLethality
  direction = ''
  max = 0
  $potential.each {|key, value|
    if value >= max
      max = value
      direction = key
    end
  }

  pp $potential

  return {move: direction}
end
