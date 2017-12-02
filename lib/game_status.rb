
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
    [2, 4, 6]
  ]

  def won?(board)
    win_index1 = WIN_COMBINATIONS[0]
    win_index2 = WIN_COMBINATIONS[1]
    win_index3 = WIN_COMBINATIONS[2]
    win_index4 = WIN_COMBINATIONS[3]
    win_index5 = WIN_COMBINATIONS[4]
    win_index6 = WIN_COMBINATIONS[5]
    win_index7 = WIN_COMBINATIONS[6]
    win_index8 = WIN_COMBINATIONS[7]

    if (board[0] == "X" && board[1] == "X" && board[2] == "X") || (board[0] == "O" && board[1] == "O" && board[2] == "O")
      return win_index1
    elsif (board[3] == "X" && board[4] == "X" && board[5] == "X") || (board[3] == "O" && board[4] == "O" && board[5] == "O")
      return win_index2
    elsif (board[6] == "X" && board[7] == "X" && board[8] == "X") || (board[6] == "O" && board[7] == "O" && board[8] == "O")
      return win_index3
    elsif (board[0] == "X" && board[3] == "X" && board[6] == "X") || (board[0] == "O" && board[3] == "O" && board[6] == "O")
      return win_index4
    elsif (board[1] == "X" && board[4] == "X" && board[7] == "X") || (board[1] == "O" && board[4] == "O" && board[7] == "O")
      return win_index5
    elsif (board[2] == "X" && board[5] == "X" && board[8] == "X") || (board[2] == "O" && board[5] == "O" && board[8] == "O")
      return win_index6
    elsif (board[0] == "X" && board[4] == "X" && board[8] == "X") || (board[0] == "O" && board[4] == "O" && board[8] == "O")
      return win_index7
    elsif (board[2] == "X" && board[4] == "X" && board[6] == "X") || (board[2] == "O" && board[4] == "O" && board[6] == "O")
      return win_index8
    else
      return nil
    end
  end

  def full?(board)
    if board.include?(" ")
      return false
    else
      return true
    end
  end

def draw?(board)
  if !won?(board) && full?(board)
    return true
  elsif !won?(board) && !full?(board)
    return false
  elsif won?(board)
    return false
  end
end

def over?(board)
  if won?(board) || draw?(board) || full?(board)
    return true
  else
    return false
  end
end

def winner(board)
  if  (board[0] == "X" && board[1] == "X" && board[2] == "X") || 
      (board[3] == "X" && board[4] == "X" && board[5] == "X") || 
      (board[6] == "X" && board[7] == "X" && board[8] == "X") || 
      (board[0] == "X" && board[3] == "X" && board[6] == "X") || 
      (board[1] == "X" && board[4] == "X" && board[7] == "X") || 
      (board[2] == "X" && board[5] == "X" && board[8] == "X") || 
      (board[0] == "X" && board[4] == "X" && board[8] == "X") || 
      (board[2] == "X" && board[4] == "X" && board[6] == "X") 
  return "X"

    elsif 
      (board[0] == "O" && board[1] == "O" && board[2] == "O") || 
      (board[3] == "O" && board[4] == "O" && board[5] == "O") || 
      (board[6] == "O" && board[7] == "O" && board[8] == "O") || 
      (board[0] == "O" && board[3] == "O" && board[6] == "O") || 
      (board[1] == "O" && board[4] == "O" && board[7] == "O") || 
      (board[2] == "O" && board[5] == "O" && board[8] == "O") || 
      (board[0] == "O" && board[4] == "O" && board[8] == "O") || 
      (board[2] == "O" && board[4] == "O" && board[6] == "O")
      return "O"
    else
      return nil
    
    end
end
