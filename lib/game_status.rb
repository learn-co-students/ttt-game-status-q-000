# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
  # ETC, an array for each win combination
]

def won?(board)
  if (board.all? { |e| (e == " " || e == "")})
    false
  else
    WIN_COMBINATIONS.detect do |win_combination|
      win_combination.all? { |e| (board[e] == "X") } || win_combination.all? { |e| (board[e] == "O") }
    end
  end
end

def full?(board)
  board.all? { |e| (e == "X" || e == "O") }
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  won?(board) || draw?(board) || full?(board)
end

def winner(board)
  if won?(board)
    board[won?(board)[1]]
  else
    nil
  end
  
end