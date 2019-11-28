def checkOtherSnakes(currentHead, enemySnakes)
  goDown = { :x => currentHead[:x], :y => currentHead[:y] + 1 }
  goUp = { :x => currentHead[:x], :y => currentHead[:y] - 1 }
  goLeft = { :x => currentHead[:x] - 1, :y => currentHead[:y] }
  goRight = { :x => currentHead[:x] + 1, :y => currentHead[:y] }

  enemySnakes.each do |snake|
    snake[:body].each do |coord|
      if goDown[:x] === coord[:x] && goDown[:y] === coord[:y]
        $potential[:down] -= 10
      end

      if goUp[:x] === coord[:x] && goUp[:y] === coord[:y]
        $potential[:up] -= 10
      end

      if goRight[:x] === coord[:x] && goRight[:y] === coord[:y]
        $potential[:right] -= 10
      end

      if goLeft[:x] === coord[:x] && goLeft[:y] === coord[:y]
        $potential[:left] -= 10
      end
    end
  end
end
