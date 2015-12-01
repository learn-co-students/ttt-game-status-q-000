# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

def won?(board)
  WIN_COMBINATIONS.detect do |x|
    (board[x[0]] == "X" &&
     board[x[1]] == "X" &&
     board[x[2]] == "X") ||
    (board[x[0]] == "O" &&
     board[x[1]] == "O" &&
     board[x[2]] == "O") &&
    position_taken?(board, x[0])
  end
end

def full?(board) 
  if board.all? {|x| x == "O" || x == "X"} 
    return true
  end
end

def draw?(board)
  if !won?(board) && full?(board)
    return true
  else
    return false
  end
end

def over?(board)
  if full?(board) || won?(board)
    return true
  end
end

def winner(board)
  array = won?(board)
  if won?(board)
    return board[array[0]]
  end
end


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