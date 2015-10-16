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
   [6,4,2]
    ]

def won?(board)
WIN_COMBINATIONS.each do |index|
  return index if index.all? {|position| board[position] == "X" }
  return index if index.all? {|position| board[position] == "O" }
end
false
end


def full?(board)
  !board.include?(" ")
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  (won?(board) || draw?(board)) ? true : false
end

def winner(board)
  WIN_COMBINATIONS.each do |index|
  return "X" if index.all? {|position| board[position] == "X" }
  return "O" if index.all? {|position| board[position] == "O" }
end
nil
end




