# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
   [0,1,2] ,
   [3,4,5] ,
   [6,7,8] ,
   [0,3,6] ,
   [1,4,7] ,
   [2,5,8] ,
   [0,4,8] ,
   [2,4,6]
  ]

def won?(board)
  WIN_COMBINATIONS.find do |win|
    board[win[0]] == board[win[1]] &&
    board[win[1]] == board[win[2]] &&
    position_taken?(board, win[0])
   end
end

def full?(board)
  board.all?{|i| i == "X" || i == "O"}
end

def draw?(board)
  !won?(board) ||  full?(board) &&
  !won?(board) || !full?(board) &&
  won?(board) && full?(board)
end

def over?(board)
  won?(board) || full?(board)
end

def winner(board)
  if winning_combo = won?(board)
    board[winning_combo.first]
  end
 end





