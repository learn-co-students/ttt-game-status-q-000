# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8], #bottom row
  [0,3,6], #left col
  [1,4,7], #mid col
  [2,5,8], #right col
  [0,4,8], # left diag
  [2,4,6], #right diag
  ]


def won?(board)
  WIN_COMBINATIONS.detect {|yes|
    board[yes[0]] == board[yes[1]] && board[yes[0]] == board[yes[2]] && (board[yes[0]] == "X" || board[yes[0]] == "O")}
end

def full?(board)
  result = board.detect {|fullness| fullness == " "}
  if result == " "
    return false
  else
    return true
  end
end

def draw?(board)
  if won?(board) == nil && full?(board) == true
    return true
  else
    return false
  end
end
def over?(board)
  if won?(board) == true || draw?(board) == true || full?(board) == true
    return true
  else
    return false
  end
end

def winner(board)
  result = won?(board)
  if result != nil
    return board[result[0]]
  else
    return nil
  end
end
