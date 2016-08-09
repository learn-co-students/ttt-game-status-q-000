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
					i = 0
				win_combination = Array.new(3, 0)
				
					board.all? do |i| # check if there are empty spaces or nil in board.
						if( i == " " || i=="" || i==nil)
							return false
								else 
									true
						end
					end
			
						while( i < 8 ) #while i has not reached the end of array WIN_COMBINATIONS insert each possibility in a single array to use to compare
			
							win_combination[0] = WIN_COMBINATIONS[i][0]
							win_combination[1] = WIN_COMBINATIONS[i][1]
							win_combination[2] = WIN_COMBINATIONS[i][2]
							
							win_index_1 = win_combination[0] #need indexes for board array, so I assign variables from arrays
							win_index_2 = win_combination[1]
							win_index_3 = win_combination[2]
								
							position_1 = board[win_index_1] #here's the index being assigned to variable to be compared to X's and O's below
							position_2 = board[win_index_2] 
							position_3 = board[win_index_3]
								
								  if position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 == "O"
									i+=1
									return win_combination 
										else
											i+=1
								end							
						end	
				end