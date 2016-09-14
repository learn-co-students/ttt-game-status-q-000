# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    win_combination
  win_index_1 = win_combination[0]
  win_index_2 = win_combination[1]
  win_index_3 = win_combination[2]
  position_1 = board[win_index_1]
  position_2 = board[win_index_2]
  position_3 = board[win_index_3]
  if position_1 == "X" && position_2 == "X" && position_3 == "X"
    return win_combination
  elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
    return win_combination
  end
end
return false
end

def full?(board)
board.all? do |pos|
  if pos == "X" || pos == "O"
    true
  else
    return false
end
end
end

def draw?(board)
  if full?(board) == true && won?(board) == false
    true
  else
    false
  end
end

def over?(board)
  if won?(board) != false
    true
  elsif draw?(board) == true
    true
  else
    false
  end
end

def winner(board)
x = won?(board)
if x
  index = x[0]
  position = board[index]
  index1 = x[1]
  position1 = board[index1]
  index2 = x[2]
  position2 = board[index2]
  if position == "X" && position1 == "X" && position2 == "X"
    return "X"
  elsif position == "O" && position1 == "O" && position2 == "O"
    return "O"
  end
else
end
end
