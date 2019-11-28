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

# returns all snake heads adjacent to our snake's head
# adjacent = head is already in a square we can move to
def adjacent_heads(our_snake, other_snakes)
  our_head = our_snake.body.first
  other_snake_heads = other_snakes.map { |s| s.body.first }

  other_snake_heads.keep_if { |head| is_adjacent(our_head, head) }
  return other_snake_heads
end

# returns all squares we can move into that are contested by other snakes
# contesting = head can collide with us if we move into that square
def contesting_heads(our_snake, other_snakes)
  our_head = our_snake.body.first
  other_snake_heads = other_snakes.map { |s| s.body.first }

  other_snake_heads.keep_if { |head| (our_head.x - their_head.x).abs + (our_head.y - their_head.y).abs == 2 }

  return [] if (other_snake_heads.empty?)

  contested = []
  other_snake_heads.each { |head|
    next if in_body?(our_snake.body, head)

    c = {}
    c.x = our_head.x + ((their_head.x - our_head.x) / 2)
    c.y = our_head.y + ((their_head.y - our_head.y) / 2)
    contested.push(c)
  }

  return contested
end

# does the cell fall in our snake's body?
def in_body?(snake_body, cell)
  return snake_body.keep_if { |body| body.x == cell.x && body.y == cell.y }
end


private


def is_adjacent(our_head, their_head)
  adjacent = (our_head.x + 1 == their_head.x || our_head.x - 1 == their_head) && (our_head.y == their_head.y)
  adjacent ||= (our_head.y + 1 == their_head.y || our_head.y - 1 == their_head) && (our_head.x == their_head.x)
  return adjacent;
end
