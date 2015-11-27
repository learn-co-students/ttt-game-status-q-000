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

# working on it
def full?(board)
  #board.detect {|full| full.is_a?("X")} || board.detect {|full| full.is_a?("O")}
  #board.any?{|position| position_taken(location) == "X"}
  #board.inclde?("X")
  #board.include?("O")
  board.any? {|filled| filled == "X"} && board.any? {|filled| filled == ""}
  #board.each {|filled| filled ? true : false}
end

def draw?(board)
  #board.map{|cell| cell.value}.none_empty?
end

def over?(board)
  #return :winner if winner?
  #return :draw if draw?
  #false
end

def winner(board)
  #(0..2).each do |i|
  #  if board[i][0] == board[i][1] && board[i][1] == board[i][2]
  #    return board[i][0] unless board[i][0] == " "

  #  elsif board[0][i] == board[1][i] && board[1][i] == board[2][i]
  #    return board[0][i] unless board[0][i] == " "
  #  end
  #end
  #  if ( board[0][0] == board[1][1] && board[1][1] == board[2][2] ) ||
  #     ( board[0][2] == board[1][1] && board[1][1] == board[2][0] )
  #  return board[1][1] unless board[1][1] == " "
  #  end
end