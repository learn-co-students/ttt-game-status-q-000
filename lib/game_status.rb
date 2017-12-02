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
 WIN_COMBINATIONS.detect do |combo|
   combo.all? {|location| board[location] == "X" } || combo.all? {|location| board[location] == "O" }
 end
end

def full?(board)
  if board.any? {|location| location == " "}
    false
  else
    true
  end
end

def draw?(board)
  if won?(board) == nil && full?(board) == true
    return true
  end
end

def over?(board)
  if won?(board) == true || draw?(board) == true || full?(board) == true
      return true
  else false
   end
end

def winner(board)
  if won?(board)
  return board[won?(board)[0]]
  else
    return nil
  end
end

