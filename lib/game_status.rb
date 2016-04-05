# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

def three_in_a_row?(board, combo, mark)
  combo.each do |position|
    if board[position] != mark
      return false
    end
  end
  return combo
end

def board_empty?(board)
  board.each do |position|
    if position == "X" || position == "O"
      return false
    end
  end
  return true
end

def full?(board)
  board.each do |position|
    if position != "X" && position != "O"
      return false
    end
  end
  return true
end

def won?(board)
  if board_empty?(board)
    return false
  end
  PLAYERS.each do |mark|
    WIN_COMBINATIONS.each do |combo|
      if three_in_a_row?(board, combo, mark)
        return combo
      end
    end
  end
  return false
end

def draw?(board)
  if full?(board)
    if !won?(board)
      return true
    end
  end
  return false
end

def over?(board)
  if won?(board) || draw?(board)
    return true
  end
  return false
end

def winner(board)
  if won?(board)
    return board[won?(board)[0]]
  else
    return nil
  end
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
  [6,4,2]
]

PLAYERS = ["X", "O"]
