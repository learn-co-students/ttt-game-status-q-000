# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS =[
[0,1,2],	# Top Row
[3,4,5],	# Middle Row
[6,7,8],	# Bottom Row
[0,3,6],	#First Vertical
[1,4,7],	#Second Vertical
[2,5,8],	#Third Vertical
[0,4,8],	#Diagonal Down
[2,4,6],	#Diagonal Up
]

def won?(board)
	WIN_COMBINATIONS.each do |win_combination|

	win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1] 
    position_2 = board[win_index_2] 
    position_3 = board[win_index_3]
    
    if position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 == "O"
        return win_combination   
    end
	end
	false
end

def full?(board)
	if board.any?{|value| value == " "}
  		return false
	else
		return true
	end
end

def draw?(board)
	if won?(board) == true
		return false
	elsif !won?(board) && full?(board)
		return true
	elsif !won?(board) && !full?(board)
		return false
	end
end

def over?(board)
	if won?(board) || draw?(board) || full?(board)
		return true
	end
end

def winner(board)
  if won?(board) == false
    nil
  elsif board[won?(board)[0]] =="X"
    "X"
  elsif board[won?(board)[0]] == "O"
    "O"
  end
end




