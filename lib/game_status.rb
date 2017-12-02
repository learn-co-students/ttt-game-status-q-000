# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
  [0,4,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [2,4,6],
  [3,4,5],
  [6,7,8]
  ]

def won?(board)
  WIN_COMBINATIONS.each do |x|
    if ((board[(x[0])] == "X" && board[(x[1])] == "X" && board[(x[2])] == "X") || (board[(x[0])] == "O" && board[(x[1])] == "O" && board[(x[2])] == "O"))
      return x
      end
    end
  return false
  end

def full?(board)
  board.all? { |x| x == "X" || x == "O" }
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  draw?(board) || won?(board)
end

def winner(board)
  if won?(board)
    return board[(won?(board)[0])]
  else
    return nil
  end
end