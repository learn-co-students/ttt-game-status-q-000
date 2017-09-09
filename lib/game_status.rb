# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], #Top horizontal
  [3,4,5], #Mid horizontal
  [6,7,8], #Bot horizontal
  [0,3,6], #Left vertical
  [1,4,7], #Mid vertical
  [2,5,8], #Right vertical
  [0,4,8], #Downward diagonal
  [2,4,6] #Upward diagonal
]

def won?(board)
  WIN_COMBINATIONS.each do |combination|
    if combination.all?{|index| board[index] == "X"} || combination.all?{|index| board[index] == "O"}
      return combination
    end
  end
  false
end

def full?(board)
  board.all?{|tile| !(tile.nil? || tile == " ")}
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  full?(board) || won?(board)
end

def winner(board)
  if won?(board) && won?(board).all?{|index| board[index] == "X"}
    "X"
  elsif won?(board) && won?(board).all?{|index| board[index] == "O"}
    "O"
  end
end
