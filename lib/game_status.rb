WIN_COMBINATIONS =
   [
   [0,1,2], #top row
   [3,4,5], #mid row
   [6,7,8], #bottom row
   [0,4,8], #right diag
   [2,4,6], #left diag
   [0,3,6], #left column
   [1,4,7], #mid column
   [2,5,8] #right col
   ]

 # return true for win false no.

 def won?(board)
   WIN_COMBINATIONS.find do |win|  # iterate over the winning combos and check tokens
     win.all? { |token| board[token] == "X"} || win.all? { |token| board[token] == "O"}
     end
   end

 def full?(board)
   !board.any? {|index| index == " "}
 end
#check to see if draw using not won and full board
 def draw?(board)
   if !won?(board) && full?(board)
     return true
  else
    false
   end
 end
 #check to see if over with or operators
 def over?(board)
   if won?(board) || draw?(board) || full?(board)
     return true
   else
     return false
   end
 end

 def winner(board)  #find the winner
   if won?(board)
     won?(board).each do |value|   #value is X or O
       return board[value]
     end
   end
 end
