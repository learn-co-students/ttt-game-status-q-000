# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
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

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

    if position_taken?(board, win_index_1) && position_taken?(board, win_index_2) && position_taken?(board, win_index_3)
      if (position_1 == "X" and position_2 == "X" and position_3 == "X") || (position_1 == "O" and position_2 == "O" and position_3 == "O")
        return win_combination
      else
        false
      end
      false
    end
    false
  end
  false
end

def full?(board)
  if (board.all? {|space| space == "X" or space == "O"})
    true
  else
    false
  end
end

def draw?(board)
  if !won?(board) && full?(board)
    true
  elsif won?(board)
    false
  end
end

def over?(board)
  if won?(board) || draw?(board) || full?(board)
    true
  else
    false
  end
end

def winner(board)
  winning_index = won?(board)
  if won?(board)
    if board[winning_index[0]] == "X" and board[winning_index[1]] == "X" and board[winning_index[2]] == "X"
      "X"
    elsif board[winning_index[0]] == "O" and board[winning_index[1]] == "O" and board[winning_index[2]] == "O"
      "O"
    end
  else
    nil
  end
end
