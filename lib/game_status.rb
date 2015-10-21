# Helper Method
def position_taken?(board, location)
  #returns false (pos empty) if either inner statement eval true
  #returns true (pos taken) if either inner statement eval false
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  #each array below is referred to as a win_combo
  [0, 1, 2], #top row
  [3, 4, 5], #middle row
  [6, 7, 8], #bottom row
  [0, 3, 6], #left col
  [1, 4, 7], #middle col
  [2, 5, 8], #right col
  [0, 4, 8], #left-right diag
  [2, 4, 6], #right-left diag
]

def won?(board)
  #detect first win_combo in WIN_COMBINATIONS that
  WIN_COMBINATIONS.detect do |win_combo|
    #contains all Xs on the board OR
    win_combo.all?{|marker| board[marker] == "X"} || 
    #contains all Os on the board
    win_combo.all?{|marker| board[marker] == "O"}
  end
  #detect returns 1st element that evaluates true
  #if none, returns nil
end

def full?(board)
  #full? returns true if all board locations are taken by Xs or Os
  board.all?{|location| location == "X" || location == "O"}
end

def draw?(board)
  #if won? is true or full? is false, return false
  if won?(board) || !full?(board)
    return false
  #if full? is true, return true
  elsif full?(board)
    return true
  end
end

def over?(board)
  #if won? is true or full? is true, return true
  if won?(board) || full?(board)
    return true
  #else return false
  else
    return false
  end
end

def winner(board)
  if won?(board)
    won_array_first_item = won?(board)[0]
    board[won_array_first_item]
  else
    return nil
  end
end












