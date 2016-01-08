# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom row
  [0,3,6], # Left column
  [1,4,7], # Middle column
  [2,5,8], # Right column
  [0,4,8], # Top left to bottom right
  [2,4,6]  # Top right to bottom left
]

def won?(board)
    WIN_COMBINATIONS.find do |win_line|
    board[win_line[0]] == board[win_line[1]] &&
    board[win_line[1]] == board[win_line[2]] &&
    win_line.all? { |counter| board[counter] == "X" } || win_line.all? { |counter| board[counter] == "O" }
  end
end

def full?(board)
  board.all? { |counter| counter == "X" || counter == "O"}
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) || full?(board) || draw?(board)
end

def winner(board)
  if won?(board)
  return board[won?(board)[0]]
  else
  return nil
  end
end