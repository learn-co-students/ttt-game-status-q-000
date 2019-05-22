# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top Row
  [3,4,5], # Middle Row
  [6,7,8], # Bottom Row
  [0,3,6], # Left Row
  [1,4,7], # Center Row
  [2,5,8], # Right Row
  [0,4,8], # Right Diagonal
  [2,4,6]  # Left Diagonal
]

def won?(board)
  if board.all? { |place| place == ' ' }
    return false
  end
  for combo in WIN_COMBINATIONS
    if combo.all? { |index| board[index] == 'X' }
      return combo
    elsif combo.all? { |index| board[index] == 'O' }
      return combo
    end
  end
  false
end

def full?(board)
  board.all? { |place| place != ' ' }
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  if won?(board)
    return true
  end

  draw?(board) || full?(board)
end

def winner(board)
  if won?(board)
    board[won?(board)[0]]
  end
end
