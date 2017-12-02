# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def won?(board)
  WIN_COMBINATIONS.each do |combo|
    # Finds the values combinations of winning game
    win_index_1 = combo[0] 
    win_index_2 = combo[1]
    win_index_3 = combo[2]

    # Finds the boards values of winning combo slots
    posistion_1 = board[win_index_1]
    posistion_2 = board[win_index_2]
    posistion_3 = board[win_index_3]

    # Compares the winning slots to the board
    if (posistion_1 == "X" && posistion_2 == "X" && posistion_3 == "X") || (posistion_1 == "O" && posistion_2 == "O" && posistion_3 == "O")
      # returns the winning combo
      return combo
    end
  end
  return false
end

def full?(board)
  board.none? do |empty|
    empty == " "
  end
end

def draw?(board)
  full?(board) && !won?(board) 
end

def over?(board)
  won?(board) || draw?(board) || full?(board)
end

def winner(board)
  if winning_combo = won?(board)
    board[winning_combo.first]
  end
end
    
  
    





# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2], # top row
  [3, 4, 5], # middle row
  [6, 7, 8], # bottom row
  [0, 3, 6], # left col
  [1, 4, 7], # middle col
  [2, 5, 8], # right col
  [0, 4, 8], # diag 1
  [6, 4, 2] # diag 2
]