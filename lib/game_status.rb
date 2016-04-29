# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom row
  [0,3,6],
  [0,4,8],
  [1,4,7],
  [2,5,8],
  [2,4,6]
]

def won?(board)
  WIN_COMBINATIONS.detect { |arr|
    unless arr.class == "Array"
      false
    end

     ((board[arr[0]] == "X" && board[arr[1]] == "X" && board[arr[2]] == "X") ||
     (board[arr[0]] == "O" && board[arr[1]] == "O" && board[arr[2]] == "O")) ?
     true : false
  }
end

def full?(board)
  board.all? { |e| e == "X" || e == "O" }
end

def draw?(board)
  if !won?(board) && full?(board)
    return true
  elsif (!won?(board) && !full?(board)) || won?(board)
    return false
  end
end

def over?(board)
  won?(board) || draw?(board) || full?(board)
end

def winner(board)
  arr = won?(board)
  arr ? board[arr[0]] : nil
end
