# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

#all_odd = [1,3].all? do |number|
  #number.odd? # Will evaluate to true for 1, true for 3
#end #=> true
#all_odd

# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS = [
  [0,1,2], 
  [3,4,5],
  [6,7,8],
  [0,4,8],
  [2,4,6],
  [0,3,6],
  [1,4,7],
  [2,5,8]
]

def won?(board)
    WIN_COMBINATIONS.each do |winning|
    if board[winning[0]].eql?("X") && board[winning[1]].eql?("X") && board[winning[2]].eql?("X")
        return winning
    elsif board[winning[0]].eql?("O") && board[winning[1]].eql?("O") && board[winning[2]].eql?("O")
        return winning
    end
  end
  return nil
end

def full?(board)
  return !board.include?(" ")
end

def draw?(board)
  if !full?(board) && !won?(board)
    return false
  elsif won?(board)
    return false
  elsif !full?(board)
    return false
  end
  return true
end

def over?(board)
  if full?(board) || won?(board) || draw?(board)
    return true
  end
  return false
end

def winner(board)
  winning_indexes = won?(board)
  if winning_indexes != nil && winning_indexes.count == 3
    return board[winning_indexes[0]]
  end
  return nil
end
