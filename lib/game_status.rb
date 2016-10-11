# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

def won?(board)
  WIN_COMBINATIONS.detect {|win_combination| (board[win_combination[0]]=="X" && board[win_combination[1]]=="X" && board[win_combination[2]]=="X")||(board[win_combination[0]]=="O" && board[win_combination[1]]=="O" && board[win_combination[2]]=="O")}
end

def full?(board)
  return !(board.detect {|i| i==" "||i.nil?})
end

def draw?(board)
  !won?(board)&&full?(board)
end

def over?(board)
  won?(board)||full?(board)||draw?(board)
end

def winner(board)
  wincombo = won?(board)
  if wincombo
    return board[wincombo[0]]
  else
    return wincombo
  end

end
