# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end
# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8],
  [0,3,6], # Top row
  [1,4,7],  # Middle row
  [2,5,8],
  [0,4,8], # Top row
  [2,4,6]  # Middle row # ETC, an array for each win combination
]
def won?(board)
  WIN_COMBINATIONS.each do |combination|
    return combination if combination.all?{|spot| board[spot]=="X"}
    return combination if combination.all?{|spot| board[spot]=="O"}
  end
  return false
end

def full?(board)
  return true if board.all?{|x| x=="X" || x=="O"}
  return false
end

def draw?(board)
  return true if full?(board) && !(won?(board))
  return false
end

def over?(board)
  return true if draw?(board) || won?(board) || full?(board)
  return false
end

def winner(board)
  return board[won?(board)[0]] if won?(board)
  return nil
end