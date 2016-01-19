board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS = [
 [0, 1, 2], #top row win
 [3, 4, 5], #middle row win
 [6, 7, 8], #bottom row win
 [0, 3, 6], #left row win
 [1, 4, 7], #middle_2 row win
 [2, 5, 8], #right row win
 [0, 4, 8], #diag l_r row win
 [2, 4, 6] #diag r_l row win
]

def won?(board)
  WIN_COMBINATIONS.each do |x|
    win_index_1 = x[0]
    win_index_2 = x[1]
    win_index_3 = x[2]
    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]
    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return x.to_a
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return x.to_a
  end
  end
  return nil
end

def full?(board)
  !board.any?{|x| x == " " || x == "" }
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) || full?(board) || draw?(board)
end

def winner(board)
  combination = won?(board)
    if combination
      board[combination[0]]
    else
      return nil
    end
end