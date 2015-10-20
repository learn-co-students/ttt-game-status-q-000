# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

WIN_COMBINATIONS = [
  [0,1,2],  # Top row
  [3,4,5],  # Middle row
  [6,7,8],  # Bottom row
  [0,3,6],  # Vertical row
  [1,4,7],  # Vertical Middle row
  [2,5,8],  # Vertical row
  [0,4,8],  # Diagonal Row
  [2,4,6]   # Diagonal Row
]

def won?(board)
  WIN_COMBINATIONS.detect do |combo| 
    combo.all? {|location| board[location] == "X" } || combo.all? {|location| board[location] == "O" }
  end
end  

def full?(board)
  if board.any? {|location| location == " "}
    false
   else 
    true 
   end 
end

def draw?(board)
  full?(board) && !won?(board) ? true : false
end     

def over?(board)
 won?(board) || draw?(board) ? true : false
end  

def winner(board)
  if won?(board)
   board[won?(board)[0]] # return the value of index 0 of the array returned from the won? method
  else
    return nil
  end  
end  