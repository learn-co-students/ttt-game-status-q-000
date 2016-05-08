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

def won?(board)
  WIN_COMBINATIONS.each do |win_combo|
    return win_combo if win_combo.all? {|position| board[position] == "X"}
    return win_combo if win_combo.all? {|position| board[position] == "O"}
  end
  return false if board.all? { |position| position != " "}
  return false if board.all? { |position| position == " "}
end

def full?(board)
  return false if won?(board)==false && draw?(board)==false
  return true if won?(board)==false && draw?(board)==true
end


 def draw?(board)
   if won?(board) == false || full?(board) == true
     return true
   end
end

 def over?(board)
   return true if (won?(board) || draw?(board) || full?(board))
 end

 def winner(board)
   WIN_COMBINATIONS.each do |winner|
     return "X" if winner.all? {|pos| board[pos] == "X"}
     return "O" if winner.all? {|pos| board[pos] == "O"}
   end
   return nil
 end
