# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2], [3, 4, 5], [6, 7, 8],
  [0, 3, 6], [1, 4, 7], [2, 5, 8],
  [0, 4, 8], [2, 4, 6]
  ]

def won?(board)
  WIN_COMBINATIONS.detect do |win_combination|
    win_combination.all? {|i| board[i] == "X"} ||  win = win_combination.all? {|i| board[i] == "O"}
  end
end

def full?(board)
  board.all? {|i| i != " "}
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  won?(board) || full?(board)
end

def winner(board)
  if won?(board)
    board[won?(board)[0]]
  end
end