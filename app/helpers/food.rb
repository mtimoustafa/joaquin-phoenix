require './app/helpers/deciders'

def check_food(current_head, existing_food, my_body, enemy_snakes)
  proximity_array = food_proximity(current_head, existing_food)
  closest_food_proximity = 99999999
  closest_food_index = ''

  proximity_array.each_with_index do |item, index|
    if item < closest_food_proximity
      closest_food_proximity = item
      closest_food_index = index
    end
  end

  target_food = existing_food[closest_food_index]

  if target_food[:x] > current_head[:x]
    $potential[:right] += hunger_value(my_body, enemy_snakes)
  end

  if target_food[:x] < current_head[:x]
    $potential[:left] += hunger_value(my_body, enemy_snakes)
  end

  if target_food[:y] < current_head[:y]
    $potential[:up] += hunger_value(my_body, enemy_snakes)
  end

  if target_food[:y] > current_head[:y]
    $potential[:down] += hunger_value(my_body, enemy_snakes)
  end

  # CHASE THE HEAD
  if enemy_snakes.length === 1 && snake_size(my_body) > snake_size(enemy_snakes[0]) + 1
    if enemy_snakes[0][:body][0][:x] > current_head[:x]
      $potential[:right] += 3
    end

    if enemy_snakes[0][:body][0][:x] < current_head[:x]
      $potential[:left] += 3
    end

    if enemy_snakes[0][:body][0][:y] < current_head[:y]
      $potential[:up] += 3
    end

    if enemy_snakes[0][:body][0][:y] > current_head[:y]
      $potential[:down] += 3
    end
  end
end
