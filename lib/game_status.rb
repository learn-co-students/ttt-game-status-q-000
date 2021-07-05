# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,4,8],
    [2,4,6],
    [0,3,6],
    [1,4,7],
    [2,5,8]
  ]

def won?(board)

  if (!position_taken?(board,0) && !position_taken?(board,1) &&
      !position_taken?(board,2) && !position_taken?(board,3) &&
      !position_taken?(board,4) && !position_taken?(board,5) &&
      !position_taken?(board,6) && !position_taken?(board,7) &&
      !position_taken?(board,8))
        return nil
      end

  win_index_1 = WIN_COMBINATIONS[0]
  win_index_2 = WIN_COMBINATIONS[1]
  win_index_3 = WIN_COMBINATIONS[2]
  win_index_4 = WIN_COMBINATIONS[3]
  win_index_5 = WIN_COMBINATIONS[4]
  win_index_6 = WIN_COMBINATIONS[5]
  win_index_7 = WIN_COMBINATIONS[6]
  win_index_8 = WIN_COMBINATIONS[7]

  if (board[win_index_1[0]] == "O" && board[win_index_1[1]] == "O" && board[win_index_1[2]] == "O")
      return win_index_1

  elsif (board[win_index_1[0]] == "X" && board[win_index_1[1]] == "X" && board[win_index_1[2]] == "X")
      return win_index_1

  elsif (board[win_index_2[0]] == "O" && board[win_index_2[1]] == "O" && board[win_index_2[2]] == "O")
      return win_index_2

  elsif (board[win_index_2[0]] == "X" && board[win_index_2[1]] == "X" && board[win_index_2[2]] == "X")
      return win_index_2

  elsif (board[win_index_3[0]] == "O" && board[win_index_3[1]] == "O" && board[win_index_3[2]] == "O")
      return win_index_3

  elsif (board[win_index_3[0]] == "X" && board[win_index_3[1]] == "X" && board[win_index_3[2]] == "X")
      return win_index_3

  elsif (board[win_index_4[0]] == "O" && board[win_index_4[1]] == "O" && board[win_index_4[2]] == "O")
      return win_index_4

  elsif (board[win_index_4[0]] == "X" && board[win_index_4[1]] == "X" && board[win_index_4[2]] == "X")
      return win_index_4

  elsif (board[win_index_5[0]] == "O" && board[win_index_5[1]] == "O" && board[win_index_5[2]] == "O")
      return win_index_5

  elsif (board[win_index_5[0]] == "X" && board[win_index_5[1]] == "X" && board[win_index_5[2]] == "X")
      return win_index_5

  elsif (board[win_index_6[0]] == "O" && board[win_index_6[1]] == "O" && board[win_index_6[2]] == "O")
      return win_index_6

  elsif (board[win_index_6[0]] == "X" && board[win_index_6[1]] == "X" && board[win_index_6[2]] == "X")
      return win_index_6

  elsif (board[win_index_7[0]] == "O" && board[win_index_7[1]] == "O" && board[win_index_7[2]] == "O")
      return win_index_7

  elsif (board[win_index_7[0]] == "X" && board[win_index_7[1]] == "X" && board[win_index_7[2]] == "X")
      return win_index_7

  elsif (board[win_index_8[0]] == "O" && board[win_index_8[1]] == "O" && board[win_index_8[2]] == "O")
      return win_index_8

  elsif (board[win_index_8[0]] == "X" && board[win_index_8[1]] == "X" && board[win_index_8[2]] == "X")
      return win_index_8

  else
    return nil
  end
end

def full?(board)
  if (board[0] != " " && board[1] != " " && board[2] != " " && board[3] != " " &&
      board[4] != " " && board[5] != " " && board[6] != " " && board[7] != " " &&
      board[8] != " ")
        return true
  else
    return false
  end
end

def draw?(board)
  if (full?(board) == true &&  won?(board) == nil)
    return true
  else
    return false
  end
end

def over?(board)
  if draw?(board) == true
    return true
  elsif full?(board) == false
    return false
  elsif won?(board) != nil
    return true
  end
end

  def winner(board)
    if won?(board) == nil
      return nil
    else
      return board[won?(board)[0]]
  end
end
