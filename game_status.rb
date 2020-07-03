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
	winner = false
	WIN_COMBINATIONS.each do |combo|
		winning_combo = board[combo[0]].to_s + board[combo[1]].to_s + board[combo[2]].to_s
		winner = winning_combo == "XXX" || winning_combo == "OOO"
		if winner
			return combo
		end
	end
	return winner
end

def full?(board)
	if board.include?(" ")
		return false
	else
		return true
	end
end

def draw?(board)
	if full?(board) && won?(board) == false
		return true
	else
		return false
	end
end

def over?(board)
	if full?(board) || draw?(board) || won?(board)
		return true
	else
		return false
	end
end

def winner(board)
	if won?(board)
		return board[won?(board)[0]]
	else
		return nil
	end
end
