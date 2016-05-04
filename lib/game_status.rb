# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ") # returns true if position is taken
end

# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [6, 4, 2]
  ]

def won?(board)
  WIN_COMBINATIONS.each do |win_combo|
    return win_combo if (board[win_combo[0]] == "X" && board[win_combo[1]] == "X" && board[win_combo[2]] == "X")
    return win_combo if (board[win_combo[0]] == "O" && board[win_combo[1]] == "O" && board[win_combo[2]] == "O")
  end

  return false
end

def full?(board)
  if board.all? { |position| position_taken?(board, board.index(position)) }
    return true
  else
    return false
  end
end


def draw?(board)
  if (!won?(board)) && full?(board)
    return true
  else
    return false
  end
end

def over?(board)
  if !full?(board)
    return false
  else
    return true
  end
end

def winner(board)
  if won?(board) && board[won?(board)[0]] == "X"
    return "X"
  elsif won?(board) && board[won?(board)[0]] == "O"
    return "O"
  else
    return nil
  end
end
