# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],
  [0,3,6],[1,4,7],[2,5,8],
  [0,4,8],[2,4,6]
  ]

def won?(board)
  win_combination = WIN_COMBINATIONS.find do |win_combination|
    win_combination.all? {|index| board[index]=="X"} or win_combination.all? {|index| board[index]=="O"}
  end
  if win_combination == nil
    return false
  else
    return win_combination
  end
end

def full?(board)
  board.all?{|space| space =="X" || space =="O"}
end

def draw?(board)
  return true if full?(board) && won?(board)==false
end

def over?(board)
  return true if won?(board)!=false||draw?(board)
end

def winner(board)
  if won?(board)!=false
    board[won?(board)[0]]
  end
end