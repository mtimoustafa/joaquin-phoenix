# TODO: Implement your logic here!
# View docs at https://docs.battlesnake.com/snake-api for example payloads.
def move(board)
  height = board[:board][:height]
  width = board[:board][:width]
  myBody = board[:you][:body]
  currentHead = myBody[0]
  currentHealth = board[:you][:health]

  if currentHead[:y] > 0
    return { move: :up }
  end

  if currentHead[:x] > 0
    return {move: :left}
  end

  if currentHead[:y] === 0
    return { move: :down }
  end

  if currentHead[:x] === 0
    return {move: :right}
  end
end
