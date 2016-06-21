WIN_COMBINATIONS = [
[0,1,2], # Top row
[3,4,5], # Middle row
[6,7,8], # Bottom row
[0,3,6], # First column
[1,4,7], # Second column
[2,5,8], # Third column
[0,4,8], # Top left bottom right diagonal
[2,4,6]  # Top right bottom left diagonal
]

# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def all_same(winning_combo, token, board)
  winning_combo.all? do |position|
    board[position] == token
  end
end

def won?(board)
  WIN_COMBINATIONS.each do |winning_combo|
    if all_same(winning_combo, "X", board) == true || all_same(winning_combo, "O", board) == true
      return winning_combo
    end
  end
  return false
end

def full?(board)
  board.all? do |position|
    position == "X" || position == "O"
  end
end

def draw?(board)
  !won?(board) and full?(board)
end

def over?(board)
  won?(board) || draw?(board) || full?(board)
end

def winner(board)
  if won?(board)
    winning_combo = won?(board)
    token = board[winning_combo[0]]
    return token
  else
    return nil
  end
end
