# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
[0,1,2], 
[3,4,5],
[6,7,8],
[0,3,6],
[1,4,7],
[2,5,8],
[0,4,8],
[2,4,6]

]

def won?(board)
  WIN_COMBINATIONS.detect do |winner|
    winner.all? {|token| board[token] == "X"} || winner.all?{|token| board[token] == "O"}
   end
end

def full?(board)
  board.all?{|token| token == "X" || token == "O"} 
end

def draw?(board)
  if !won?(board) && full?(board)
    return true
  else
    return false
  end
end

def over?(board)
  if won?(board) || full?(board) || draw?(board)
  return true
  end
end

def winner(board)
  if the_index_win = won?(board)
    board[the_index_win.first]  
  end
end
