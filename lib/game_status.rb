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
  WIN_COMBINATIONS.each do |wc|
    i1 = wc[0]
    i2 = wc[1]
    i3 = wc[2]
    if board[i1] == "X" && board[i2] == "X" && board[i3] == "X" 
      return wc
    elsif board[i1] == "O" && board[i2] == "O" && board[i3] == "O" 
      return wc
    end
  end
  return false
end

def full?(board)
    board.all?{|e| e == "X" || e == "O"}
end

def draw?(board)
    full?(board) && !won?(board)
end

def over?(board)
  draw?(board) || won?(board)
end

def winner(board)
  if arr = won?(board)
    return board[arr[0]]
  end
end