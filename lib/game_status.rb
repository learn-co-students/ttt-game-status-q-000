# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
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
  #board.all? {|i| i == "X"} || == "O"}
  !board.any? {|i| i == " "}
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
#true if won, draw or full.
def over?(board)
  if won?(board) || draw?(board) || full?(board)
    return true
  end
end

def winner(board)
  if won?(board)
    won?(board).each do |each|
      return board[each]
    end
  end
end
