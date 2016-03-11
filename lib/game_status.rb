# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]


def won?(board)
	WIN_COMBINATIONS.each do |combi|
		if position_taken?(board, combi[0]) && board[combi[0]] == board[combi[1]] && board[combi[1]] == board[combi[2]]
		return combi
		end
	end
	false
end

def full?(board)
 	[0,1,2,3,4,5,6,7,8].all? { |i| position_taken?(board, i)  }
end

def draw?(board)
	!won?(board) && full?(board)
end

def over?(board)
	won?(board) || full?(board)
end

def winner(board)
	combi = won?(board)
	if combi
		return board[combi[0]]
	end
	nil
end

