# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom row
  [0,3,6], # First column
  [1,4,7], # Second column
  [2,5,8], # Third column
  [0,4,8], # First diagonal
  [2,4,6] # Second diagonal
]

def won?(board)
  idx = 0
  while idx < WIN_COMBINATIONS.length
    win_index_1 = WIN_COMBINATIONS[idx][0]
    win_index_2 = WIN_COMBINATIONS[idx][1]
    win_index_3 = WIN_COMBINATIONS[idx][2]
    if (board[win_index_1] == "X" && board[win_index_2] == "X" && board[win_index_3] == "X") || (board[win_index_1] == "O" && board[win_index_2] == "O" && board[win_index_3] == "O")
      return WIN_COMBINATIONS[idx]
    end
    idx += 1
  end
  return false
end

def full?(board)
  taken = 0
  for position in (0..8)
    if position_taken?(board, position)
      taken += 1
    end
  end
  if taken == 9
	return true
  else
	return false
  end
end

def draw?(board)
  if full?(board) && won?(board) == false
    return true
  elsif !full?(board) && won?(board) == false
    return false
  else
    return false
  end
end

def over?(board)
  if won?(board) != false || full?(board) || draw?(board)
    return true
  else
    return false
  end
end

def winner(board)
  if won?(board) != false
    win_combination = won?(board)
    return board[win_combination[0]]
  end
end
