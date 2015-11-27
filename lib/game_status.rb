# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

WIN_COMBINATIONS = [
  [0,1,2],[3,4,5],
  [6,7,8],[0,3,6],
  [1,4,7],[2,5,8],
  [0,4,8],[6,4,2]]

def won?(board)
  WIN_COMBINATIONS.select do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]
    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]
    if (position_1 == "X" && position_2 == "X" && position_3 == "X") ||
       (position_1 == "O" && position_2 == "O" && position_3 == "O")
        win_combination
    end
  end[0]
end

def full?(board)
  board.all? do |full|
   full == "X" || full == "O"
  end
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  full?(board) || draw?(board) || won?(board)
end

def winner(board)
  if won?(board)
    if won?(board).all? do |x_won|
      board[x_won] == "X"
    end
    "X"
    elsif won?(board).all? do |o_won|
     board[o_won] == "O"
    end
    "O"
    end
  end
end

