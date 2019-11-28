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
end
