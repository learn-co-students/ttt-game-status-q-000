# Helper Method
require 'pry'
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
[0,1,2], #top row
[3,4,5], #middle row
[6,7,8], # bottom row
[0,3,6], #first column
[1,4,7], #second column
[2,5,8], #third column
[0,4,8], #first diagonal
[2,4,6], #second diagonal
]



def won?(board)
   WIN_COMBINATIONS.each do |wins|
    wins.any?  do |positions| 
      binding.pry
      positions.all?  positions == "X" || positions == "O" ? wins : false
  end
 end
end
    


