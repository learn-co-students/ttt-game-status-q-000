# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8],  # Bottom row
  [0,3,6], # First Column
  [1,4,7], # Second Column
  [2,5,8], # Third Column
  [0,4,8], # Diagonal left to right
  [2,4,6]  # Diagonal right to left
]

def won?(board)
  WIN_COMBINATIONS.each do |combo|
    if board[combo[0]] == "X" && board[combo[1]] == "X" && board[combo[2]] == "X"
      return combo
    elsif board[combo[0]] == "O" && board[combo[1]] == "O" && board[combo[2]] == "O"
      return combo
    end
  end
  return false
end

def full?(board)
  board.all? {|position| position_taken?(board, board.index(position))}
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  if won?(board) || full?(board) || draw?(board)
    return true
  else
    return false
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

#board = ["X", " ", " ", " ", "X", " ", " ", " ", "X"]
#board = ["X", "O", " ", " ", "O", " ", " ", "O", "X"]
board = ["X", "O", " ", " ", " ", " ", " ", "O", "X"]
winner(board)