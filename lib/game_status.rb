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
WIN_COMBINATIONS.each do |win|
     win_index_1 = win[0]
     win_index_2 = win[1]
     win_index_3 = win[2]

     position_1 = board[win_index_1]
     position_2 = board[win_index_2]
     position_3 = board[win_index_3]
      if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 ==  "O" && position_3 == "O")
        return win
      end
    end
    false
end

def full?(board)
  board.all? do |index|
    index == "X" || index == "O"
  end
end

def draw?(board)
  if full?(board) && !(won?(board))
    true
  else
	false
  end
end

def over?(board)
  if won?(board) || draw?(board) || full?(board)
    true
  else
	false
  end
end

def winner(board)
  result = won?(board)
  if result != false && result != nil
    return board[result[0]]
  end
  nil
end