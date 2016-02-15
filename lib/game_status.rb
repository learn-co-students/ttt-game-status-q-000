# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,4,8],
  [2,4,6],
  [0,3,6],
  [1,4,7],
  [2,5,8]
]

def won?(board)
  WIN_COMBINATIONS.detect do |combo|
    combo.all? { |pos| position_taken?(board, pos) } && board[combo[0]] == board[combo[1]] && board[combo[1]] == board[combo[2]]
  end
end

def full?(board)
  board.all? { |pos| !(pos.nil? || pos == " ") }
end

def draw?(board)
  !won?(board) && full?(board) 
end

def over?(board)
  won?(board) || draw?(board)
end

def winner(board)
  board[won?(board)[0]] if won?(board)
end