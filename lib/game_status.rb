# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8],  # Bottom row
  [0,3,6], # Left column
  [1,4,7],  # Middle column
  [2,5,8],  # Right column
  [0,4,8],  # Left top diagonal
  [2,4,6]  # Right top diagonal 
]

def won?(board)
  WIN_COMBINATIONS.detect do |combos| 
    board[combos[0]] == board[combos[1]] &&
    board[combos[1]] == board[combos[2]] &&
    position_taken?(board, combos[0])
    end
end

def full?(board)
  board.all?{|i| i == "X" || i == "O"}
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  won?(board) || draw?(board)
end

def winner(board)
  if winner_combo = won?(board)
    board[winner_combo.first]
  end
end
