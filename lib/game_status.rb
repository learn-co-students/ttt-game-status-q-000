board = [" "," "," "," "," "," "," "," "," "]

def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

WIN_COMBINATIONS = [
  [0, 1, 2], #top row win
  [3, 4, 5], #middle row win
  [6, 7, 8], #bottom row win
  [0, 3, 6], #left column win
  [1, 4, 7], #middle column win
  [2, 5, 8], #right column win
  [0, 4, 8], #vertical negative win
  [2, 4, 6] #vertical positive win
    ]


def won?(board)

  winning_combination = nil

 WIN_COMBINATIONS.each do |combo|
    first_position = board[combo[0]]
    second_position = board[combo[1]]
    third_position = board[combo[2]]

    if first_position == "X" && second_position == "X" && third_position == "X"
      winning_combination = combo
    elsif first_position == "O" && second_position == "O" && third_position == "O"
      winning_combination = combo
    end
  end

  # Then no matter what we return winning_combination
  # it'll either still be nil if no one has won
  # or it will be the winning_combo we set in the middle
  return winning_combination
end

def full?(board)
  board.all? { |x| x == "X" || x == "O" ? true : false}
end

def draw?(board)
  if
    (0..8).include?("")
    return false
  elsif !(0..8).include?("") && !won?(board)
    return true
  else
    false
end
end

def over?(board)
  if board.all? { |x| x == "X" || x == "O" ? true : false} || won?(board)
    return true
  else
    false
  end
end
    

def winner(board)

  winning_combination = nil

 WIN_COMBINATIONS.each do |combo|
    first_position = board[combo[0]]
    second_position = board[combo[1]]
    third_position = board[combo[2]]

    if first_position == "X" && second_position == "X" && third_position == "X"
      winning_combination = "X"
    elsif first_position == "O" && second_position == "O" && third_position == "O"
      winning_combination = "O"
    end
  end

  # Then no matter what we return winning_combination
  # it'll either still be nil if no one has won
  # or it will be the winning_combo we set in the middle
  return winning_combination
end








