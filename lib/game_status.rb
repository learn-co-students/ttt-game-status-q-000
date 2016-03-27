WIN_COMBINATIONS = [
  [0,1,2], 
  [3,4,5], 
  [6,7,8],
  [0,3,6], 
  [1,4,7], 
  [2,5,8], 
  [0,4,8], 
  [6,4,2]
]

def won?(board)
  WIN_COMBINATIONS.each do |combo_set|
    if board[combo_set[0]] == "X" && board[combo_set[1]] == "X" && board[combo_set[2]] == "X"
      return combo_set
    elsif board[combo_set[0]] == "O" && board[combo_set[1]] == "O" && board[combo_set[2]] == "O"
      return combo_set
    end
  end
  false
end

def full?(board)
  board.none?{|board_space| board_space == " " }
end

def draw?(board)
  if won?(board) == false && full?(board)
    true
  elsif won?(board) == false && full?(board) == false
    false
  elsif won?(board) != false
    false
  end
end

def over?(board)
  if won?(board) != false || full?(board) == true
    true
  else
    false
  end
end

def winner(board)
  if won?(board) != false
    return board[won?(board)[0]]
  end
end