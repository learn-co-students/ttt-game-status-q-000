# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end


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
puts





 def won?(board)
  WIN_COMBINATIONS.detect do |combo|
    combo.all?{|i| board[i]=="X"} || combo.all?{|i| board[i]=="O"}
  end
 end

def full?(board)
   !board.include?(" ")
end




def draw?(board)
   full?(board)&& !won?(board)
end


def over?(board)
  draw?(board)||won?(board)

end


def winner(board)
   if (won?(board))
     return board[won?(board)[0]]
   else
     return nil
   end
end


# Define your WIN_COMBINATIONS constant
