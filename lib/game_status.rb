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
  [2,4,6]]

def won?(board)
  WIN_COMBINATIONS.each do |w|
    x = w.all? {|p| board[p] == "X"}
    o = w.all? {|p| board[p] == "O"}
    return w if(x || o)
  end
  return false
end

def full?(board)
  !board.any? {|p| p == ' '}
end

def draw?(board)
  if(full?(board))
    return !won?(board).kind_of?(Array)
  end
  false
end

def over?(board)
  won?(board) || draw?(board)
end

def winner(board)
  a = won?(board)
  if a.kind_of?(Array)
    return a.all? {|p| board[p] == "X"} ? "X" : "O"
  end
  nil
end