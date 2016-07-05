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
    [2,4,6],
]

def won?(board)
  board_x = board.each_index.select {|i| board[i] == "X"}
  board_o = board.each_index.select {|i| board[i] == "O"}
  WIN_COMBINATIONS.each do |win_combination|
    if win_combination.all?{|w| board_x.include?(w)} || win_combination.all?{|w| board_o.include?(w)}
      return win_combination
  end
end
return false
end

def full?(board)
  board.all? do |index|
    index != " "
  end
end

def draw?(board)
  if won?(board) == false && full?(board) == true
    return true
  end
end

def over?(board)
  won?(board) || full?(board) || draw?(board)
end

def winner(board)
  if won?(board)
    board[won?(board)[0]]
  end
end
