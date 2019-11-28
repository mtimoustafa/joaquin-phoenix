require './app/helpers/deciders'

def check_food(current_head, existing_food)
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
    $potential[:right] += hunger_value
  end

  if target_food[:x] < current_head[:x]
    $potential[:left] += hunger_value
  end

  if target_food[:y] < current_head[:y]
    $potential[:up] += hunger_value
  end

  if target_food[:y] > current_head[:y]
    $potential[:down] += hunger_value
  end
end
