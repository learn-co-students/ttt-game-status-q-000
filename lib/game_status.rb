# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8],
  [0,4,8],
  [2,4,6],
  [0,3,6],
  [1,4,7],
  [2,5,8] # ETC, an array for each win combination
]

def won?(board)
  WIN_COMBINATIONS.detect do |element|
    board[element[0]] == board[element[1]] &&
      board[element[1]] == board[element[2]] &&
      position_taken?(board, element[0])
  end
end

def full?(board)
  board.all?{|token| token == "X" || token == "O"}

end

def draw?(board)
  if !won?(board) && full?(board)
    true
  else
    false
  end
end

def over?(board)
if draw?(board) || won?(board) || full?(board)
  true
else
  false
end
end

def winner(board)
  if winning_combo = won?(board)
      board[winning_combo.first]
end
end
