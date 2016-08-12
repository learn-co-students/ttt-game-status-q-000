# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
  WIN_COMBINATIONS = [
	[ 0, 1, 2 ], # left to rights
	[ 3, 4, 5 ],
	[ 6, 7, 8 ],
	[ 0, 4, 8 ], #diagonals
	[ 2, 4, 6 ],
	[ 0, 3, 6 ], #ups and downs
	[ 1, 4, 7 ],
	[ 2, 5, 8 ]
			   ]
	def won?(board) #inside def you wana go thru details of the array
				    win_combination = WIN_COMBINATIONS.find { |combo| board[combo[0]] == "X" && board[combo[1]] == "X" && board[combo[2]] == "X" || board[combo[0]] == "O" && board[combo[1]] == "O" && board[combo[2]] == "O"}
	end
						

	def full?(board)
		board.all? { |position| position == "X" || position == "O" } #Return true for full board	
	end

	def draw?(board)
		
		if(won?(board) == true)
			return false
		elsif(won?(board) == false && full?(board) == true)
			return true
		elsif(won?(board) == false && full?(board) == false)
			return false
		end

	end
