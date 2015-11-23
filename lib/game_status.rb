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
  [1,4,7], # Middle column
  [2,5,8], # Right column
  [0,4,8],# L to R Diagonal
  [2,4,6] # R to L Diagonal
]

def won?(board)
  WIN_COMBINATIONS.detect do |combination|
   x_win = combination.all? do |pos|
             board[pos] == 'X' 
           end

   o_win = combination.all? do |pos|
             board[pos] == 'O' 
           end
   x_win || o_win
  end
end

def full?(board)
  board.all? do |pos|
    position_taken?(board, board.index(pos))
  end
end

def draw?(board)
  if full?(board) == true && won?(board) == nil
    return true
  else 
    false
  end
end

def over?(board)
  if won?(board) || full?(board) || draw?(board)
    return true
  end
end

def winner(board)
  if won?(board) != nil
    return board[won?(board)[0]]
  end
end

