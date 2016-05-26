def won?(board)
  board.any? do |position| (position == "X" || position == "O") end

    WIN_COMBINATIONS.detect do |win_combination| 
        win_index_1 = win_combination[0]
        win_index_2 = win_combination[1]
        win_index_3 = win_combination[2]
        position_1 = board[win_index_1]
        position_2 = board[win_index_2]
        position_3 = board[win_index_3]
        position = [position_1, position_2, position_3]
        position.all? {|p| p == "X"} || position.all? {|p| p == "O"}
      end
end

def full?(board)
  board.all? {|p| p != " "}
end

def draw?(board)
  won?(board) == nil && full?(board) == true
end

def over?(board)
  won?(board) || draw?(board) || full?(board)
end

def winner(board)
  if won?(board) == nil
    return nil
  else board[won?(board)[0]]
  end
end

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
