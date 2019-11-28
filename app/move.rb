require './app/helpers/wall'
require './app/helpers/checkMySnake'
require './app/helpers/checkOtherSnakes'
require './app/helpers/food'
require './app/helpers/deciders'

$potential = { :up => 0, :right => 0, :down => 0, :left => 0 }

def move(board, debug = false)
  debug_log = { board: board }

  myBody = board[:you][:body]
  currentHead = myBody[0]
  width = board[:board][:width]
  height = board[:board][:height]
  currentHealth = board[:you][:health]
  existingFood = board[:board][:food]

  # Avoidant logic
  checkWall(currentHead, width, height)
  checkMySnake(currentHead, myBody)
  checkOtherSnakes(currentHead, board[:board][:snakes])

  # checkFood
  if existingFood.present?
    check_food(currentHead, existingFood, board[:you])
  end

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

  if debug
    debug_log = { debug: debug_log }
    return {move: direction}.merge(debug_log)
  end

  return {move: direction}
end
