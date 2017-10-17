# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

def won?(board)
  won_status = false
 WIN_COMBINATIONS.each do |win_combination|
   pos_1 = board[win_combination[0]].upcase
   pos_2 = board[win_combination[1]].upcase
   pos_3 = board[win_combination[2]].upcase
   puts pos_1, pos_2, pos_3
   if pos_1 == "X" && pos_2 == "X" && pos_3 == "X"
     return win_combination
   elsif pos_1 == "O" && pos_2 == "O" && pos_3 == "O"
     return win_combination
   else
     won_status = false
   end
 end
 return won_status
end

def full?(board)
  board_full = board.all? do |locaiton|
    locaiton.upcase == "X" || locaiton.upcase == "O"
  end
  board_full
end

def draw?(board)
  if !won?(board) && full?(board)
    return true
  elsif !won?(board) && !full?(board)
    return false
  elsif won?(board)
    return false
  end
end

def over?(board)
  if won?(board) || draw?(board) || full?(board)
    true
  else
    false
  end
end

def winner(board)
  player = nil
  if won?(board)
    win_combination = won?(board)
    player = board[win_combination[0]].upcase
    player
  else
    player = nil
  end
  return player
end
