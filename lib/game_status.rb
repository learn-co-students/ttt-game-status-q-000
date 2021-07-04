# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8],  # Bottom row
  [0,4,8],  # Top left diagonal
  [2,4,6],  # Top right diagonal
  [0,3,6],  # first column
  [1,4,7],  # middle column
  [2,5,8]  # last column
  ]


def won?(board)
  WIN_COMBINATIONS.detect do |line|
    line.all?{|i| board[i] == "X" } || line.all?{|i| board[i] == "O"}
  end
end

def full?(board)
  board.all?{|position| position == "X" || position == "O"}
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) || draw?(board)
  end

def winner(board)
  if won?(board)
  line = won?(board)
  board[line[0]]
  end
end
















