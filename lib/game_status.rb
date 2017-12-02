# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
  [0,3,6],
  [0,4,8],
  [1,4,7],
  [2,5,8],
  [2,4,6],
  [3,4,5],
  [6,7,8]
]

def won?(board)
  WIN_COMBINATIONS.find do |i|
    i.all? { |j| board[j] == "X" } || i.all? { |j| board[j] == "O" }
  end
end

def full?(board)
  board.all? { |i| i == "X" || i == "O" }
end

def draw?(board)
  won?(board) ? false : true
end

def over?(board)
  full?(board) ? true : false
end

def winner(board)
  board[won?(board)[0]] if won?(board)
end