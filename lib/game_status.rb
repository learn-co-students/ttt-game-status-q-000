# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6]
  ]

def won?(board)
 WIN_COMBINATIONS.detect do |position|
    if board[position[0]] == "X" && board[position[1]] == "X" && board[position[2]] == "X"
      position
     elsif board[position[0]] == "O" && board[position[1]] == "O" && board[position[2]] == "O"
      position
     else
     false
   end
  end
end

def full?(board)
  board.all? do |cell|
    cell == "X" || cell == "O"
  end
end

def draw?(board)
  if !won?(board) && full?(board)
     true
  elsif
     !won?(board) && !full?(board)
     false
   else
    won?(board)
     false
   end
  end

def over?(board)
won?(board) || draw?(board) || full?(board)
end

def winner(board)
  if solution = won?(board)
  board[solution.first]
 else
  nil
 end
end 