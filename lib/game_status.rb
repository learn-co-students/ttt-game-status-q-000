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
  [0,4,8],
  [2,4,6]
  ]


def won?(board)
  if board == [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    return false
  end

  WIN_COMBINATIONS.each do |spot|
    if board[spot[0]] == "X" && board[spot[1]] == "X" && board[spot[2]] == "X"
      return spot
    end
    if board[spot[0]] == "O" && board[spot[1]] == "O" && board[spot[2]] == "O"
      return spot
    end
  end

  return false # for a draw
end

def full?(board)
  board.each do |position|
    if position == " "
      return false
    end
  end
    return true
end

def draw?(board)
  if full?(board) == true && won?(board) == false
    return true
  else
    return false
  end
end

def over?(board)
  if draw?(board) == true || full?(board) == true || won?(board) == true
    return true
  end
end

def winner(board)
  array = won?(board)
  if array != true && array != false
    return board[array[0]]
  end
end