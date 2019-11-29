require './app/helpers/deciders'

def check_contests(state)
   contesting_heads(state[:you], state[:board][:snakes])
   contesting_heads_attack(state[:you], state[:board][:snakes])
end
