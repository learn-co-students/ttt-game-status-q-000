# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # top row
  [0,3,6], # first column
  [0,4,8], # down diagonal
  [1,4,7], # middle column
  [2,4,6], # up diagonal
  [2,5,8], # last column
  [3,4,5], # middle row
  [6,7,8]  # bottom row
]

def won?(board)
  WIN_COMBINATIONS.detect do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1] # load the value of the board at win_index_1
    position_2 = board[win_index_2] # load the value of the board at win_index_2
    position_3 = board[win_index_3] # load the value of the board at win_index_3

    x_win = position_1 == "X" && position_2 == "X" && position_3 =="X"
    o_win = position_1 == "O" && position_2 == "O" && position_3 =="O"

    x_win || o_win
  end
end

def full?(board)
  board.none? do |location|
    location == " " || location == "" || location == nil
  end
end

def draw?(board)
  won?(board) == nil && full?(board)
end

def over?(board)
  won?(board) || full?(board)
end

def winner(board)
  if won?(board)
    puts "DEBUG: #{won?(board)[0]}"
    if board[won?(board)[0]] == "X"
      "X"
    else
      "O"
    end
  else
    nil
  end
end