# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
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
  WIN_COMBINATIONS.each do |win_combos|
    position_1 = win_combos[0]
    position_2 = win_combos[1]
    position_3 = win_combos[2]
  if board[position_1] == "X" && board[position_2] == "X" && board[position_3] == "X"
    return [position_1, position_2, position_3]
  elsif board[position_1] == "O" && board[position_2] == "O" && board[position_3] == "O"
    return [position_1, position_2, position_3]
  end
  end
  return false
end

def full?(board)
  board.each do |space|
    if space == " "
      return false
    end
  end
    return true
end

def draw?(board)
  if won?(board)
    return false
  elsif !won?(board) && full?(board)
    return true
  end
end 

def over?(board)
  if full?(board) || draw?(board) || won?(board)
    return true
  else 
    return false
  end
end

def winner(board)
  if won?(board)
    letter = won?(board)[0]
    return board[letter]
  else
    return nil
  end

end












