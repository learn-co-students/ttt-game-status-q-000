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

  WIN_COMBINATIONS.detect do |combination|
    (board[combination[0]] == "X" && board[combination[1]] == "X" && board[combination[2]] == "X") ||
    (board[combination[0]] == "O" && board[combination[1]] == "O" && board[combination[2]] == "O")
  end #returns winning combination or nil

end

def full?(board)
  #!(board.include?("" || " "))
  !(board.any?{ |token| token == "" || token == " "}) #returns true if full
end

def draw?(board)
=begin
 if won?(board)
   false
 elsif full?(board)
   true
 else
   false
 end
=end
 if full?(board) && !(won?(board))
   true
 else
   false
 end

end

def over?(board)
 won?(board) || full?(board) || draw?(board)
end

def winner(board)
  if won?(board)
    board[won?(board)[0]]
  else
    nil
  end

end
