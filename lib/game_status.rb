# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0,1,2],
                  [3,4,5],
                  [6,7,8],
                  [0,3,6],
                  [1,4,7],
                  [2,5,8],
                  [0,4,8],
                  [2,4,6]]
                  
#
# I suspect this code is fragile
# It's from someone with some C background
#
#def won?(board)
#  WIN_COMBINATIONS.each do |win_combination|
#    if board[win_combination[0]] != " " && 
#      ((board[win_combination[0]] == board[win_combination[1]]) &&
#      (board[win_combination[1]] == board[win_combination[2]]))
#      return win_combination
#    end
#  end
#  return false
#end

def won?(board)
  WIN_COMBINATIONS.each do |win_combination| 
    position = { one: board[win_combination[0]],
                 two: board[win_combination[1]],
                 three: board[win_combination[2]] }

    if position[:one] == 'X' && position[:two] == 'X' && position[:three] == 'X'
      return win_combination
    elsif position[:one] == 'O' && position[:two] == 'O' && position[:three] == 'O'
      return win_combination
    end
  end
  false
end

def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

def draw?(board)
  full?(board) && !won?(board)
  # if won?(board) == false && full?(board) == true
  #   true
  # elsif won?(board) == true
  #   false
  # else
  #   false
  # end
end

def full?(board)
  board.include?(" ") ? false : true
  # if board.include?(" ")
  #   false
  # else
  #   true
  # end
end

def over?(board)
  won?(board) || draw?(board)
end

def winner(board)
  position = won?(board)
  if won?(board) == false
    nil
  elsif board[position[0]] == 'X' && board[position[1]] == 'X' && board[position[2]] == 'X'
    'X'
  elsif board[position[0]] == 'O' && board[position[1]] == 'O' && board[position[2]] == 'O'
    'O'
  end
end
