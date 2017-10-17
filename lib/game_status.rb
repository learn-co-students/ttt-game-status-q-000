# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
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
    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]
    if ((position_1 == "X" && position_2 == "X" && position_3 == "X") || 
      (position_1 == "O" && position_2 == "O" && position_3 == "O"))
      return win_combination
    end
  end
  false
end

def full?(board)
  if board.include?("") || board.include?(" ") || board.include?(nil)
    false
  else
    true
  end
end

def draw?(board)
  if !won?(board) && full?(board)
    true
  else
    false
  end
end

def over?(board)
  if won?(board) or full?(board) or draw?(board)
    true
  else
    false
  end
end

def winner(board)
  if won?(board)
    win_combination = won?(board)
    if board[win_combination[0]] == "X"
      return "X"
    else
      return "O"
    end
  else
    return nil
  end
end

winner(["X", " ", " ", " ", "X", " ", " ", " ", "X"])




