# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom row
  [0,3,6], # First column
  [1,4,7], # Second column
  [2,5,8], # Third column
  [0,4,8], # Downward diagonal
  [6,4,2]  # Upward diagonal
]
=begin
def won?(board)
  xs = []
  os = []
  board.each do |position|
    if board[position] == "X"
      xs << position
    elsif board[position] == "O"
      os << position
    end
  end
end
=end

def won?(board)
  win_combination = []
  WIN_COMBINATIONS.each do |line|
    if line.all? { |pos| board[pos] == "X" }
      win_combination = line
    end
    if line.all? { |pos| board[pos] == "O" }
      win_combination = line
    end
  end
  if win_combination != []
    win_combination
  else
    false
  end
end

def full?(board)
  [*0..(board.length - 1)].all? do |location|
    position_taken?(board, location)
  end
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) || full?(board) || draw?(board)
end

def winner(board)
  if won?(board)
    board[won?(board)[0]]
  end
end