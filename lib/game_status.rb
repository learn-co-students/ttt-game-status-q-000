# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS =
  [
  [0,1,2], #top row
  [3,4,5], #mid row
  [6,7,8], #bottom row
  [0,4,8], #right diag
  [2,4,6], #left diag
  [0,3,6], #left column
  [1,4,7], #mid column
  [2,5,8] #right col
  ]

# return true for win false no.

def won?(board)
  WIN_COMBINATIONS.detect do |win1|
    win1.all? { |number| board[number] == "X"} || win1.all? { |number| board[number] == "O"}
    end
  end

def full?(board)
  board.all? {|i| board == "X"} || board.all? {|i| board == "O"}
end
#true if board not won & full,
#false if board not won and not full
#false if board is won
def draw?(board)
  if !won?(board) && full?(board)
    return true
  else
    return false
  end
end
