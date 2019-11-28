# calculates straight-line distance to food from head
# where one unit is one cell's length
def food_proximity(snake_head_location, food_locations)
  proximities = []

  food_locations.each { |food_location| 
    proximity = (food_location[:y] - snake_head_location[:y]) ** 2
    proximity += (food_location[:x] - snake_head_location[:x]) ** 2
    proximity = Math.sqrt(proximity)

    proximities.push(proximity)
  }

  return proximities
end

# calculates number of cells that make up a snake
def snake_size(snake)
  return snake[:body].length
end

# returns all snake heads adjacent to our snake's head
# adjacent = head is already in a square we can move to
def adjacent_heads(our_snake, other_snakes)
  our_head = our_snake[:body].first
  other_snake_heads = other_snakes.map { |s| s[:body].first }

  other_snake_heads.keep_if { |head| is_adjacent(our_head, head) }
  return other_snake_heads
end

# returns all squares we can move into that are contested by other snakes
# contesting = head can collide with us if we move into that square
def contesting_heads(our_snake, other_snakes)
  return if other_snakes.blank?
  our_head = our_snake[:body].first

  other_snakes.keep_if { |snake|
    snake_head = snake[:body].first
    return (our_head[:x] - snake_head[:x]).abs + (our_head[:y] - snake_head[:y]).abs == 2  
  }

  result = other_snakes.map { |snake| { id: snake[:id], safe: snake_size(snake) < snake_size(our_snake) } }
  return result
end

# does the cell fall in our snake's body?
def in_body?(snake_body, cell)
  snake_body.keep_if { |body| body[:x] == cell[:x] && body[:y] == cell[:y] }
  return snake_body.length > 0
end


private


def is_adjacent(our_head, their_head)
  adjacent = (our_head[:x] + 1 == their_head[:x] || our_head[:x] - 1 == their_head) && (our_head[:y] == their_head[:y])
  adjacent ||= (our_head[:y] + 1 == their_head[:y] || our_head[:y] - 1 == their_head) && (our_head[:x] == their_head[:x])
  return adjacent;
end
