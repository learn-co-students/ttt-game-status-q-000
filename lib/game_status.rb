# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # bottom row
  [0,4,8], # diag left top to bottom right
  [6,4,2], # top right bottom left
  [0,3,6], # 1st column
  [1,4,7], # 2nd column
  [2,5,8] # 3rd column
  # ETC, an array for each win combination
  ]

def won?(board)
  WIN_COMBINATIONS.detect do |combo|
    board[combo[0]] == board[combo[1]] &&
    board[combo[1]] == board[combo[2]] &&
    position_taken?(board, combo[0])
  end
end

def full?(board)
  board.all?{|player| player == "X" || player == "O"}
end

def draw?(board)
   !won?(board) && full?(board)
end

def over?(board)
  won?(board) || draw?(board) || full?(board)
end

def winner(board)
 if won?(board)
   position = won?(board)[0]
   return board[position]
  end
 end











