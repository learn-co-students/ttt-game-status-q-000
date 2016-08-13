# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # top row
  [3,4,5], # middle row
  [6,7,8], # bottom row
  [0,3,6], # left column
  [1,4,7], # middle column
  [2,5,8], # right column
  [0,4,8], # diagonal 1
  [2,4,6] # diagonal 2
]

#define a method to check for winning combinations
def won?(board)
  win_combo = nil
  WIN_COMBINATIONS.each do |win_combination|
#    win_index_1 = win_combination[0] alternative method to do using variable assign
#    win_index_2 = win_combination[1]
#    win_index_3 = win_combination[2]
    position_1 = board[win_combination[0]] # load the value of the board at win_index_1
    position_2 = board[win_combination[1]] # load the value of the board at win_index_2
    position_3 = board[win_combination[2]] # load the value of the board at win_index_3
    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      win_combo = win_combination # return the win_combination indexes that won.
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      win_combo = win_combination
    end
  end
  win_combo
end

def full?(board)
  board.all? {|x| x != " "}
end

def draw?(board)
  if won?(board) == nil && full?(board) == true
    return true
  end
end

def over?(board)
  if won?(board) != nil || draw?(board) == true || full?(board) == true
    return true
  end
end

def winner(board)
  token = nil
  if won?(board) != nil
    win_combo = won?(board)
    token = board[win_combo[0]]
  end
  token
end
