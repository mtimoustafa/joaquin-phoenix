require './app/helpers/deciders.rb'

def test_deciders(request)
  begin
    response = {}

    board = request[:board]
    you = request[:you]
    body = you[:body] || []
    food = board[:food] || []

    response[:food_proximity] = food_proximity(body.first, food)
    response[:hunger_value] = hunger_value(you)
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
    response[:in_body_true] = in_body?(snake_body, { x: 5, y: 4 })
    response[:in_body_false] = in_body?(snake_body, { x: 3, y: 4 })
    response[:in_body_false2] = in_body?(snake_body, { x: 3, y: 0 })

    return response
  rescue Exception => e
    response = { error: e, message: e.backtrace.inspect }
  end
end
