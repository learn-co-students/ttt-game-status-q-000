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
  [2,4,6]
]

def won?(board)
  WIN_COMBINATIONS.select do |win_combo|
   (board[win_combo[0]] == "X" && board[win_combo[1]] == "X" && board[win_combo[2]] == "X") || (board[win_combo[0]] == "O" && board[win_combo[1]] == "O" && board[win_combo[2]] == "O")
  end.flatten!
end

def full?(board)
  !(board.include?(" "))
end

def draw?(board)
  if won?(board) == nil && full?(board) == true
    true
  else
    false
  end
end

def over?(board)
  if won?(board) == true || draw?(board) == true || full?(board) == true
    true
  else
    false
  end
end

def winner(board)
  if won?(board) == nil
    nil
  else
    winning_board = won?(board)
    winning_move_1 = winning_board[0]
    winning_move_2 = winning_board[1]
    winning_move_3 = winning_board[2]
      if board[winning_move_1] == "X" && board[winning_move_2] == "X" && board[winning_move_3] == "X"
        "X"
      elsif board[winning_move_1] == "O" && board[winning_move_2] == "O" && board[winning_move_3] == "O"
        "O"
      else
        nil
      end
  end
end
