# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]

def won?(board)
	WIN_COMBINATIONS.find do | combo_array |
		winning_combo(board, combo_array)
	end
end

def winning_combo(board, combo_array)
	(board[combo_array[0]] == board[combo_array[1]]) &&
	(board[combo_array[1]] == board[combo_array[2]]) &&
	(board[combo_array[0]] != " ")
end

def full?(board)
	!board.include?(" ")
end

def draw?(board)
	full?(board) && (won?(board) == nil)
end

def over?(board)
	won?(board) || draw?(board)
end

def winner(board)
	winning_combo = won?(board)
	if winning_combo
		board[winning_combo.first]
	end
end