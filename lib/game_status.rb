# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

	WIN_COMBINATIONS = 	[
		[0, 1, 2],
		[3, 4, 5],
		[6, 7, 8],
		[0, 3, 6],
		[1, 4, 7],
		[2, 5, 8],
		[0, 4, 8],
		[2, 4, 6]
	]

# Define your WIN_COMBINATIONS constant
def won?(board)
	WIN_COMBINATIONS.find do |combo| 
		board[combo[0]] == board[combo[1]] && 
		board[combo[1]] == board[combo[2]] && 
		position_taken?(board, combo[0])
	end
end

def full?(board)
	board.all? {|character| character == "X" || character == "O"}
end

def draw?(board)
	if won?(board)
		return false
	elsif full?(board)
		return true
	end
end

def over?(board)
	won?(board) || full?(board) || draw?(board)
end

def winner(board)
	if combo_winner = won?(board)
		board[combo_winner.first]

	end
end




