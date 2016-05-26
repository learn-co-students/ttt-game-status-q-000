# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

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
  WIN_COMBINATIONS.any? do |w|
    #if ["X","O"].include?(board[w[0]]) and
    if position_taken?(board,w[0]) and
     board[w[0]] == board[w[1]] and board[w[1]] == board[w[2]] then
     return w
    end
  end
  false
end

def full?(board)
  (0..8).all? { |i| position_taken?(board,i) }
end

def draw?(board)
  full?(board) and !won?(board)
end

def over?(board)
  won?(board) or draw?(board) #or full?(board) there is no full which isn't win or draw.
end

def winner(board)
  w = won?(board)
  if w then board[w[0]] end
end 
