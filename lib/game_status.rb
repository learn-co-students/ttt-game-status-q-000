# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
  end

def won?(board)
  xpos=[]
  opos=[]
  board.each_with_index do |position,index|
         xpos<<index if position=="X"
         opos<<index if position=="O"
  end
  WIN_COMBINATIONS.detect {|w| (w-xpos).empty? || (w-opos).empty? }
 end

def full?(board)
board.all?{|position| position=="X" || position=="O" }
end

def draw?(board)
 full?(board) && !won?(board)
end

def over?(board)
full?(board) ||  won?(board) || full?(board)
end

def winner(board)
  if combo=won?(board)
  return board[combo[0]]
  else
    nil
  end
end

# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS=[
   [0,1,2], # Top row
   [3,4,5],  # Middle row
   [6,7,8], # Bottom row
   [0,3,6], # First column
   [1,4,7], # Second column
   [2,5,8], # Third  column
   [0,4,8], # Top left to bottom right diagonal
   [2,4,6] # Top right to bottom left diagonal
  ]