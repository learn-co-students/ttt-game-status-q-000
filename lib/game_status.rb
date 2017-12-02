# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], #horizontal
  [3,4,5],
  [6,7,8],

  [0,3,6], #vertical
  [1,4,7],
  [2,5,8],

  [0,4,8], #diagonal
  [2,4,6]
]

def won?(board)
  WIN_COMBINATIONS.detect do |combo| #the 8 nested arrays
    if board[combo[0]] == board[combo[1]] && board[combo[1]] == board[combo[2]] && position_taken?(board, combo[0])
      combo #returns the winning array of 3 numbers
    else
      false
    end
  end
end

def full?(board)
  if board.include?(" ")
    false
  else
    true
  end
end

def draw?(board)
   full?(board) && !won?(board)
end

def over?(board)
  won?(board) || draw?(board) || full?(board)
end

def winner(board)
  combo = won?(board) # either returns array or nil
  if combo
    board[combo[0]] #returns the token itself. "X" OR "O" No need to overcomplicate things, keep it simple.
  else
    nil
  end
end



