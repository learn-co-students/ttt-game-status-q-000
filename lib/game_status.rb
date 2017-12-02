# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8], # Bottom Row
  [0,3,6],  # Left Column
  [1,4,7], # Middle Column
  [2,5,8],  # Right Column
  [0,4,8], # Top Left Diagonal
  [2,4,6]  # Top Right Diagonal
 ]

# won method

def won?(board)
  WIN_COMBINATIONS.detect do |win_combination|
    board[win_combination[0]] == board[win_combination[1]] &&
    board[win_combination[1]] == board[win_combination[2]] &&
    position_taken?(board,win_combination[0])

  end
end

# full method

def full?(board)
  board.all? do |position|
    position == "X" || position == "O"
  end

end

# draw method

def draw?(board)
  if full?(board) == true && !won?(board) == true
    true
  else
    false
  end
end

# over method

def over?(board)
  if won?(board) == true || draw?(board) == true || full?(board) == true
    true
  else
    false
  end
end

# winner method

def winner(board)

  if winning_list = won?(board)
    board[winning_list.first]
  else
  end
end