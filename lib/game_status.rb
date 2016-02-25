# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end
WIN_COMBINATIONS = [
[0, 1, 2],
[3, 4, 5],
[6, 7, 8],
[0, 3, 6],
[1, 4, 7],
[2, 5, 8],
[0, 4, 8],
[2, 4, 6]
]

def won?(board)
WIN_COMBINATIONS.detect do |win_type|
position_taken?(board, win_type[0])
board[win_type[0]] == board[win_type[1]]
board[win_type[1]] == board[win_type[2]]
end
end

def full?(board)
  board.none?{|full_board| full_board==" "}
end

def draw?(board)
  if full?(board) == true && won?(board) == nil
    return true
  else
    return false
  end
end

def over?(board)
  if full?(board) == true || won?(board) == true || draw?(board) == true
     return true
  else
     return false
  end
end

def winner(board)
  if won?(board) == nil
    return nil
  else
    return board[won?(board)[0]]
  end
end



