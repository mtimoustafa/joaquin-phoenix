require './app/helpers/wall'
require './app/helpers/checkMySnake'

$potential = { :up => 0, :right => 0, :down => 0, :left => 0 }

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

  $potential = { :up => 0, :right => 0, :down => 0, :left => 0 }

  return {move: direction}
end
