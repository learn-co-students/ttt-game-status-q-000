# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
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
  [2,4,6]
]

def won?(board)
  if WIN_COMBINATIONS.each do |combo|

    combo_index_1 = combo[0]
    combo_index_2 = combo[1]
    combo_index_3 = combo[2]

    win_position_1 = board[combo_index_1]
    win_position_2 = board[combo_index_2]
    win_position_3 = board[combo_index_3]

    if win_position_1 == "X" && win_position_2 == "X" && win_position_3 == "X"
      return combo
    elsif win_position_1 == "O" && win_position_2 == "O" && win_position_3 == "O"
      return combo
    end
  end
  else
    return false
  end
end

def full?(board)
  if board.any? { |i| i == " " }
    return false
  elsif board.count{|i| i == 5}
    return true
  end
end

def draw?(board)
  if full?(board) == true && !won?(board)
    return true
  else
    return false
  end
end

def over?(board)
  if draw?(board) == true || won?(board)
    return true
  else
    return false
  end
end

def winner(board)
   if win_combo = won?(board)
     board[win_combo.first]
   end
end
