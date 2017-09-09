# Helper Method
def position_taken?(board, index) #Returns true if position is nil or " ", otherwise returns false.
  !(board[index].nil? || board[index] == " ")
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
  [2,4,6]  #bottom left to top right diagonal
]

def all_filled?(board, positions) # Given a board and an array of three positions, returns true if all positions are filled with an "X" or "O", and false if they are not.
  positions.all? do | position |
    board[position] == "X" || board[position] == "O"
  end
end

def all_X?(board, positions) # Returns true if all positions in the positions on the board array stipulated in the positions array are "X"
  positions.all? do | position |
    board[position] == "X"
  end
end

def all_O?(board, positions) # Returns true if all positions in the positions on the board array stipulated in the positions array are "O"
  positions.all? do | position |
    board[position] == "O"
  end
end

def full?(board) # Returns true if board is full, false if not
  board.all? do | space |
    space == "X" || space == "O"
  end
end

def draw?(board)
  full?(board) && !won?(board) # Board must be full and not won.
end

def over?(board)
  won?(board) || draw?(board) # A game is over if it's won or drawn
end

def winner (board)
  if won?(board)
    winning_combo = won?(board)
    board[winning_combo[0]]
  end
end

def won?(board) # Returns the winning combination array if one is detected
  WIN_COMBINATIONS.each do | combo |
    if (all_filled?(board, combo) && (all_X?(board, combo) || all_O?(board, combo)))
      return combo
    end
  end
  return false
end
