# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant
    WIN_COMBINATIONS = [
      [0,1,2],
      [3,4,5], # Top row
      [6,7,8],
      [0,3,6],
      [1,4,7],
      [2,5,8],
      [0,4,8],
      [2,4,6]
      # ETC, an array for each win combination
    ]

def won?(board)
  WIN_COMBINATIONS.each do |wincomb|
    position1 = wincomb[0]
    position2 = wincomb[1]
    position3 = wincomb[2]
    if (board[position1] == "X" && board[position2] == "X" && board[position3] == "X") || (board[position1] == "O" && board[position2] == "O" && board[position3] == "O")
      return wincomb
    end
  end
  return false
end


def full?(board)
  board.all? do |element|
    element == "X" || element == "O"
  end
end

def draw?(board)
  full?(board) && !won?(board)
  end

def over?(board)
  if full?(board) || won?(board) || full?(board)
    true
  end
end

def winner(board)
    if won?(board) != false
      return board[won?(board)[0]]
    end
end




