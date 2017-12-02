# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [3,4,5],  # Middle row
  [0,1,2],  # Top row
  [6,7,8],  # Middle row
  [0,3,6],  # Middle row
  [1,4,7],  # Middle row
  [2,5,8],  # Middle row
  [0,4,8],  # Middle row
  [2,4,6],  # Middle row
]

def won?(board)
  WIN_COMBINATIONS.each do |win_combo|
    if board[win_combo[0]]!=" " && board[win_combo[0]]==board[win_combo[1]] && board[win_combo[1]]==board[win_combo[2]]
      return win_combo
    end
  end
  return false
end

def full?(board)
  return board.count(" ") == 0
end

def draw?(board)
  return !won?(board) && full?(board)
end

def over?(board)
  return won?(board) || full?(board)
end

def winner(board)
  if !won?(board)
    return nil
  else
    return board[won?(board)[0]]
  end

end
