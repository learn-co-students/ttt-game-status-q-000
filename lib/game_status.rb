# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
	[0,1,2], #Top Row
	[3,4,5], #Middle Row
	[6,7,8], #Bottom Row
	[0,3,6], #Left Column
	[1,4,7], #Middle Column
	[2,5,8], #Right Column
	[0,4,8], #Top Left to Bottom Right
	[2,4,6]  #Top Right to Bottom Left
]

def won?(board)
	WIN_COMBINATIONS.detect do |win_combination|
		board[win_combination[0]] ==  board[win_combination[1]] &&
		board[win_combination[1]] ==  board[win_combination[2]] &&
		position_taken?(board, win_combination[0])
	end
end

def full?(board)
	board.none? do |spot|
		spot == ' '
	end
end

def draw?(board)
	full?(board) && !won?(board)
end

def over?(board)
	won?(board) || full?(board) || draw?(board)
end

def winner(board)
	if over?(board)
		win_combo = won?(board)
		return board[win_combo[0]]
	end
end