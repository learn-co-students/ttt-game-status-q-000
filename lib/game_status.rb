
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

WIN_COMBINATIONS = [
  [0,1,2],
  [0,3,6],
  [0,4,8],
  [1,4,7],
  [2,5,8],
  [3,4,5],
  [6,7,8],
  [6,4,2]  
] 

def won?(board)
  WIN_COMBINATIONS.each do |win_combo|
    if win_combo.all? {|index| board[index] == "X" }
      return win_combo
    elsif win_combo.all? {|index| board[index] == "O"}
       return win_combo
    end
  end
  false
end

def full?(board)
  if board.all? { |all| all == "X" || all == "O" } && won?(board) == false
    return true
  else 
    return false
  end
end 

def draw?(board)
  if board.all? { |all| all == "X" || all == "O" } && won?(board) == false
     return true
  elsif won?(board) == false && board.detect { |i| i == " "} 
     return false
  else won?(board) == true 
    return false
  end 
end

def over?(board)
  if board.all? { |all| all == "X" || all == "O" } || draw?(board) == true  
     return true
  elsif board.detect { |i| i == " "} && won?(board) == false
     return false 
  end 
end

def winner(board)
 nil
  WIN_COMBINATIONS.each do |win_combo|
    if win_combo.all? {|index| board[index] == "X" }
      return "X"
    elsif win_combo.all? {|index| board[index] == "O"}
       return "O"
    end
    end 
    nil 
end


