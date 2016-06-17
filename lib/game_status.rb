# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
 WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,4,8], [2,4,6], [0,3,6], [1,4,7], [2,5,8]]

def won?(board)
  for i in 0..7
    if (board[WIN_COMBINATIONS[i][0]]==board[WIN_COMBINATIONS[i][1]]) && (board[WIN_COMBINATIONS[i][1]]==board[WIN_COMBINATIONS[i][2]]) && (board[WIN_COMBINATIONS[i][0]]!= "" && board[WIN_COMBINATIONS[i][0]]!=" ")
      return WIN_COMBINATIONS[i]
    end
  end
  return nil
end

def full?(board)
  for i in 0..8
    if !position_taken?(board, i)
      return false
    end
  end
    return true
end

def draw?(board)
  if  won?(board)==nil && full?(board)
    return true
  else
    return false
  end
end

def over?(board)
  if won?(board)!=nil || full?(board) || draw?(board)
    return true
  else
    return false
  end
end

def winner(board)
  if won?(board) != nil
  return board[won?(board)[0]]
else
  return nil
end
end
