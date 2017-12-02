#require "pry"

# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top Row
  [3,4,5], # Middle Row
  [6,7,8], # Bottom Row
  [0,3,6], # Left Column
  [1,4,7], # Middle Column
  [2,5,8], # Right Column
  [0,4,8], # Top Left Diagonal
  [2,4,6], # Top Right Diagonal]
]  

def won?(board)

  WIN_COMBINATIONS.detect do |winning_array|
    
    #winning_array.all? do |win_index|
    #  if board[win_index] == "X"
    #    winning_array
    #  elsif board[win_index] == "O"
    #    winning_array
    #  else
    #  end
    #end
    #end
          

   if board[winning_array[0]] == "X" && board[winning_array[1]] == "X" && board[winning_array[2]] == "X"
       winning_array
    elsif board[winning_array[0]] == "O" && board[winning_array[1]] == "O" && board[winning_array[2]] == "O"
     winning_array
   else
  end
 end
end

def full?(board)

  board.all? do |marker|
    marker == "X" or marker == "O"
  end

end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) || full?(board) || draw?(board)
end

def winner(board)
  if won?(board)
  board[won?(board)[0]]
  else
  end


end

