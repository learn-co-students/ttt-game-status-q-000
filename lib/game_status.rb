# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
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

def xs_n_os(board)
  xs = []
  os = []
  board.each_with_index do |item, idx|
    if item == "X" then xs << idx end
    if item == "O" then os << idx end
  end
  return [xs, os]
end

def won?(board)
  xs_n_os = xs_n_os(board)
  WIN_COMBINATIONS.each do |com|
    if com.all?{|pos| xs_n_os[0].include?(pos)} then return com end
    if com.all?{|pos| xs_n_os[1].include?(pos)} then return com end
  end
  return false
end

def full?(board)
  return board.all?{|item| ["X", "O"].include?(item)}
end

def draw?(board)
  return (full?(board) && !won?(board))
end

def over?(board)
  return (draw?(board) || won?(board))
end

def winner(board)
  win = won?(board)
  if win == false then return nil end
  return board[win[0]]
end