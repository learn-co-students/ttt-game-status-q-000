# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # top row
  [3,4,5], # middle row
  [6,7,8], # bottom row
  [0,3,6], # left column
  [1,4,7], # middle column
  [2,5,8], # right column
  [0,4,8], # top left diagnoal
  [2,4,6]  # top right diagonal
]

def won?(board)
  WIN_COMBINATIONS.detect {|combo| board[combo[0]] == board[combo[1]] && board[combo[1]] == board[combo[2]] && !(board[combo[0]] == " ")} 
end

def full?(board)
  board.all?{|index| !(index == " ") } #=> true
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) || draw?(board) || full?(board)
end

def winner(board)
  if won?(board)
    board[won?(board)[0]]
  end
end