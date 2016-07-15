# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]
]

def won?(board)
  WIN_COMBINATIONS.detect do |win_combination|
    index_one = win_combination[0]
    index_two = win_combination[1]
    index_three = win_combination[2]

    position_one = board[index_one]
    position_two = board[index_two]
    position_three = board[index_three]

    (position_one == "X" && position_two == "X" && position_three == "X") ||
      (position_one == "O" && position_two == "O" && position_three == "O")
  end
end

def full?(board)
  board.all? do |position|
    position == "X" || position == "O"
  end
end

def draw?(board)
  if !full?(board)
    return false
  elsif won?(board)
    return false
  else
    return true
  end
end

def over?(board)
  if draw?(board) || won?(board)
    return true
  else
    return false
  end
end

def winner(board)
  if !won?(board) || draw?(board)
    return nil
  else
    winning_board = won?(board)
    win_index = winning_board[0]
    return board[win_index]
  end
end
