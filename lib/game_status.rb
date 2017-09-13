WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6],
]

def won?(board)
  win_combo = false
  WIN_COMBINATIONS.each do |arr|
    position_1 = arr[0]
    position_2 = arr[1]
    position_3 = arr[2]

    wpos1 = board[position_1]
    wpos2 = board[position_2]
    wpos3 = board[position_3]
    if (wpos1 == "X" && wpos2 == "X" && wpos3 == "X") || (wpos1 == "O" && wpos2 == "O" && wpos3 == "O")
      win_combo = arr
    end
  end
  return win_combo
end

def full?(board)
  if board.all? { |e| e == "X" || e == "O" }
    return true
  end
end
# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  if (won?(board) || full?(board) || draw?(board))
    return true
  else
    return false
  end
end

def winner(board)
  if !won?(board)
  return nil
elsif won?(board)
    arr = won?(board)
    pos = arr[1]
    return board[pos]
 end

end
