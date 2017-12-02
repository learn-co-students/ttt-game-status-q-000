# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS=[
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]]

def won?(board)
  if board[0]=="X"&&board[1]=="X"&&board[2]=="X"
    return WIN_COMBINATIONS[0]
  elsif board[0]=="O"&&board[1]=="O"&&board[2]=="O"
    return WIN_COMBINATIONS[0]
  end
    if board[3]=="X"&&board[4]=="X"&&board[5]=="X"
    return WIN_COMBINATIONS[1]
  elsif board[3]=="O"&&board[4]=="O"&&board[5]=="O"
    return WIN_COMBINATIONS[1]
  end
  if board[6]=="X"&&board[7]=="X"&&board[8]=="X"
    return WIN_COMBINATIONS[2]
  elsif board[6]=="O"&&board[7]=="O"&&board[8]=="O"
    return WIN_COMBINATIONS[2]
  end
    if board[0]=="X"&&board[3]=="X"&&board[6]=="X"
    return WIN_COMBINATIONS[3]
  elsif board[0]=="O"&&board[3]=="O"&&board[6]=="O"
    return WIN_COMBINATIONS[3]
  end
    if board[1]=="X"&&board[4]=="X"&&board[7]=="X"
    return WIN_COMBINATIONS[4]
  elsif board[1]=="O"&&board[4]=="O"&&board[7]=="O"
    return WIN_COMBINATIONS[4]
  end
  if board[2]=="X"&&board[5]=="X"&&board[8]=="X"
    return WIN_COMBINATIONS[5]
  elsif board[2]=="O"&&board[5]=="O"&&board[8]=="O"
    return WIN_COMBINATIONS[5]
  end
    if board[0]=="X"&&board[4]=="X"&&board[8]=="X"
    return WIN_COMBINATIONS[6]
  elsif board[0]=="O"&&board[4]=="O"&&board[8]=="O"
    return WIN_COMBINATIONS[6]
  end
  if board[2]=="X"&&board[4]=="X"&&board[6]=="X"
    return WIN_COMBINATIONS[7]
  elsif board[2]=="O"&&board[4]=="O"&&board[6]=="O"
    return WIN_COMBINATIONS[7]
  end
  return false
end

def full?(board)
  board.all? do |i|
    i=="X"||i=="O"
  end
end

def draw?(board)
  if won?(board)
    return false
  elsif !(full?(board))
    return false
  end
  return true
end

def over?(board)
  if won?(board)||draw?(board)||full?(board)
    return true
  end
end

def winner(board)
  if !(won?(board))
    return nil
  end
  a=won?(board)
  if board[a[0]]=="X"
    return "X"
  else
    return "O"
  end
end
