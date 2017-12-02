
# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end
board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

 WIN_COMBINATIONS = [
  [0,1,2], # top row
  [3,4,5], # mid row
  [6,7,8], # bot row
  [0,3,6], # left col
  [1,4,7], # mid col
  [2,5,8], # right col
  [0,4,8], # diag to right
  [6,4,2]  # diag to left
  ]




def won?(board)
  WIN_COMBINATIONS.detect do |combo|
    board[combo[0]] == board[combo[1]] &&
    board[combo[1]] == board[combo[2]] &&
    position_taken?(board, combo[0])
  end
end

def full?(board)
  board.all? do |space|
    space == "X" || space == "O"
  end
end

def draw?(board)
full?(board) && !won?(board)
end

def over?(board)
draw?(board) || won?(board)
end

def winner(board)
  if winning_combo = won?(board)
   board[winning_combo[0]]
  end
end