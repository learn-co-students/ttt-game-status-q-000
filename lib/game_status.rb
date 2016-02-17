# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8], # bottom row
  [0,4,8], #diagonal
  [6,4,2], #diagonal
  [0,3,6], #1st column
  [1,4,7], #2nd column
  [2,5,8]  #3d column
]

def won?(board)
  WIN_COMBINATIONS.detect do |combo|
    board[combo[0]] == board[combo[1]] &&
    board[combo[1]] == board[combo[2]] &&
    position_taken?(board, combo[0])
  end
end

def full?(board)
 board.all?{|token| token == "X" || token == "O"}
end

def over?(board)
  won?(board) || full?(board)
end

def draw?(board)
  full?(board) && !won?(board)
end

def winner(board)
  if winning_combo = won?(board)
    board[winning_combo.first]
  end
end

