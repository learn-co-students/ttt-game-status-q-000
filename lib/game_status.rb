# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6]
  ]

# Check if game is won.
def won?(board)
  WIN_COMBINATIONS.each do |combo|
    match = combo.all? { |i| board[i] == "X" } || combo.all? { |i| board[i] == "O" }
    if match then return combo end
  end

  false
end

# Check if board is full
def full?(board)
  board.all? do |cell|
    !(cell.nil? || cell == " ")
  end
end

# Ckeck for draw
def draw?(board)
  full?(board) && !won?(board)
end

# Check if the is over
def over?(board)
  won?(board) || full?(board) || draw?(board)
end

# Return winning token
def winner(board)
  if won?(board)
    board[won?(board)[0]]
  end
end
