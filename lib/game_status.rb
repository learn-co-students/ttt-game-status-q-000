# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end
board = ["X", "O", "X", "O", "X", "O", "O", "O", "X"]
WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]

def won?(board)
  WIN_COMBINATIONS.detect do |combo|
 board[combo[0]] == board[combo[1]] &&
 board[combo[1]] == board[combo[2]] &&
 position_taken?(board, combo[0])
  end
end

def full?(board)
  board.none?  {|full_board| full_board == " "} && won?(board) != true
end

def draw?(board)
  if won?(board)
    return false
  else full?(board)
end
end

def over?(board)
  full?(board)
end

def winner(board)
  if won?(board)
  board[won?(board)[0]]
  else nil
  end
end