# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

def won?(board)
  WIN_COMBINATIONS.each do |combination|
    cell1 = board[combination[0]]
    cell2 = board[combination[1]]
    cell3 = board[combination[2]]

    cellsArray = [cell1, cell2, cell3]
    if cellsArray.all? {|element| element == "X"}
      return combination
    elsif cellsArray.all? {|element| element == "O"}
      return combination
    end
  end
  return false
end

def full?(board)
  if board.all? {|element| element == "X" || element == "O"}
    return true
  else
    return false
  end
end

def draw?(board)
  if (not won?(board)) && full?(board)
    return true
  else
    return false
  end
end

def over?(board)
  if won?(board) || draw?(board) || full?(board)
    return true
  else
    return false
  end
end

def winner(board)
  if won?(board)
    position = won?(board)[0]
    return board[position]
  end
end
