# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,4,8],
  [6,4,2],
  [0,3,6],
  [1,4,7],
  [2,5,8],
]

def won?(board)
  WIN_COMBINATIONS.detect do |win_array|
  #winning combo that matches the Xs on the board
  win_array.all?{|spot| board[spot] == "X"} || win_array.all?{|spot| board[spot] == "O"}
  end
end

def full?(board)
  WIN_COMBINATIONS.all? do |win_array|
    #all must be #position_taken == true
    win_array.all?{|spot| position_taken?(board, spot)}
  end
end

def draw?(board)
  #must be no winner
  if !won?(board) && full?(board)
    true
  else
    false
  end
end

def over?(board)
  #must have winner or draw
  if won?(board) || draw?(board)
    true
  else
    false
  end
end

def winner(board)
  #returns the character of the winning player
  if won?(board)
    combo = WIN_COMBINATIONS.detect{|win_array| win_array.all?{|spot| board[spot] == "X"} || win_array.all?{|spot| board[spot] == "O"}}
    answer = board[combo[0]]
  end
end
