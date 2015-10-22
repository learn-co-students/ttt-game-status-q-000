# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], #Top row
  [3,4,5], #Middle row
  [6,7,8], #Bottom row
  [0,3,6], #Left column
  [1,4,7], #Middle column
  [2,5,8], #Right column
  [0,4,8], #Diagonal 1
  [2,4,6]  #Diagonal 2
]

def won?(board)
  WIN_COMBINATIONS.detect do |combination|
    combination = combination.all? do |character|
      board[character] == "X"
      end ||
    combination.all? do |character|
      board[character] == "O"
    end
    combination == true
  end
end

def full?(board)
  board.all? do |character|
    character == "X" || character == "O"
  end
end

def draw?(board)
  if won?(board) == nil && full?(board) == true
    true
  else
    false
  end
end

def over?(board)
  if won?(board) == true || draw?(board) == true || full?(board) == true
    true
  else
    false
  end
end

def winner(board)
  if won?(board) == nil
    nil
  else
    board[won?(board)[0]]
  end
end