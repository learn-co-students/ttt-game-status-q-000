# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end
WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
# Define your WIN_COMBINATIONS constant
def won?(board)
  i=0
  while i < 8
  #  puts i
 win_index = WIN_COMBINATIONS[i]
              if(board[win_index[0]]=="X"  && board[win_index[1]]=="X" && board[win_index[2]]=="X") || (board[win_index[0]]=="O"  && board[win_index[1]]=="O" && board[win_index[2]]=="O")
                     return win_index
             end
  i=i+1
#  count=0
  end
return nil
end
def full?(board)
      !(board.any? {|i|  i ==" "})
     #return !a
 end
def draw?(board)
    full?(board) && (won?(board).class != Array)
end
def over?(board)
   full?(board)
end
def winner(board)
     result = won?(board)
     puts result
      if result.class ==Array
      return board[result[0]]
      else
      return nil
    end
end
   # puts won?(["X", "X", "X", " ", " ", " ", " "," "])
#puts full?(["X", "O", "X", "O", "X", "X", "O", "X", "O"])
#puts draw?(["X", "O", "X", "O", "X", "X", "O", "X", "O"])
#puts won?(["X", "O", " ", " ", "O", " ", " ", "O", "X"])
#puts winner (["X", "O", " ", " ", "O", " ", " ", "O", "X"])