# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8],  # Bottom row
  [0,3,6], # Left column
  [1,4,7],  # Middle column
  [2,5,8],  # Right column
  [0,4,8],  # Diagonal 1
  [6,4,2]  # Diagonal 2
]

# determines if there is a winner
def won?(board)
  WIN_COMBINATIONS.each do |combination|
    win_index_1 = combination[0]
    win_index_2 = combination[1]
    win_index_3 = combination[2]
   
    position_1 = board[win_index_1] # load the value of the board at win_index_1
    position_2 = board[win_index_2] # load the value of the board at win_index_2
    position_3 = board[win_index_3] # load the value of the board at win_index_3
  
    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return combination # return the win_combination indexes that won.
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return combination # return the win_combination indexes that won.
    end
  end
  false
end

# determines if the board is full or not
def full?(board)
  if board.include?(" ")
    false
  else
    true
  end
end

# determines if there is a tie
def draw?(board)
  if full?(board) && !won?(board)
    true
  else
    false
  end
end

# determines if the game is over
def over?(board)
  if draw?(board) || won?(board)
    true
  else 
    false
  end
end

def winner(board)
  if won?(board)
    win_array = won?(board)
    position = win_array[0]
    board[position]
  else 
    nil
  end
end



