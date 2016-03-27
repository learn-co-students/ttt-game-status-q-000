# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
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

def won?(board)
	WIN_COMBINATIONS.each do|combo|
		index1 = combo[0]
		index2 = combo[1]
		index3 = combo[2]
		if (board[index1] == board[index2] && board[index2] == board[index3] && position_taken?(board, index1))
			return combo
		end
	end
	return false
end

def full?(board)
	(0..board.size-1).each do|i|
		if (!position_taken?(board, i)) 
			return false
		end
	end
	return true
end

def draw?(board)
	if (!won?(board) && full?(board))
		return true
	end
	return false
end

def over?(board)
	if (won?(board) || full?(board) || draw?(board))
		return true
	end
	return false
end

def winner(board)
	win_indices = won?(board)
	if (win_indices)
		return board[win_indices[0]]
	end
	return nil
end
