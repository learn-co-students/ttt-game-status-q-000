# Helper Method
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

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def won?(board)
  board_x = board.each_index.select{ |i| board[i] == "X" }
  board_o = board.each_index.select{ |i| board[i] == "O" }
  result = false
  WIN_COMBINATIONS.each do |win_combination|
    if win_combination.all?{ |w| board_x.include?(w) } || win_combination.all?{ |w| board_o.include?(w)}
      result = win_combination
      break;
    end
  end
  result
end

def full?(board)
  board.all?{ |b| b != " " && b != "" && b != nil}
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  won?(board) || draw?(board)
end

def winner(board)
  if over?(board) && won?(board) != false
    board[won?(board)[0]]
  else
    nil
  end
end
