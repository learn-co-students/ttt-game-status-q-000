# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

board = [" ", " ", " ", " ", " ", " ", " ", " ", " ",]
# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS =
[
[0, 1, 2], # Top row
[3, 4 ,5], # Middle row
[6, 7, 8], # Bottom Row
[0, 3, 6], # Left column win
[1, 4, 7], # Middle column win
[2, 5, 8], # Right column win
[0, 4, 8], # Left diagonal win
[2, 4, 6], # Right diagonal win
 ]

def won?(board)
  WIN_COMBINATIONS.detect do |ttt|
    board[ttt[0]] == board[ttt[1]] && board[ttt[1]] == board[ttt[2]] &&
    position_taken?(board, ttt[0])
    end
  end

def full?(board)
  board.all? { |token| token == "X" || token == "O"}
end

def draw?(board)
  return false if full?(board) == false
  return false if won?(board).class == Array
  return true if won?(board) == false && full?(board) == true
else
  false
end

def over?(board)
  return false if full?(board) == false
  won?(board) || full?(board) || draw?(board)
end

def winner(board)
  return board[won?(board).first] if won?(board).class == Array
end