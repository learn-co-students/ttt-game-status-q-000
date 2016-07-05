# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [6, 4, 2]
]

def won?(board)
  pass =
    WIN_COMBINATIONS.each do |win_combination|
      index_1 = win_combination[0]
      index_2 = win_combination[1]
      index_3 = win_combination[2]
      if (board[index_1] == "X" && board[index_2] == "X" && board[index_3] == "X") || (board[index_1] == "O" && board[index_2] == "O" && board[index_3] == "O")
        return win_combination
      end
    end
    return false
end

def full?(board)
  counter = 0
  board.each do |value|
    if value == "X" || value == "O"
      counter += 1
    end
  end
  if counter == 9
    return true
  else
    return false
  end
end

def draw?(board)
  if !won?(board)
    return true
  elsif (won?(board) == false && full?(board) == false) || won?(board) ==  true
    return false
  end
end

def over?(board)
  if full?(board) == false
    return false
  elsif won?(board) == true || full?(board) == true || draw?(board) == true
    return true
  end
end

def winner(board)
  if !won?(board)
    return nil
  else
    winning_array = won?(board)
    winning_index = winning_array[0]
    if board[winning_index] == "X"
      return "X"
    else
      return "O"
    end
  end
end
