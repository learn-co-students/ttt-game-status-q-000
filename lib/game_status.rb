# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], [3,4,5], [6,7,8],
  [0,4,8], [0,3,6], [1,4,7],
  [2,4,6], [2,5,8]
  ]

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    position_1 = board[win_combination[0]]
    position_2 = board[win_combination[1]]
    position_3 = board[win_combination[2]]

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combination
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combination
    end
  end
  #if no win_combination has been returned, it's a blank board or a draw.
  return false
end

def full?(board)
  board.include?(" ") ? false : true
end

def draw?(board)
  won?(board) ? false : true
end

def over?(board)
  #(won?(board) || draw?(board)) ? true : false
  return true if won?(board)
  return true if (draw?(board) && full?(board))
end

def winner(board)
  if won?(board)
    winner = won?(board)
    winner = board[winner[0]]
  else
    return nil
  end
end


