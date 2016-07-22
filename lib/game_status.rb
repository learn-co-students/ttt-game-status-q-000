def position_taken? (board, location)
  board[location] != " " && board[location] != ""
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # top row
  [3,4,5], # mid row
  [6,7,8], # bottom row
  [0,3,6], # left column
  [1,4,7], # mid column
  [2,5,8], # right column
  [0,4,8], # diagonal
  [2,4,6], # diagonal
]

def won? (board)
  WIN_COMBINATIONS.each { |win_combo|
    if (board[win_combo[0]] == board[win_combo[1]]) && (board[win_combo[1]] == board[win_combo[2]]) && position_taken?(board, win_combo[0])
      return win_combo
    end
  }

  return false
end

def full? (board)
  return board.all? { |val| ["X","O"].include? val }
end

def draw? (board)
  return false if won?(board)
  return full?(board)
end

def over? (board)
  return (won?(board) || draw?(board))
end

def winner (board)
  return board[won?(board)[0]] if won?(board)
end
