def checkWall(currentHead, width, height)
  if currentHead[:x] === 0
    $potential[:left] -= 10
  end

  if currentHead[:y] === 0
    $potential[:up] -= 10
  end

  if currentHead[:x] === width - 1
    $potential[:right] -= 10
  end

  if currentHead[:y] === height - 1
    $potential[:down] -= 10
  end

  if currentHead[:x] === 1
    $potential[:left] -= 1
  end

  if currentHead[:y] === 1
    $potential[:up] -= 1
  end

  if currentHead[:x] === width - 2
    $potential[:right] -= 1
  end

  if currentHead[:y] === height - 2
    $potential[:down] -= 1
  end
end
