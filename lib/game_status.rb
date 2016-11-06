# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2], # top row
  [3, 4, 5], # middle row
  [6, 7, 8], # bottom row
  [0, 3, 6], # left column
  [1, 4, 7], # center column
  [2, 5, 8], # right column
  [0, 4, 8], # L-R diagonol
  [2, 4, 6] # R-L diagonol
]

def won?(board)
  return false if board.all? { |pos| pos == " " }

  WIN_COMBINATIONS.each do |combo|
    if check(board, combo, "X")
      return combo
    elsif check(board, combo, "O")
      return combo
    end
  end

  return false
end

# define a helper function to "check" if the current WIN_COM wins
  # take the board, WIN_COM and symbol as an argument
    # if the val at each board[WIN_COM] index is equal to the symbol
      # return the WIN_COM
def check(board, array, symbol)
  array.each do |pos|
    return false unless board[pos] == symbol
  end
  true
end

def full?(board)
  if won?(board) == false && board.none? { |pos| pos == " " }
    return true
  elsif board.include?(" ")
    return false
  end
end

def draw?(board)
  if full?(board)
    return true unless won?(board)
  else
    return false
  end
end

def over?(board)
  if draw?(board) || won?(board)
    return true
  else
    false
  end
end

def winner(board)
  # use check as we did in #won
  # rather than returning the winning row/column, return the symbol
  WIN_COMBINATIONS.each do |combo|
    if check(board, combo, "X")
      return "X"
    elsif check(board, combo, "O")
      return "O"
    end
  end

  return nil
end
