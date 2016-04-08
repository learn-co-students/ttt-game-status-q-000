# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant
 WIN_COMBINATIONS = [
    [0,1,2], 
    [3,4,5], 
    [6,7,8], 
    [0,4,8], 
    [6,4,2], 
    [0,3,6], 
    [1,4,7], 
    [2,5,8]  
  ]


def won?(board)
  WIN_COMBINATIONS.detect do |winning_set|
    board[winning_set[0]] == board[winning_set[1]] &&
    board[winning_set[1]] == board[winning_set[2]] &&
    position_taken?(board,winning_set[0])
  end
end

def full?(board)
  board.all? {|loc| loc == "X" || loc == "O"}
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  won?(board) || draw?(board) || full?(board)
end

def winner(board)
  if winning_set = won?(board)
    board[winning_set[0]]
  end
end