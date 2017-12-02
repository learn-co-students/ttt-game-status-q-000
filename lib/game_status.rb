# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
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
  [6,4,2]
]

def won?(board)
	row = []
	WIN_COMBINATIONS.each do |win_combos|

		row[0] = board[win_combos[0]]
		row[1] = board[win_combos[1]]
		row[2] = board[win_combos[2]]

		if row.all? {|token| token == "X"} || row.all? {|token| token == "O"}
			return win_combos
		end
	end
	return false
end

def full?(board)
	board.all? do |pos|
		pos == "X" || pos == "O"
	end
end

def draw?(board)
	if !won?(board) && full?(board)
		true
	else
		false
	end
end

def over?(board)
	if won?(board) || full?(board) || draw?(board)
		true
	else false
	end
end

def winner(board)
	token_array = []
	if won?(board)
		token_array = won?(board)
		token = token_array[0]
		return board[token]
	end
end
