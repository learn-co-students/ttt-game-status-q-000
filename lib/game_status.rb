# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS =[
  [0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]
  ]

board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

def won?(board)
  WIN_COMBINATIONS.detect do |winner|
    board[winner[0]] == board[winner[1]] &&
    board[winner[1]] == board[winner[2]] &&
    position_taken?(board, winner[0])
  end
end

def draw?(board)
  !won?(board) && board.all? { |player| player == "X" || player == "O" }
end

def full?(board)
  board.all? {|player| player == "X" || player == "O"}
end

def over?(board)
  won?(board) || draw?(board) || full?(board)
end

def winner(board)
  if winner = won?(board)
    board[winner.first]
  end
end