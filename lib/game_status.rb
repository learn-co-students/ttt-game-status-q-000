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
						win_index_1 = WIN_COMBINATIONS[i][0].to_i
						win_index_2 = WIN_COMBINATIONS[i][1].to_i
						win_index_3 = WIN_COMBINATIONS[i][2].to_i
						
						position_1 = board[win_index_1] 
						position_2 = board[win_index_2] 
						position_3 = board[win_index_3]

						if position_1 == "X" && position_2 == "X" && position_3 == "X" ||
						    position_1 == "O" && position_2 == "O" && position_3 == "O"
							return WIN_COMBINATIONS[i]
							 else
								 false
						 end
					end
				end