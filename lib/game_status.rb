# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
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
    line.all?{|index| board[index] == "X" } || line.all?{|index| board[index] == "O"}
  end
end

def full?(board)
  board.all?{|index| board[index] == "X" || board[index] == "O"}
end

def draw?(board)
  won?(board) == false && full?(board)
end

def over?(board)
  won?(board) || draw?(board)
  end















