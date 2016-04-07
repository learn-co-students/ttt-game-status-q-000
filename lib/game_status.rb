# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]

def won?(board)
  if empty?(board)
    return false
  end

  WIN_COMBINATIONS.each do |combination|
    win_index_1 = combination[0]
    win_index_2 = combination[1]
    win_index_3 = combination[2]

    position1 = board[win_index_1]
    position2 = board[win_index_2]
    position3 = board[win_index_3]

    if position1 == "X" && position2 == "X" && position3 == "X"
      return combination
    elsif position1 == "O" && position2 == "O" && position3 == "O"
      return combination
    else
     false
    end
  end

  return false
end

def full?(board)
  !(board.include?("") || board.include?(" "))
end

def draw?(board)
  if !won?(board) && full?(board)
    true
  else
    false
  end

end

def over?(board)
  if draw?(board)
    return true
  elsif won?(board)
    return true
  else
    false
  end
end

def empty?(board)
  all_empty = board.all? do |position|
    position == "" || position == " "
  end
  all_empty
end

def winner(board)
  if won?(board)
    return board[won?(board)[0]]
  else
    nil
  end
end
