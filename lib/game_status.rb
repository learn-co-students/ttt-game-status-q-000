require 'pry'

def position_taken?(board, location)
  !(board[location] == " ")
end

WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[6,4,2],[0,4,8],]

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
 
def draw?(board)
  full?(board) && !(won?(board))
end

def over?(board)
  won?(board) || full?(board)
end

def winner(board)
  if won?(board)
    board[won?(board).first]
  end
end
