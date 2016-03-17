# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8], # Bottom row
  [0,3,6], # Left column
  [1,4,7], # Center column
  [2,5,8], # Right column
  [0,4,8], # Right diagonal
  [2,4,6] # Left diagonal
]

def won?(board)
  WIN_COMBINATIONS.detect do |win_combo|
    board[win_combo[0]].eql?(board[win_combo[1]]) &&
    board[win_combo[1]].eql?(board[win_combo[2]]) &&
    position_taken?(board, win_combo[0])
  end
end

def winner(board)
  winning_combo = won?(board)
  return board[winning_combo.first] if winning_combo
end

def full?(board)
  board.all? do |board_token|
    board_token == "X" || board_token == "O"
  end
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  won?(board) || draw?(board)
end
