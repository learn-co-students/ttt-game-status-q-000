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
	WIN_COMBINATIONS.each do |win_combination|
		if board[win_combination[0]] == "X" && board[win_combination[1]] == "X" && board[win_combination[2]] == "X"
			return win_combination
  		else
  			return false
  		end
	end
end