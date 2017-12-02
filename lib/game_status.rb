# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]


def won?(board)
  WIN_COMBINATIONS.each do |firstlevel|
    if board[firstlevel[0]] == "X" && board[firstlevel[1]] == "X" && board[firstlevel[2]] == "X"
      return firstlevel
    elsif board[firstlevel[0]] == "O" && board[firstlevel[1]] == "O" && board[firstlevel[2]] == "O"
      return firstlevel
    end
  end
  return false
end

def full?(board)
  if board.include?("") || board.include?(" ") || board.include?(nil)
    return false
  else
    return true
  end
end

def draw?(board)
  if full?(board) == true && won?(board) == false
    return true
  else
    return false
  end
end

def over?(board)
  if draw?(board) == true || won?(board) != false
    return true
  else
    return false
  end
end

def winner(board)
    thewinner = won?(board)
    if thewinner != false
      if board[thewinner[0]] == "O"
        return "O"
      elsif board[thewinner[0]] == "X"
        return "X"
      end
    end
  return nil
end











