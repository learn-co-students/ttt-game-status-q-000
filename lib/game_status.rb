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

#won? method
def won?(board)

  WIN_COMBINATIONS.each do |combo|
    win_index_1 = combo[0]
    win_index_2 = combo[1]
    win_index_3 = combo[2]

    position_1 = board[win_index_1] # load the value of the board at win_index_1
    position_2 = board[win_index_2] # load the value of the board at win_index_2
    position_3 = board[win_index_3] # load the value of the board at win_index_3

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return combo
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return combo
    end
  end
  return false
end

#full? method
def full?(board)

  board.all? do |move|
    move == "X" || move == "O"
  end
end

#draw? method
def draw?(board)
  if !won?(board) && full?(board)
    return true
  elsif !won?(board) && !full?(board)
    return false
  elsif won?(board)
    return false
  end
end

#over? method
def over?(board)
  if won?(board) || draw?(board) || full?(board)
    return true
  else
    return false
  end
end

#winner method
def winner(board)

  array = won?(board)

  if won?(board) != false
    if board[array[0]] == "X"
      return "X"
    elsif board[array[0]] == "O"
      return "O"
    end
  elsif draw?(board)
    return nil
  end
end
