require 'pry'
# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS = [
    [0,1,2], 
    [3,4,5],
    [6,7,8], 
    [0,3,6], 
    [1,4,7], 
    [2,5,8],
    [2,4,6],
    [0,4,8]
]


def won?(board)

  WIN_COMBINATIONS.find do |combo|
    #I realized since each index has to be the same value (either all "X" or all "O") for it to be a winning combination, 
    #set them equal to eachother instead of writing out the each of the three index separately equal to "X" (or "O")
    #i'd have to write that out 6 six times! 
     board[combo[0]] == board[combo[1]] && board[combo[0]] == board[combo[2]] && position_taken?(board, combo[0]) 
  end
end

def full?(board)
  board.all? do |value|
    value == "X" || value == "O"
  end
end

def draw?(board)
  full?(board) && !won?(board)
end
    
def over?(board)
  won?(board) || full?(board) || draw?(board)
end

def winner(board)
  win_index = won?(board)

  if won?(board)
    board[win_index[0]]
  else
    nil
  end
end