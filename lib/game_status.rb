# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end


# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [ 
[0,1,2], # Top row win
[3,4,5], # Middle row win
[6,7,8], # Bottom row win
[0,3,6], # Left vertical win
[1,4,7], # Middle vertical win
[2,5,8], # Right vertical win
[0,4,8], # Diagonal win 
[6,4,2] # Diagonal win 

]

# Won Method 
def won?(board)

  WIN_COMBINATIONS.detect do |index_win|
   
  board[index_win[0]] == board[index_win[1]] &&
  board[index_win[1]] == board[index_win[2]] &&
      position_taken?(board, index_win[0])  
end
end

def full?(board)
board.all?{|character| character == "X" || character == "O"}

end

def draw?(board)
!won?(board) && full?(board)

end

def over?(board)
  won?(board) && draw?(board) || full?(board)

end

def winner(board)
if the_index_win = won?(board)
  board[the_index_win.first]
  end
end