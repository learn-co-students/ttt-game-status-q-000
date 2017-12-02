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
  WIN_COMBINATIONS.detect do |win|
  if position_taken?(board, win[0]) && position_taken?(board, win[1]) && position_taken?(board, win[2]) && board[win[0]] == board[win[1]] && board[win[0]] == board[win[2]]
    [win[0],win[1], win[2]]
  end
end
end

def full?(board)
  board.all? do |board|
    board == "X" || board == "O"
  end
end

def draw?(board)
  if full?(board) && !won?(board)
    true
  end
end

def over?(board)
  if won?(board) || draw?(board)
    true
  end
end

def winner(board)
  if won?(board)
   board[won?(board)[0]] 
  end
end