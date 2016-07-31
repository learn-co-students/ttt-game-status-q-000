# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  # horizontal wins
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom row

  # vertical wins
  [0,3,6], # Left column
  [1,4,7], # Middle column
  [2,5,8], # Right column

  # diagonal wins
  [0,4,8], # NW to SE
  [2,4,6]  # SW to NE
]

# won?
def won?(board)
  WIN_COMBINATIONS.detect do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1] # load the value of the board at win_index_1
    position_2 = board[win_index_2] # load the value of the board at win_index_2
    position_3 = board[win_index_3] # load the value of the board at win_index_3

    position_1 == position_2 && position_2 == position_3 && position_taken?(board, win_combination[0])
  end
end

# full?
def full?(board)
  board.all? do |i|
    i == "X" || i == "O"
  end
end

# draw?
def draw?(board)
  !won?(board) && full?(board)
end

#over?
def over?(board)
  won?(board) || draw?(board) || full?(board)
end

# winner
def winner(board)
  if won?(board)
    board[won?(board).first]
  end
end
