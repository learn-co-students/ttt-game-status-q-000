# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
    [0, 1, 2], # top_row_win
    [3, 4, 5], # middle_row_win
    [6, 7, 8], # bottom_row_win
    [0, 3, 6], # left_col_win
    [1, 4, 7], # middle_col_win
    [2, 5, 8], # right_col_win
    [0, 4, 8], # left_diag_win
    [2, 4, 6]  # right_diag_win
  ]

# this method passes
def won?(board)
  WIN_COMBINATIONS.detect do |win_combo|
    win_combo.all? {|win_play| board[win_play] == "X"} || win_combo.all? {|win_play| board[win_play] == "O"}
  end
end

# this method passes
def full?(board)
  board.all? do |full|
    full == "X" || full == "O"
  end
end

# this method passes
def draw?(board)
  if won?(board)
    return false
  else
    board.all? do |draw|
      draw == "X" || draw == "O"
    end
  end
end

# this method passes
def over?(board)
  return :won? if won?(board)
  return :draw? if draw?(board)
  false
end

# this method passes
def winner(board)
  if won?(board)
    if board[won?(board)[0]]  == "X"
       return "X"
    elsif board[won?(board)[0]] == "O"
       return "O"
    end
 else
   return nil
 end
end