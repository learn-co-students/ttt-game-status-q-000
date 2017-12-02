# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

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
  WIN_COMBINATIONS.detect do |win_combo|
   return win_combo if win_combo.all? { |position| board[position] == "X" }
   return win_combo if win_combo.all? { |position| board[position] == "O" }
   end
end

def full?(board)
  board.all?{|i| i == "X" || i == "O"}
end

def draw?(board)
  full?(board)
  !won?(board)
end

def over?(board)
  return true if full?(board)
  return false if draw?(board)
  return true if won?(board)
end

def winner(board)
  WIN_COMBINATIONS.find  do |win_combo|
    return "X" if win_combo.all? {|position| board[position] == "X" } 
    return "O" if win_combo.all? {|position| board[position] == "O" }
  end
end











