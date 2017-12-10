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
	[2,4,6]
]

def won?(board)
  won_combo = nil

  WIN_COMBINATIONS.each do |combo|
    position_1 = combo[0]
    position_2 = combo[1]
    position_3 = combo[2]

    if board[position_1] == "X" && board[position_2] == "X" && board[position_3] == "X"
      won_combo = combo
    elsif board[position_1] == "O" && board[position_2] == "O" && board[position_3] == "O"
      won_combo = combo
    end
  end
  won_combo
end

def full?(board)
	board.all? {|e| e == "X" || e == "O"}
end

def draw?(board)
	full?(board) && !won?(board)
end

def over?(board)
	won?(board) || draw?(board) || full?(board)
end

def winner(board)
	won?(board) ? board[won?(board)[0]] : nil
end
