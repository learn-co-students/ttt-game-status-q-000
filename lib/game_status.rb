# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], #top row
  [3,4,5], #middle row
  [6,7,8], #bottom row
  [0,3,6], #left column
  [1,4,7], #middle column
  [2,5,8], #right column
  [0,4,8], #top left to bottom right diagonal
  [2,4,6], #bottom left to top right diagonal
  ]

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    x_wins = win_combination.all? do |indexes|
      board[indexes] == "X"
    end
    o_wins = win_combination.all? do |indexes|
      board[indexes] == "O"
    end
    if x_wins || o_wins
      return win_combination
    end
  end
  else return false
end

def full?(board)
  full = board.none? do |location|
    location == " " || location == nil
  end
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  full?(board) || won?(board) || draw?(board)
end

def winner(board)
    if won?(board)
      return board[won?(board)[0]]
    else return nil
    end
end