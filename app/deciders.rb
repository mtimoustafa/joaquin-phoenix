require './globals'

# calculates straight-line distance to food from head
# where one unit is one cell's length
def food_proximity(snake_head_location, food_location)
  return (food_location.y - snake_head_location.y).abs / (food_location.x - snake_head_location.x).abs
end

# calculates number of cells that make up a snake
def snake_size(snake)
  return snake.body.length
end
