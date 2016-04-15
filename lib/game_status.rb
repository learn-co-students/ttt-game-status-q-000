# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]
 ]


def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    value_1 = board[win_index_1] # load the value of the board at win_index_1
    value_2 = board[win_index_2] # load the value of the board at win_index_2
    value_3 = board[win_index_3] # load the value of the board at win_index_3
    value_is_identic = (value_1 == value_2) && (value_2 == value_3 )
    all_positions_taken = position_taken?(board, win_index_1)  && position_taken?(board, win_index_2) && position_taken?(board, win_index_3)

    return win_combination if (all_positions_taken && value_is_identic)
  end
  return false
end

def full?(board)
  board.all? do |value| value == "X" or value == "O" end
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  won?(board) || full?(board) || draw?(board)
end

def winner(board)
  win_combination = won?(board)
  board[win_combination[0]] if win_combination
end
