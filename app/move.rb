require './app/helpers/wall'
require './app/helpers/checkMySnake'
require './app/helpers/checkOtherSnakes'
require './app/helpers/food'
require './app/helpers/deciders'
require './app/helpers/contests'

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
  pp "wall:"
  pp $potential
  checkMySnake(currentHead, myBody)
  pp "ourself"
  pp $potential
  checkOtherSnakes(currentHead, board[:board][:snakes])
  pp "others"
  pp $potential

  # checkFood
  if existingFood.present?
    check_food(currentHead, existingFood, board[:you])
  end
  pp "food"
  pp $potential

  # Aggressive logic
  check_contests(board)

  pp "head"
  pp $potential

  # checkLethality
  direction = ''
  max = -99

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
