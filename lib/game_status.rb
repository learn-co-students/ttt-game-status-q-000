# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS =[
  [0,1,2],[0,3,6],[1,4,7],[2,5,8],[3,4,5],[6,7,8],[0,4,8],[2,4,6]]
  
    #defines a constant WIN_COMBINATIONS with arrays for each win combination (FAILED - 1)

  
def won?(board)
  
WIN_COMBINATIONS.detect do |a|
    (a.all?{|position| board[position] == "X"}) || (a.all?{|position| board[position] == "O"})
end
end
 
def full?(board)
if board.any? {|bb| bb.strip.empty?}
false
else
true
end
end

def draw?(board)
if full?(board) && !won?(board)
  true
end
end

def over?(board)
 if full?(board) || draw?(board) || won?(board)
  true
end
end

def winner(board)
  whowin=won?(board)
if whowin
 board[whowin[0]]
end
end