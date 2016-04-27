require 'pry'
# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

def won?(board)
  WIN_COMBINATIONS.detect do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

    $x_won_condition = position_1 == "X" && position_2 == "X" && position_3 == "X"  
    $o_won_condition = position_1 == "O" && position_2 == "O" && position_3 == "O"

    if $x_won_condition || $o_won_condition
      return win_combination
    elsif board.all?{|i| i == " "} || (board.none?{|i| i == " "} && !$won_condition)
      return false
    else
      false
    end
end
end

def full?(board)
  if position_taken?
    true
  else 
    false
  end
end

def draw?(board)
  if !won?(board) && full?(board)
    true
  else
    false
  end
end
# binding.pry
def over?(board)
  if won?(board) || draw?(board) || full?(board)
    return true
  else 
    false
  end
end

def winner(board)
  if won?(board) && $o_won_condition
    "O"
  elsif won?(board) && $x_won_condition
    "X"
  end
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]