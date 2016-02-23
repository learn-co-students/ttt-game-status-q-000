board = ["X", " ", " ", " ", "X", " ", " ", " ", "X"]

# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
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
  WIN_COMBINATIONS.find do |combination|
    combination.all? { |position| board[position] == "X" } or combination.all? { |position| board[position] == "O" }
  end
end

def full?(board) 
  !board.any? { |position| position != "X" && position != "O" }
end

def draw?(board)
  if !won?(board) && full?(board)
    return true
  else 
    return false
  end
end

def over?(board)
  if won?(board) or full?(board) or draw?(board)
    return true
  else
    return false
  end
end

def winner(board)
  if won?(board)
    return board[won?(board)[0]]
  end
end

