# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS = [
  [0,1,2], #top row
  [3,4,5], #middle row
  [6,7,8], #bottom row
  [0,3,6], #left side
  [2,5,8], #right side
  [0,4,8], #first diagonal
  [2,4,6], #second diagonal
  [1,4,7]  #down the middle
 ]

def won?(board)
  WIN_COMBINATIONS.detect do |win_combination| #detect will return only the values in the array that allow the condition stated to return true
    position_1 = board[win_combination[0]] #sets position_1 to the first position in the current winning array being iterated
    position_2 = board[win_combination[1]] #sets position_2 to the second position in the current winning array being iterated
    position_3 = board[win_combination[2]] #sets position_3 to the third position in the current winning array being iterated

    (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O") #stated condition we are testing
  end
end

def full?(board)
  board.none? do |i| #checking to make sure none of the spots on the board are empty
    i == " "
  end
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) || full?(board) || draw?(board)
end

def winner(board)
  if won?(board)
    position = board[won?(board)[0]]
    return position
  else
    nil
  end
end

