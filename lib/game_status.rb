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
  [2,4,6]
]

#return false/nil if there is no win combination present 
#in the board and return the winning combination indexes as an array if there is a win.
 def won?(board)
  WIN_COMBINATIONS.detect do |combo|
     board[combo[0]] == board[combo[1]] && board[combo[1]] == board[combo[2]] && position_taken?(board, combo[0])
  end
 end

#return true if every element in the board contains either an "X" or an "O"
def full?(board)
  board.all? {|x| x != " "}
end

#returns true if the board has not been won and is full 
#and false if the board is not won and the board is not full, and false if the board is won
def draw?(board)
  if won?(board) 
    false 
  else full?(board) 
  end
end

#returns true if the board has been won, is a draw, or is full. 
def over?(board)
  won?(board) || full?(board)
end

#return the token, "X" or "O" that has won the game given a winning board
def winner(board)
  if won?(board)[0] = "X"
    return "X"
  elsif won?(board)[0] = "O"
    return "O"
  else
    return false
  end  
end



