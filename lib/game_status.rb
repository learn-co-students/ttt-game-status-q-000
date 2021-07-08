# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8],  # Bottom row
  [0,3,6], #left column
  [1,4,7],  #Middle column
  [2,5,8], # Right column
  [0,4,8],  # Diagnol 1
  [2,4,6]   # Diagnol 2
]

def won?(board)
  for winning_combination in WIN_COMBINATIONS
    if position_taken?(board, winning_combination[0])
      if board[winning_combination[0]] == board[winning_combination[1]] && board[winning_combination[1]] == board[winning_combination[2]]
        return winning_combination
      end
    end
  end
  return false
end

def full?(board)
  for position in board
    unless position == "X" || position == "O"
      return false
    end
  end
  return true
end

def draw?(board)
  if full?(board) && !won?(board)
    return true
  else
    return false
  end
end

def over?(board)
  if won?(board) || draw?(board)
    return true
  end
  false
end

def winner(board)
  if won?(board)
    return board[won?(board)[0]]
  end
end