# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
[0,1,2], #top row
[3,4,5], #middle
[6,7,8], #bottom
[0,4,8], #left diagonal
[2,4,6], #right diagonal
[0,3,6], #1st column
[1,4,7], #2nd column
[2,5,8] #3rd column
]

def won?(board)
  WIN_COMBINATIONS.detect do |i|
    board[i[0]] == board[i[1]] && board[i[1]] == board[i[2]] && position_taken?(board, i[0])
  end
end


def full?(board)
  board.all? {|token| token == "X" || token == "O"}
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  if won?(board) || draw?(board) || full?(board)
    true
  else
    false
  end
end

def winner(board)
  if !won?(board)
    return nil
  else
    return board[won?(board)[0]]
  end
end







