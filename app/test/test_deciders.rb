require '../helpers/deciders.rb'

def test_deciders(board)
  response = {}
  response[:board] = board

  you = board[:you]
  response[:food_proximity] = food_proximity(you[:body].first, food.first)
  response[:snake_size] = snake_size(you)
  response[:adjacent_heads] = adjacent_heads(you, board[:snakes])
  response[:contesting_heads] = contesting_heads(you, board[:snakes])

  snake_body = [
    { x: 4, y: 5 },
    { x: 5, y: 5 },
    { x: 5, y: 4 },
    { x: 5, y: 3 },
    { x: 6, y: 3 }
  ]
  response[:in_body_true] = in_body?(snake_body { x: 5, y: 4 })
  response[:in_body_false] = in_body?(snake_body { x: 3, y: 4 })
  response[:in_body_false2] = in_body?(snake_body { x: 3, y: 0 })
end
