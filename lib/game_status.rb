# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
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

def full?(board)
  !board.include? " "
end

def over?(board)
  won?(board) || draw?(board)
end

def winner(board)
    board[won?(board).detect {|i| i }]
end

def draw?(board)
  !won?(board) && full?(board)
end

def won?(board)
    WIN_COMBINATIONS.detect do |win_combination|
      win_index_1 = win_combination[0] #index 0
      win_index_2 = win_combination[1] #index 1
      win_index_3 = win_combination[2] #index 2

      position_1 = board[win_index_1] # load the value of the board at win_index_1
      position_2 = board[win_index_2] # load the value of the board at win_index_2
      position_3 = board[win_index_3] # load the value of the board at win_index_3

      (position_1 == "X" && position_2 == "X" && position_3 == "X") ||
      (position_1 == "O" && position_2 == "O" && position_3 == "O")

    end

end
