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
	['X','O'].each do |player|
		WIN_COMBINATIONS.each do |combination|
			win_index_1 = combination[0]
			win_index_2 = combination[1]
			win_index_3 = combination[2]

			position_1 = board[win_index_1]
			position_2 = board[win_index_2]
			position_3 = board[win_index_3]

			if position_1 === player && position_2 === player && position_3 === player
				return combination
			end
		end
	end
	false
end

def full?(board)
	board.each do |space|
		if space === " " or space === ""
			return false
		end
	end
	true
end

def draw?(board)
	if won?(board) === false and full?(board) === true
		return true
	end
	false
end

def over?(board)
	if draw?(board) === true or won?(board) != false
		return true
	end
	false
end

def winner(board)
	['X','O'].each do |player|
		WIN_COMBINATIONS.each do |combination|
			win_index_1 = combination[0]
			win_index_2 = combination[1]
			win_index_3 = combination[2]

			position_1 = board[win_index_1]
			position_2 = board[win_index_2]
			position_3 = board[win_index_3]
			
			if position_1 === player && position_2 === player && position_3 === player
				return player
			end
		end
	end
	nil
end
