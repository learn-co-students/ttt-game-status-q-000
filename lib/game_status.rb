board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

WIN_COMBINATIONS = [
  [0,1,2], [3,4,5], [6,7,8],
  [0,3,6], [1,4,7,], [2,5,8],
  [0,4,8], [2,4,6]
  ]

def won?(board)
  WIN_COMBINATIONS.find do |comb|
    if position_taken?(board,comb[0])
      $win = board[comb[0]]
      comb.all? {|ind| board[ind] == $win}
    end
  end
end

def full?(board)
  ind = [0,1,2,3,4,5,6,7,8]
  ind.all? {|i| position_taken?(board, i)}
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) || full?(board) || draw?(board)
end

def winner(board)
  if won?(board)
    $win == "X" ? "X" : "O"
  end
end
