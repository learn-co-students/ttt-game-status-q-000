# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0,1,2],[0,3,6],[0,4,8],[1,4,7],[2,4,6],[2,5,8],[3,4,5],[6,7,8]]

def won?(board)
  WIN_COMBINATIONS.each do |index|
    win_index_1 = index[0]
    win_index_2 = index[1]
    win_index_3 = index[2]
    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]
    if position_taken?(board, win_index_1)
      if position_1 == position_2 && position_2 == position_3
        return [win_index_1,win_index_2,win_index_3]
      end
    end
  end
  return false
  end

def full?(board)
  counter = 0
  board.each do |index|
    if index == "X" || index == "O"
      counter += 1
    end
    if counter >= 8
      return true
    end
  end
  return false
end

def draw?(board)
  if !won?(board) && full?(board)
    return true
  else return false
  end
end

def over?(board)
  if draw?(board) || won?(board) || full?(board)
    return true
  else return false
  end
end

def winner(board)
  if won?(board)
    won_positions = won?(board)
    return "#{board[won_positions[0]]}"
  end
end
