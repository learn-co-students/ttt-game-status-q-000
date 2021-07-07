# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]

def won? (board)
  WIN_COMBINATIONS.each do |condition|
    win_1 = condition[0]
    win_2 = condition[1]
    win_3 = condition[2]

    value_1 = board[win_1]
    value_2 = board[win_2]
    value_3 = board[win_3]

    if value_1 == "X" && value_2 == "X" && value_3 == "X"
      return condition
    elsif value_1 == "O" && value_2 == "O" && value_3 == "O"
      return condition
    end
  end
  false
end

def full? (board)
  board.all? do |tile|
    tile == "X" || tile == "O"
  end
end

def draw? (board)
  if won?(board)
    false
  elsif !won?(board) && full?(board)
    true
  end
end

def over? (board)
  if draw?(board) || won?(board)
    true
  else
    false
  end
end

def winner (board)
  if !won?(board)
    nil
  elsif board[won?(board)[0]] == "X"
    "X"
  elsif board[won?(board)[0]] == "O"
    "O"
  end
end