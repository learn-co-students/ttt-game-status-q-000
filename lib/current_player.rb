require 'pry'

  board=[1,2,3,4]
def turn_count(board)
  # binding.pry
  counter = 0
  board.each do |xo|
    if xo == "X" || xo == "O"
      counter += 1 
    end
  end
counter
end

def current_player(board)
  if turn_count(board) % 2 == 0
    return "X"
  else
    return "O"
  end
end


