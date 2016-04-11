# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
      [0,1,2],
      [3,4,5],
      [6,7,8],
      [0,3,6],
      [1,4,7],
      [2,5,8],
      [0,4,8],
      [6,4,2]]

def won?(board)
if board.reject{|i| i == " "} == []
    return false
  end
# for each ["X", "O"]
#  for each win combination
#   for each board(position)
#     if all positions == XorO
 #       return win_combination

 WIN_COMBINATIONS.each do |win|
  win_index_1 = win[0]
  win_index_2 = win[1]
  win_index_3 = win[2]
  position_1 = board[win_index_1]
  position_2 = board[win_index_2]
  position_3 = board[win_index_3]
   if position_1 == "X" && position_2 == "X" && position_3 == "X"
     return win
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
     return win
    end
 end
  if full?(board)
    return false
  end

end


def full?(board)
  if board.select{|i| i == " "} == []
    return true
  end
 end

def draw?(board)
  if won?(board)
    return false
  end
  if !won?(board) && full?(board)
     return true
  end
  if !won?(board) && !full?(board)
    return false
  end
end

def over?(board)
  if won?(board)
    return true
  end
  if !won?(board) && full?(board)
     return true
  end
  if !won?(board) && !full?(board)
    return false
  end
end

def winner(board)
  winning_combination = won?(board)
  if winning_combination
    winning_position = winning_combination[0]
    board[winning_position]
  end
end



