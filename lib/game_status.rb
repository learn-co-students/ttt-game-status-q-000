# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top Row
  [3,4,5], # Middle Row
  [6,7,8], # Bottom Row
  [0,3,6], # First Column
  [1,4,7], # Second Column
  [2,5,8], # Third Column
  [0,4,8], # First Diagonal
  [6,4,2] #Second Diagonal
]

def won?(board)
  if (board.all? { |e| (e == " " || e == "")})
    false
  else
    WIN_COMBINATIONS.detect do |win_combination|
     win_combination.all? { |e| (board[e] == "X") } || win_combination.all? { |e| (board[e] == "O") }
    end
  end
end

def full? (board)
  board.all? do |check|
    check != " "
  end
end

def draw? (board)
  full?(board) && !won?(board)
end

def over? (board)
  full?(board) || won?(board) || draw?(board)
end
 
def winner(board)
  if won?(board)
    board[won?(board)[0]]
  end
end