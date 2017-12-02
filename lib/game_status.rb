# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8],  # Bottom row
  [0,3,6], # Left column
  [1,4,7], # Middle column
  [2,5,8], # Right column
  [0,4,8], # Right diagonal
  [2,4,6]  # Left diagonal
]
def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
		win_index1= win_combination[0]
		win_index2= win_combination[1]
		win_index3= win_combination[2]
		pos_1 = board[win_index1]
		pos_2 = board[win_index2]
		pos_3 = board[win_index3]

	   if (pos_1 == "X" && pos_2 == "X" && pos_3 == "X")
	      return win_combination
		end

	      if  (pos_1 == "O" && pos_2 == "O" && pos_3 == "O")
	        return win_combination
	      end
	 	end

		return false


end

def full?(board)
  !board.any? {|element| (element ==" ") || (element =="")}
end
def draw?(board)
  if !won?(board) && full?(board)
    return true
  elsif !won?(board)&&!full?(board)
    return false
  elsif won?(board)
    return false
  end
end
def over?(board)
  if won?(board)||full?(board)||draw?(board)
    return true
  end
end
def winner(board)
	if win_combination = won?(board)
	  board[win_combination.first]
  end
end
