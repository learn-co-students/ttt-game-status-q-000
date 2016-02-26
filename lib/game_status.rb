# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6]
]

def won?(board)
  if WIN_COMBINATIONS.none? do |streak|
        (board[streak[0]] == "X" && board[streak[1]] == "X" && board[streak[2]] == "X") || (board[streak[0]] == "O" && board[streak[1]] == "O" && board[streak[2]] == "O")
    end
  return false
  else WIN_COMBINATIONS.each do |streak|
      if (board[streak[0]] == "X" && board[streak[1]] == "X" && board[streak[2]] == "X") || (board[streak[0]] == "O" && board[streak[1]] == "O" && board[streak[2]] == "O")
        return streak
      end
    end
  end
end

def full?(board)
  if board.all? do |spot|
    spot == "X" || spot == "O"
    end
    return true
  else
    return false
  end
end

def draw?(board)
  if won?(board) == false && full?(board) == true
    return true
  else
    return false
  end
end

def over?(board)
  if won?(board) == true || full?(board) == true || draw?(board) == true
    return true
  else
    return false
  end
end

def winner(board)
  if won?(board) == false 
    return nil
  else WIN_COMBINATIONS.each do |streak|
      if (board[streak[0]] == "X" && board[streak[1]] == "X" && board[streak[2]] == "X")
        return "X"
      elsif (board[streak[0]] == "O" && board[streak[1]] == "O" && board[streak[2]] == "O")
        return "O"
      end
    end
  end
end
