# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]

      position_1 = board[win_index_1] # load the value of the board at win_index_1
      position_2 = board[win_index_2] # load the value of the board at win_index_2
      position_3 = board[win_index_3] # load the value of the board at win_index_3

      if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
        return win_combination
      end
  end
  return false
end

def full?(board)
  board.each do |cell|
    if !(cell=="X"||cell=="O")
      return false
    end
  end
  return true
end

def draw?(board)
  if (!won?(board))&&full?(board)
    return true
  else
    return false
  end
end

def over?(board)
  if(draw?(board) || won?(board))
    return true
  else
    return false
  end
end

def winner(board)
  x_count = 0
  o_count = 0
  if won?(board)
    board.each do |cell|
      if cell=="X"
        x_count += 1
      end
      if cell=="O"
        o_count += 1
      end
    end
    if x_count > o_count
      return "X"
    end
    if o_count > x_count
      return "O"
    end
  end
end
