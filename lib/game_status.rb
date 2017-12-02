# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # top row
  [3,4,5], # middle row
  [6,7,8], # bottom row
  [0,3,6], # left column
  [1,4,7], # middle column
  [2,5,8], # right column
  [0,4,8], # left diagonal
  [6,4,2] # right diagonal
  ]

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    win = win_combination.all? do |location|
      board[location] == "X"
    end
    if win
      return win_combination
    end
    win = win_combination.all? do |location|
      board[location] == "O"
    end
    if win
      return win_combination
    end
  end
  return false
end

def full?(board)
  full_board = board.all? do |index|
    index == "X" || index == "O"
  end
  if full_board
      return true
  else
    return false
  end
end

def draw?(board)
  if !(won?(board)) && full?(board)
    return true
  else
    return false
  end
end

def over?(board)
  if won?(board) || draw?(board) || full?(board)
    return true
  else
    return false
  end
end
#won?(board) == false
#return nil if !(board[won?(board)[0]] == "X" || !(board[won?(board)[0]] == "O")
# ??access element from WIN_COMBINATIONS nested array
# method does not output return values
def winner(board)
  return nil if !(won?(board))
  return "X" if board[won?(board)[0]] == "X"
  return "O" if board[won?(board)[0]] == "O"
end