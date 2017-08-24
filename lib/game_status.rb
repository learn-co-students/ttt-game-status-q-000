WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def won?(board)
  WIN_COMBINATIONS.detect do |win_combinations|
    board[win_combinations[0]] == board[win_combinations[1]] &&
    board[win_combinations[1]] == board[win_combinations[2]] &&   
    position_taken?(board, win_combinations[0]) 
  end
end

def full?(board)
  board.all?{|move| move == "X" || move == "O"}
end

def draw?(board)
  if won?(board)
    false
  elsif full?(board) == true && won?(board) == true
    true
  else
    true
  end
end

def over?(board)
  won?(board) || full?(board)
end

def winner(board)
  win_combinations = won?(board)
  if win_combinations=== nil
    return nil
  elsif board[win_combinations[0]] == "X"
    return "X"
  else board[win_combinations[0]] == "O"
    return "O"
  end
end


