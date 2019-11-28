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
