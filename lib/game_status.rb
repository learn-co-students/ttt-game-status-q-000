require 'pry'

# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],  # Top row
  [3,4,5],  # Middle row
  [6,7,8],  # Bottom row
  [0,3,6],  # Left column
  [1,4,7],  # Middle column
  [2,5,8],  # Right column
  [0,4,8],  # Diagonal top left to bottom right
  [2,4,6]  # Diagonal top right to bottom left
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
  return true if (board.count("X") + board.count("O")) == board.count
end

def draw?(board)
  return true if full?(board) == true && won?(board) == false
end

def over?(board)
  return true if won?(board) || draw?(board) || full?(board)
end

def winner(board)
  win_combo = won?(board)
  #binding.pry
  if win_combo == false
    return nil
  elsif board[win_combo[0]] == "X"
    return "X"
  elsif board[win_combo[0]] == "O"
    return "O"
  end
end