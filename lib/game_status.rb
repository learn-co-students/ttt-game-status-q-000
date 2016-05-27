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
    [2,4,6],
    [0,4,8]
  ]
def won?(board)
  WIN_COMBINATIONS.find do | win_combination |

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
    else
      false
    end
  end
end

#full?
def full?(board)
  board.all? { | index | index == "X" || index == "O"}
end

# draw? method
def draw?(board)
  if !(won?(board)) && full?(board)
    true
  else
    false
  end
end

#over? method
def over?(board)
  if won?(board) || draw?(board) || full?(board)
    true
  else
    false
  end
end

# winner method
def winner(board)
  if won?(board)
    return board[won?(board)[0]]
  elsif draw?(board)
    nil
  end
end
