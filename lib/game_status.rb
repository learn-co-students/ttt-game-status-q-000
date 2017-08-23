# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # top win
  [3,4,5], # middle win
  [6,7,8], # bottom win
  [0,3,6], # left win
  [1,4,7], # center win
  [2,5,8], # right win
  [0,4,8], # left diagonal win
  [2,4,6]  # right diagonal win
  ]

def won?(board)
  counter = 0
  winning_combo = false
  WIN_COMBINATIONS.each do |win_combination|
    counter += 1

    win_index1 = win_combination[0]
    win_index2 = win_combination[1]
    win_index3 = win_combination[2]

    position1 = board[win_index1]
    position2 = board[win_index2]
    position3 = board[win_index3]

   if (position1 == "X" && position2 == "X" && position3 == "X") ||
        (position1 == "O" && position2 == "O" && position3 == "O")
      winning_combo = win_combination
    end
  end

  return winning_combo

end

def full?(board)
  all_full = board.all? do |character|
    character == "X" || character == "O"
  end
end

def draw?(board)
  # returns true if the board has not been won and is full
  # return false if the board is not won and the board is not full
  # return false if the board is won

  if !won?(board) && full?(board)
    true
  elsif !won?(board) && !full?(board)
    false
  elsif won?(board)
    false
  end
end

def over?(board)
  # returns true if the board has been won, is a draw, or is full
  if won?(board) || draw?(board) || full?(board)
    true
  end
end

def winner(board)
  winning_number = won?(board)

  if !winning_number
    nil
  else
    board[winning_number[0]]
  end

end