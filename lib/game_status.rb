# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle Row
  [6,7,8], #Bottom Row
  [0,3,6], #Left Column
  [1,4,7], # Middle Column
  [2,5,8], # Right Column
  [0,4,8], # Diagaonal from top left
  [ 2,4,6], # Diagaonal from top right
  ]

def won?(board)
  WIN_COMBINATIONS.find do |wincomb|
    return wincomb if wincomb.all? do |position| board[position] == "X" end
    return wincomb if wincomb.all? do |position| board[position] == "O" end
  end
end

def full?(board)
  board.all? {|letter| letter != " "}
end

def draw?(board)
  if full?(board) == true && won?(board) == false
    return true
  else
    return false
  end
end
