WIN_COMBINATIONS = [
  [0, 1, 2],
  [6, 7, 8],
  [2, 5, 8],
  [0, 3, 6],
  [1, 4, 7],
  [3, 4, 5],
  [0, 4, 8],
  [2, 4, 6]
]

def won?(board)
  WIN_COMBINATIONS.find do |win_combo|
    x_wins = win_combo.all? { |pos| board[pos] == "X" }
    o_wins = win_combo.all? { |pos| board[pos] == "O" }
    return win_combo if x_wins || o_wins
  end
end

def full?(board)
 board.all? { |pos| pos != " " } 
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  board.all? { |pos| pos == "X" || pos == "O" }
end

def winner(board)
  won?(board) ? board[won?(board)[0]] : nil
end
