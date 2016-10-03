# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

#board = [" ", " ", " ", " ", " ", " ", "X", "X", "X",]
# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8], # Bottom row
  [0,3,6], # First column
  [1,4,7], # 2nd column
  [2,5,8], # 3rd column
  [0,4,8], # Diagonal
  [2,4,6]  # Diagonal
]


def won?(board)

    WIN_COMBINATIONS.each do |win|

    win_index_1 = win[0]
    win_index_2 = win[1]
    win_index_3 = win[2]

    position_1 = board[win_index_1] # load the value of the board at win_index_1
    position_2 = board[win_index_2] # load the value of the board at win_index_2
    position_3 = board[win_index_3] # load the value of the board at win_index_3

      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return win # return the win_combination indexes that won.
      end

      if position_1 == "O" && position_2 == "O" && position_3 == "O"
        return win # return the win_combination indexes that won.
      end

    end
    return false
end

def full?(board)
  board.all? do |index|
    if index != " "
      true
    end
  end

end

def draw?(board)
  if !won?(board)
    return true
  end
end

def over?(board)
  if won?(board) || draw?(board) && full?(board)
    return true
  end
end

def winner(board)
  spot = won?(board)
  if spot
  index = spot[0]
  pos = board[index]
  else
    nil
  end
#  puts pos
end

#winner(board)
