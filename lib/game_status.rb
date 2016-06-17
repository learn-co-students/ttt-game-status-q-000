# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]

def won?(board)
  WIN_COMBINATIONS.each do |win|
    winner = ""
    win.each do |pos|
      if board[pos] == "X"
        winner << "X"
      elsif board[pos] == "O"
        winner << "O"
      end
      if winner == "XXX"
        return win
      elsif winner == "OOO"
        return win
      end
    end
  end
  return false
end

def draw?(board)
  if full?(board) && !won?(board)
    return true
  else
    return false
  end
end


def over?(board)
  if draw?(board) || won?(board)
    return true
  else
    return false
  end
end

def full?(board)
  board.all?  { |element|  element == "X" || element == "O" }
end

def winner(board)
  if won?(board) != false
    winner = board[won?(board)[0]]
  end
end