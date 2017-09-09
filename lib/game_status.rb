require 'pry'
# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
	[0,1,2], #top row
	[3,4,5], #middle row
	[6,7,8], #bottem row
	[0,3,6], #left column
	[1,4,7], #middle column
	[2,5,8], #right column
	[0,4,8], #top left to bottom right
	[2,4,6]  #top right to bottom left
]
def won?(board)
  WIN_COMBINATIONS.each do |item|
  	# i = board.values_at(item[0], item[1], item[2]).uniq
    # if i[0] == "X" || i[0] == "O"
  	if board[item[0]] == "X" && board[item[1]] == "X" && board[item[2]] == "X"
      return item
    elsif board[item[0]] == "O" && board[item[1]] == "O" && board[item[2]] == "O"
      return item
    end
  end
  else 
  	false
end

def full?(board)
    board.all?{|element| element == "X" || element == "O"}
end

def draw?(board)
	 if won?(board) && full?(board)
	 	return false 
	 elsif full?(board)
	    return true
	 end	
end

def over?(board)
	if !full?(board)
		return false
	elsif draw?(board)
		return true
	elsif won?(board)
		return true 	
	end
end

def winner(board)
	
	if won?(board)
		board[won?(board)[0]]
	end 
end


