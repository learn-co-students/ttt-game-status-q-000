WIN_COMBINATIONS = [
 [0, 1, 2],
 [0, 3, 6],
 [0, 4, 8],
 [1, 4, 7],
 [2, 4, 6],
 [2, 5, 8],
 [3, 4, 5],
 [6, 7, 8]
]

def won?(board)
 WIN_COMBINATIONS.detect do |combo| 
   win_index_1 = combo[0]  
   win_index_2 = combo[1]
   win_index_3 = combo[2]

   position_1 = board[win_index_1]
   position_2 = board[win_index_2]
   position_3 = board[win_index_3]

   if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
     combo
   else
     false
   end
 end
end

def full?(board)
 board.select{ |position|
   position == " "
 }.length == 0
end

def draw?(board) 
 !won?(board) && full?(board)
end

def over?(board)
 won?(board) || full?(board) || draw?(board)
end

def winner(board)
 combos = won?(board)
 !combos ? nil: board[combos[0]]
end