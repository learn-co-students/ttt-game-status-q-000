# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end
 WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]]

def won?(board)
  clear = board.all? do |x|
    x == " "
  end
    if clear == true
      return false
    end


  counter = 0

  WIN_COMBINATIONS.each do |win_combinations|

    win_index_1 = win_combinations[0]
    win_index_2 = win_combinations[1]
    win_index_3 = win_combinations[2]
    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]
    counter += 1
    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combinations
      break# return the win_combination indexes that won.
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combinations
      break
    else
      nil
    end
  end

  if counter == 9
    return false
  end
end

def full?(board)
  if board.include?(" ")
    return false
  else
    return true
  end
end

def draw?(board)
  if won?(board)
    return false
  elsif full?(board) == false && won?(board) != true
    return false
  else
    return true

  end
end

def over?(board)
  if draw?(board)
    return true
  elsif won?(board)
    return true
  else
    return false

  end
end

def winner(board)
  var = won?(board)
  if won?(board)
    if board[var[0]] == "X"
      return "X"
    elsif board[var[0]] == "O"
      return "O"
    else
      nil
    end
  end
end


