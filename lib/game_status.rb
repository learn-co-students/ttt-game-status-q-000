# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom row
  [0,3,6], # Left column
  [1,4,7], # Middle column
  [2,5,8], # Right column
  [0,4,8], # Diagonal top left to bottom right
  [2,4,6]  # Diagonal bottom left to top right
]

def won?(board)
  WIN_COMBINATIONS.each do |combination|
    first_position_to_check = combination[0]
    second_position_to_check = combination[1]
    third_position_to_check = combination[2]

    position_1 = board[first_position_to_check]
    position_2 = board[second_position_to_check]
    position_3 = board[third_position_to_check]

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return combination # return the win_combination indexes that won.
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return combination # return the win_combination indexes that won.
    end
  end
  return false
end

def full?(board)
  board.each do |index|
    if index == "" || index == " "
      return false
    end
  end
  return true
end

def draw?(board)
  if won?(board) == false && full?(board) == true
    return true
  else
    return false
  end
end

def over?(board)
  if won?(board) == true || draw?(board) == true || full?(board) == true
    return true
  else
    return false
  end
end


def winner(board)
  if won?(board) == false
    return nil
  else
    winning_combination = won?(board)
    if board[winning_combination[0]] == "X"
      return "X"
    elsif board[winning_combination[0]] == "O"
      return "O"
    end
  end
end
