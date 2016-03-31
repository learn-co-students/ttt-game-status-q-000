# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
[0,1,2], #top row
[3,4,5], #middle row
[6,7,8], # bottom row
[0,3,6], #first column
[1,4,7], #second column
[2,5,8], #third column
[0,4,8], #first diagonal
[2,4,6], #second diagonal
]

def won?(board)
 WIN_COMBINATIONS.detect do |wins|
    board[wins[0]] == board[wins[1]] &&
    board[wins[1]] == board[wins[2]] &&
    position_taken?(board, wins[0])
  end
end

def full?(board)
  board.all? {|p| position_taken?(board, p.to_i + 1)} ? true : false
end

def draw?(board)
  !won?(board) && full?(board) ?  true : false
end

def over?(board)
  won?(board) || full?(board) || draw?(board) ? true : false
end

def winner(board)
  if winning_combo = won?(board)
    board[winning_combo.first]
  end
end
    
