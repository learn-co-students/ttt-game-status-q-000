# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], [3,4,5],
  [6,7,8], [0,3,6],
  [1,4,7], [2,5,8],
  [0,4,8], [6,4,2]
]

def won?(board)
  board.include?("X") || board.include?("O")
  woncom?(board)
end

def woncom?(board)

    win_index_1 = WIN_COMBINATIONS[0]
    win_index_2 = WIN_COMBINATIONS[1]
    win_index_3 = WIN_COMBINATIONS[2]
    win_index_4 = WIN_COMBINATIONS[3]
    win_index_5 = WIN_COMBINATIONS[4]
    win_index_6 = WIN_COMBINATIONS[5]
    win_index_7 = WIN_COMBINATIONS[6]
    win_index_8 = WIN_COMBINATIONS[7]

  position_1 = win_index_1[0]
  position_2 = win_index_1[1]
  position_3 = win_index_1[2]

  if board[position_1] == "X" && board[position_2] == "X" && board[position_3] == "X"
    return win_index_1
  elsif board[position_1] == "O" && board[position_2] == "O" && board[position_3] == "O"
    return win_index_1
  end
  if
    position_1 = win_index_2[0]
    position_2 = win_index_2[1]
    position_3 = win_index_2[2]
    if board[position_1] == "X" && board[position_2] == "X" && board[position_3] == "X"
     return win_index_2
    elsif board[position_1] == "O" && board[position_2] == "O" && board[position_3] == "O"
      return win_index_2

    end
  end
  if
    position_1 = win_index_3[0]
    position_2 = win_index_3[1]
    position_3 = win_index_3[2]

    if board[position_1] == "X" && board[position_2] == "X" && board[position_3] == "X"
      return win_index_3
    elsif board[position_1] == "O" && board[position_2] == "O" && board[position_3] == "O"
      return win_index_3
    end
  end
  if
    position_1 = win_index_4[0]
    position_2 = win_index_4[1]
    position_3 = win_index_4[2]

    if board[position_1] == "X" && board[position_2] == "X" && board[position_3] == "X"
      return win_index_4
    elsif board[position_1] == "O" && board[position_2] == "O" && board[position_3] == "O"
      return win_index_4
    end
  end
  if
    position_1 = win_index_5[0]
    position_2 = win_index_5[1]
    position_3 = win_index_5[2]

    if board[position_1] == "X" && board[position_2] == "X" && board[position_3] == "X"
      return win_index_5
    elsif board[position_1] == "O" && board[position_2] == "O" && board[position_3] == "O"
      return win_index_5
    end
  end
  if
    position_1 = win_index_6[0]
    position_2 = win_index_6[1]
    position_3 = win_index_6[2]

    if board[position_1] == "X" && board[position_2] == "X" && board[position_3] == "X"
      return win_index_6
    elsif board[position_1] == "O" && board[position_2] == "O" && board[position_3] == "O"
      return win_index_6
    end
  end
  if
    position_1 = win_index_7[0]
    position_2 = win_index_7[1]
    position_3 = win_index_7[2]

    if board[position_1] == "X" && board[position_2] == "X" && board[position_3] == "X"
      return win_index_7
    elsif board[position_1] == "O" && board[position_2] == "O" && board[position_3] == "O"
      return win_index_7
    end
  end
  if
    position_1 = win_index_8[0]
    position_2 = win_index_8[1]
    position_3 = win_index_8[2]

    if board[position_1] == "X" && board[position_2] == "X" && board[position_3] == "X"
      return win_index_8
    elsif board[position_1] == "O" && board[position_2] == "O" && board[position_3] == "O"
      return win_index_8
    end
  end
end

def full?(board)
  !(board.include?(" "))
end

def draw?(board)
  (!woncom?(board) && full?(board))
end

def over?(board)
  draw?(board) || woncom?(board)
end

def winner(board)
  if woncom?(board).class != Array
    return nil
  else
    woncom?(board).each do |i|
      return board[i]
    end
  end


end

board = ["O", "X", "X", "O", "X", "X", "X", "X", "O"]
winner(board)
 woncom?(board)
#print x