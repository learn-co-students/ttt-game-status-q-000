

# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

WIN_COMBINATIONS = [
  [0,1,2], [3,4,5], [6,7,8], [0,3,6],
  [1,4,7], [2,5,8], [0,4,8], [6,4,2]
]

def won?(board)
  WIN_COMBINATIONS.each do |single_win|
    win_index_1 = single_win[0]
    win_index_2 = single_win[1]
    win_index_3 = single_win[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

    if position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 == "O"
      return single_win
    else false
    end
  end
  return false
end

def full?(board)
  if board.any?{|spot| spot == " " || spot == nil}
    return false
  else
    true
  end
end

def draw?(board)
  if full?(board) == true && won?(board) == false
    return true
  else
    return false
  end
end

def over?(board)
  if won?(board) == true || full?(board) == true
    return true
  else
    false
  end
end

def winner(board)
  WIN_COMBINATIONS.each do |single_win|
    win_index_1 = single_win[0]
    win_index_2 = single_win[1]
    win_index_3 = single_win[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return "X"
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return "O"
    elsif won?(board) == false
      return nil
    end
  end
end