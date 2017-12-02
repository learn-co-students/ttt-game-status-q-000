# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
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
  WIN_COMBINATIONS.detect do |x|
    x.all? { |i| board[i] == "X" } || x.all? { |i| board[i] == "O" }
  end
end

def full?(board)
  board.all? {|x| x == "X" || x == "O"}
end

def draw?(board)
  !won?(board)
end

def over?(board)
  if full?(board)
    won?(board) || draw?(board)
  end
end

def winner(board)
  winner = won?(board)
  if winner != nil
    board[winner[0]]
  end
end
