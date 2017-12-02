# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def won?(board)
  win = WIN_COMBINATIONS.detect{|i| board[i[0]] + board[i[1]] + board[i[2]] == "XXX" || board[i[0]] + board[i[1]] + board[i[2]] == "OOO"}
  if !win
    return false
  else
    win
  end
end

def full?(board)
  board.all?{|i| i == "X" || i == "O"}
end

def draw?(board)
  if !won?(board) && full?(board)
    true
  end
end

def over?(board)
  return draw?(board) || won?(board)
end

def winner(board)
  if !won?(board)
    nil
  else board[won?(board)[0]]
  end
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6],
]