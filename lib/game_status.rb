# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

def empty?(board)
  empty = board.all? do |cell|
    cell == " "
  end
  return empty
end

def full?(board)
  full = board.none? do |cell|
    cell == " "
  end
  return full
end

def draw?(board)
  if full?(board) == true
    if won?(board) != false
      return false
    else
      return true
    end
  end
end

def over?(board)
  if draw?(board) == true
    return true
  elsif won?(board) != false
    return true
  end
end

def winner(board)
  winning_combo = won?(board)
  if winning_combo == false
    return nil
  end
  winning_index = winning_combo[0]
  if board[winning_index] == "X"
    return "X"
  elsif board[winning_index] == "O"
    return "O"
  end
end


# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]
]

def won?(board)
  if empty?(board) == true
    return false
  else
    WIN_COMBINATIONS.each do |win_combination|
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
end

