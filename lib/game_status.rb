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
    [6,4,2]
  ]
# defined won?
def won?(board)
  WIN_COMBINATIONS.detect do |combination|
    board[combination[0]] == board[combination[1]] && board[combination[1]] == board[combination[2]] &&
    position_taken?(board, combination[0])
  end
end
# defined full?
def full?(board)
  board.all?{|token| token == "X" || token == "O"}
end
# defined draw?
def draw?(board)
  full?(board) && !won?(board)
end
# define over?
def over?(board)
  won?(board) || draw?(board)
end
# define winner
def winner(board)
  if win = won?(board)
    board[win.first]
  else
  end
end
