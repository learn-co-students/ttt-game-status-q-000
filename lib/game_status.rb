# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

def full?(board)
  board.each do |board_position|
    if board_position == " "
      return false
  end
  end
end

#board = ["X", "O", "X", "O", "X", "X", "O", "X", "O"]
def draw?(board)
  if !won?(board) && full?(board)
    return true
  else
    return false
 end
end



WIN_COMBINATIONS =[ [0,1,2], [3,4,5], [6,7,8], [0,4,8], [1,4,7], [0,3,6], [2,5,8], [6,4,2] ]
def won?(board)
 WIN_COMBINATIONS.each do |combos|
   if board[combos[0]] == " " && board[combos[1]] == " " && board[combos[2]] == " "
  false
     elsif board[combos[0]] == board[combos[1]] && board[combos[0]] == board[combos[2]]
       return combos
     end
   end
  false
end

  def over?(board)
  if won?(board) || full?(board)
  return true
  else
  return false

  end
  end

 def winner(board)
  if winning_combo = won?(board)
    board[winning_combo]
  end
end



