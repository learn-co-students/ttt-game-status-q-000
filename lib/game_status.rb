# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

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
  if WIN_COMBINATIONS.any? do |combination|
    board[combination[0]] == "X" && board[combination[1]] == "X" && board[combination[2]] == "X" || board[combination[0]] == "O" && board[combination[1]] == "O" && board[combination[2]] == "O"
  end
  return combination
else
  return false
end
end




def full?(board)
  if position_taken?(board,location) == true
    return true
  else
    return false
  end
end

def draw?(board)
  if full?(board) == true && won?(board) == false
    return true
  elsif
    full?(board) == false && won?(board) == false
    return false
  else
    false
  end
end

    def over?(board)
      if won?(board) == true || draw?(board) == true || full?(board) == true
        return true
      else
        return false
      end
    end


