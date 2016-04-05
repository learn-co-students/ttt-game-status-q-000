# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

WIN_COMBINATIONS = [
[0,1,2],
[3,4,5],
[6,7,8],
[0,3,6],
[1,4,7],
[2,5,8],
[0,4,8],
[2,4,6]
]

def won?(board)
  WIN_COMBINATIONS.each do |win_combo|
    position_1 = board[win_combo[0]]
    position_2 = board[win_combo[1]]
    position_3 = board[win_combo[2]]
    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combo
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combo
    end
  end
  return false
end

def full?(board)
  if board.detect{|i| i == " "} == " "
   return false
  end
  return true
end

def draw?(board)
  if full?(board) == true && won?(board) == false
    return true
  elsif won?(board) == false && full?(board) == false
    return false
  elsif won?(board) != false
    return false
  end
end

def over?(board)
  if won?(board) != false || full?(board) == true || draw?(board) == true
    return true
  else
    return false
  end
end

def winner(board)
  if won?(board) != false
    win_combo = won?(board)
    board[win_combo[0]]
  elsif won?(board) == false 
    return nil
  end
end








