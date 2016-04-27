# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

def full?(board)
  board.all? {|i| i == "X" or i == "O"}
end

def draw?(board)
  if full?(board) == true and won?(board) == false
    return true
  end
end

def over?(board)
  if  draw?(board) == true or won?(board) != false
    return true
  end
end

def winner(board)
  winning_combo = won?(board)
  if won?(board) == false
    return nil
  elsif board[winning_combo[0]] == "X"
  	return "X"
	else
	  return "O"
	end
 end



def won?(board)
 WIN_COMBINATIONS.each do |combo|
   win_index_1 = combo[0]
   win_index_2 = combo[1]
   win_index_3 = combo[2]
   position_1 = board[win_index_1]
   position_2 = board[win_index_2]
   position_3 = board[win_index_3]

   if (position_1 == "X" and position_2 == "X" and position_3 == "X") or (position_1 == "O" and position_2 == "O" and position_3 == "O")
     return combo
   end
 end
 return false
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
