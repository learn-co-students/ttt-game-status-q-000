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
   [0,4,8],
   [2,4,6]
  ]

#Define ?won method
def won?(board)
  WIN_COMBINATIONS.detect do |array|
    win_block(board,array)
  end
end



def win_block(board,array)
  (board[array[0]]=="X") && (board[array[1]]=="X") && (board[array[2]]=="X") ||
  (board[array[0]]=="O") && (board[array[1]]=="O") && (board[array[2]]=="O")
end



def full?(board)
  board.all? {|i| i!=" "}
end


def draw?(board)
  if (!won?(board) && full?(board))
    return true
  elsif ((!won?(board) && !full?(board)))
    return false
  elsif won?(board)
    return false
  end
end



def over?(board)
 (won?(board)) || (draw?(board)) || (full?(board))

end

def winner(board)
   if (won?(board))
     return board[won?(board)[0]]
   else
     return nil
   end
end




