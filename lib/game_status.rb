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
				
					
					board.all? do |i| 
						if( i == " " || i=="" || i==nil)
						return false
						else 
							true
						end
						
					end
					
					WIN_COMBINATIONS.each do |i|
						win_combination = WIN_COMBINATIONS[i]
						
						win_index_1 = win_combination[0]
						win_index_2 = win_combination[1]
						win_index_3 = win_combination[2]
						
						position_1 = board[win_index_1] 
						position_2 = board[win_index_2] 
						position_3 = board[win_index_3]

						if position_1 == "X" && position_2 == "X" && position_3 == "X" ||
						    position_1 == "O" && position_2 == "O" && position_3 == "O"
							return win_combination
							 else
								 false
						 end
					end
				end