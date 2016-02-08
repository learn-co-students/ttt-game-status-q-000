# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom row
  [0,3,6], # Left column
  [1,4,7], # Middle column
  [2,5,8], # Right column
  [0,4,8], # Top left diagonal
  [2,4,6] # Top right diagonal
  ]

def won?(board)
  if board[0] == "X" && board[1] == "X" && board[2] == "X" || board[0] == "O" && board[1] == "O" && board[2] == "O"
    return WIN_COMBINATIONS[0]
    elsif board[3] == "X" && board[4] == "X" && board[5] == "X" || board[3] == "O" && board[4] == "O" && board[5] == "O"
    return WIN_COMBINATIONS[1]
    elsif board[6] == "X" && board[7] == "X" && board[8] == "X" || board[6] == "O" && board[7] == "O" && board[8] == "O"
    return WIN_COMBINATIONS[2]
    elsif board[0] == "X" && board[3] == "X" && board[6] == "X" || board[0] == "O" && board[3] == "O" && board[6] == "O"
    return WIN_COMBINATIONS[3]
    elsif board[1] == "X" && board[4] == "X" && board[7] == "X" || board[1] == "O" && board[4] == "O" && board[7] == "O"
    return WIN_COMBINATIONS[4]
    elsif board[2] == "X" && board[5] == "X" && board[8] == "X" || board[2] == "O" && board[5] == "O" && board[8] == "O"
    return WIN_COMBINATIONS[5]
    elsif board[0] == "X" && board[4] == "X" && board[8] == "X" || board[0] == "O" && board[4] == "O" && board[8] == "O"
    return WIN_COMBINATIONS[6]
    elsif board[2] == "X" && board[4] == "X" && board[6] == "X" || board[2] == "O" && board[4] == "O" && board[6] == "O"
    return WIN_COMBINATIONS[7]
  else
    false
  end
end

def full?(board)
  if board.any?{|empty| empty == " "}
  false
  else true
  end
end

def draw?(board)
  if full?(board) == true && won?(board) == false
    true
  else full?(board) == false || won?(board) == true
    false
  end
end

def over?(board)
  if draw?(board) == true || full?(board) == true || won?(board) == true
    true
  else false
  end
end

def winner(board)
  if board[0] == "X" && board[1] == "X" && board[2] == "X" || board[3] == "X" && board[4] == "X" && board[5] == "X" || board[6] == "X" && board[7] == "X" && board[8] == "X" || board[0] == "X" && board[3] == "X" && board[6] == "X" || board[1] == "X" && board[4] == "X" && board[7] == "X" || board[2] == "X" && board[5] == "X" && board[8] == "X" || board[0] == "X" && board[4] == "X" && board[8] == "X" || board[2] == "X" && board[4] == "X" && board[6] == "X"
    return "X"
    elsif board[0] == "O" && board[1] == "O" && board[2] == "O" || board[3] == "O" && board[4] == "O" && board[5] == "O" || board[6] == "O" && board[7] == "O" && board[8] == "O" || board[0] == "O" && board[3] == "O" && board[6] == "O" || board[1] == "O" && board[4] == "O" && board[7] == "O" || board[2] == "O" && board[5] == "O" && board[8] == "O" || board[0] == "O" && board[4] == "O" && board[8] == "O" || board[2] == "O" && board[4] == "O" && board[6] == "O"
    return "O"
  else draw?(board)
    return nil
  end
end

