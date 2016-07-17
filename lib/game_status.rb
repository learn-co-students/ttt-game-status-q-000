# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], #top row
  [3,4,5], #middle row
  [6,7,8], #bottom row
  [0,3,6], #left column
  [1,4,7], #middle column
  [2,5,8], #right column
  [0,4,8], #top left to bottom right diagonal
  [2,4,6] #top right to bottom left diagonal
]
# Define your won? Method
def won?(board)
  WIN_COMBINATIONS.each do |combo|
index_1 = combo[0]
token_1 = board[index_1]
index_2 = combo[1]
token_2 = board[index_2]
index_3 = combo[2]
token_3 = board[index_3]
   if token_1 == "X" && token_2 == "X" && token_3 == "X"
   return combo
   elsif token_1 == "O" && token_2 == "O" && token_3 == "O"
   return combo
   end
  end
  return false
end

def full?(board)
  board.all? do |token|
  token == "X" || token == "O"
  end
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  draw?(board) || won?(board)
end

def winner(board)
  if combo = won?(board)
  return board[combo[0]]
  end
end
