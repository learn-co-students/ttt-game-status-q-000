# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,4,8],[2,4,6],[0,3,6],[2,5,8],[1,4,7]]

def won?(board)



  top_row_win = [0,1,2]
  middle_row_win = [3,4,5]
  bottom_row_win = [6,7,8]
  left_diagonal_win =[0,4,8]
  right_diagonal_win =[2,4,6]
  left_column_win = [0,3,6]
  right_column_win = [2,5,8]
  middle_column_win = [1,4,7]

  if board[top_row_win[0]] == "X" && board[top_row_win[1]] == "X" && board[top_row_win[2]] == "X" || board[top_row_win[0]] == "O" && board[top_row_win[1]] == "O" && board[top_row_win[2]] == "O"
    return WIN_COMBINATIONS[0]
    elsif board[middle_row_win[0]] == "X" && board[middle_row_win[1]] == "X" && board[middle_row_win[2]] == "X" || board[middle_row_win[0]] == "O" && board[middle_row_win[1]] == "O" && board[middle_row_win[2]] == "O"
    return WIN_COMBINATIONS[1]
    elsif board[bottom_row_win[0]] == "X" && board[bottom_row_win[1]] == "X" && board[bottom_row_win[2]] == "X" || board[bottom_row_win[0]] == "O" && board[bottom_row_win[1]] == "O" && board[bottom_row_win[2]] == "O"
    return WIN_COMBINATIONS[2]
    elsif board[left_diagonal_win[0]] == "X" && board[left_diagonal_win[1]] == "X" && board[left_diagonal_win[2]] == "X" || board[left_diagonal_win[0]] == "O" && board[left_diagonal_win[1]] == "O" && board[left_diagonal_win[2]] == "O"
    return WIN_COMBINATIONS[3]
    elsif board[right_diagonal_win[0]] == "X" && board[right_diagonal_win[1]] == "X" && board[right_diagonal_win[2]] == "X" || board[right_diagonal_win[0]] == "O" && board[right_diagonal_win[1]] == "O" && board[right_diagonal_win[2]] == "O"
    return WIN_COMBINATIONS[4]
    elsif board[left_column_win[0]] == "X" && board[left_column_win[1]] == "X" && board[left_column_win[2]] == "X" || board[left_column_win[0]] == "O" && board[left_column_win[1]] == "O" && board[left_column_win[2]] == "O"
    return WIN_COMBINATIONS[5]
    elsif board[right_column_win[0]] == "X" && board[right_column_win[1]] == "X" && board[right_column_win[2]] == "X" || board[right_column_win[0]] == "O" && board[right_column_win[1]] == "O" && board[right_column_win[2]] == "O"
    return WIN_COMBINATIONS[6]
    elsif board[middle_column_win[0]] == "X" && board[middle_column_win[1]] == "X" && board[middle_column_win[2]] == "X" || board[middle_column_win[0]] == "O" && board[middle_column_win[1]] == "O" && board[middle_column_win[2]] == "O"
    return WIN_COMBINATIONS[7]
  end
end

def full?(board)
  board.all? {|string| string == "X" || string == "O"}
end

def draw?(board)
  if full?(board) && !won?(board)
    true
  end
end

def over?(board)
  if draw?(board) || won?(board)
    true
  end
end


def winner(board)
  if won?(board)
    return board[won?(board)[0]]
  end
end