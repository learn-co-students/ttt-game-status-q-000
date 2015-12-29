# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS =  [[0,1,2], #top row
                    [3,4,5], #middle row
                    [6,7,8], #bottom row
                    [0,3,6], #left column
                    [1,4,7], #middle column
                    [2,5,8], #right column
                    [0,4,8], #top-ltr diagonal
                    [2,4,6]]  #top-rtl diagonal
                 
def won?(board)
  empty_board_count = 0
  board.each do
  	if !position_taken?(board, empty_board_count)
      empty_board_count += 1
    	if empty_board_count >= 9
        return false #satisfies test for empty board, no moves made
      end
    else    	
      WIN_COMBINATIONS.each do |winning_set| 
      	x_count = 0
      	o_count = 0
    		winning_set.each do |position|
    			if board[position] == "X"
    				x_count += 1
    				if x_count >= 3
    					return winning_set
    				end
    			elsif board[position] == "O"
    				o_count += 1
    				if o_count >= 3
    					return winning_set
    				end
    			end
    		end		
  		end
    end
  end
  return false # satisfies test of won? board is full, but no winner
end

def draw?(board)
	if won?(board) 
		return false
	end
	if full?(board)
		return true
	else
		return false
	end
end

def full?(board)
	if board.any? { |i| (i == " ") || (i == "")}
		return false
	else
		return true
	end
end

def over?(board)
	if draw?(board)
		return true
	end
	if won?(board)
		return true
	end
end

def winner(board)
	if won?(board)
		x_count = 0
		o_count = 0
		board.each do |xo|
			if xo == "X"
				x_count += 1
			elsif xo == "O"
				o_count += 1
			end
		end
		x_count > o_count ? (return "X") : (return "O")
	else
		return nil
	end
end