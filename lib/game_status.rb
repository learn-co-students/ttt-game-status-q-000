# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
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
    if board[combo[0]] == board[combo[1]] &&   #these 3 lines check if one index is equal to the next one.
       board[combo[1]] == board[combo[2]] &&   #dont need to check if it equals to "X" each time - too much work.
       position_taken?(board, combo[0])
      return combo #returns an array of winning numbers
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
  if won?(board) == true
    if board[combo[0]] == "X"
    "X"
  elsif board[combo[0]] == "O"
    "O"
  else
    nil
    end
  end
end
