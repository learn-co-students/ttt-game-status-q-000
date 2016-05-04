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
