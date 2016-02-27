#determines if position is occupied, returns true/false
def position_taken?(board, location)
  return !(board[location].nil? || board[location] == " ")
end

#WIN_COMBINATIONS constant, all 8 possible wins
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6],
]

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    win_index1 = win_combination[0]
    win_index2 = win_combination[1]
    win_index3 = win_combination[2]

    board_position1 = board[win_index1]
    board_position2 = board[win_index2]
    board_position3 = board[win_index3]

    if board_position1 == "X" && board_position2 == "X" && board_position3 == "X"
      return win_combination
    elsif board_position1 == 'O' && board_position2 == 'O' && board_position3 == 'O'
      return win_combination
    end
  end #end of each method
  #Must have the return false AFTER each method so it will return false prematurely
  return false
end #end of won? method

def full?(board)
  board.none? {|position| position == " "}
end

def draw?(board)
  if won?(board) == false && full?(board)
    return true
  elsif won?(board) == false && full?(board) == false
    return false
  elsif won?(board) == true
    return false
  end
end

def over?(board)
  if draw?(board) || won?(board)
    return true
  else
    return false
  end
end

def winner(board)
  if won?(board)
    winning_array = won?(board)
    return board[winning_array[0]]
  else
    return nil
  end
end









