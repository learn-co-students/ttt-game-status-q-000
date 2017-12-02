# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

board = [" ", " ", " ", " ", " ", " ", " ", " ", " ",]

WIN_COMBINATIONS = [
top_row_win = [0, 1, 2],
middle_row_win = [3, 4, 5],
bottom_row_win = [6, 7, 8],
left_column_win = [0, 3, 6],
middle_column_win = [1, 4, 7],
right_column_win = [2, 5, 8],
left_diagonal_win = [0, 4, 8],
right_diagonal_win = [6, 4, 2]
]

def won?(board)
  WIN_COMBINATIONS.each do |winning_space|
    win_index_1 = winning_space[0]
    win_index_2 = winning_space[1]
    win_index_3 = winning_space[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return winning_space 
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return winning_space
    end
  end
  return false
end


def full?(board)
board.all? {|square| square == "X" || square == "O"}
end

def draw?(board)
if !won?(board) && full?(board)
  return true 
elsif !won?(board) && !full?(board)
  return false
else won?(board)
  return false
end
end

def over?(board)
if won?(board) && draw?(board) || full?(board)
  return true
end

end

def winner(board)
  indices = won?(board)
  if indices
    board[indices[0]]
  else
    return nil
  end
end