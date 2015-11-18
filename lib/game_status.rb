# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end
board = ["X","O","X","X"," "," "," "," "," "]
# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]
  ]

def won?(board)
  WIN_COMBINATIONS.each do |win|
    if board[win[0]] == "X" && board[win[1]] == "X" && board[win[2]] == "X"
      return win
    elsif board[win[0]] == "O" && board[win[1]] == "O" && board[win[2]] == "O"
      return win
    else false
    end

    if board == [" "," "," "," "," "," "," "," "," "]
      return false
    end

    if board.any?{|value| value == " "}
      true
    else return false
    end
  end
end

def full?(board)
  if board.any?{|value| value == " "}
    false
  else return true
  end
end

def draw?(board)
  WIN_COMBINATIONS.each do |win|
    if board[win[0]] == "X" && board[win[1]] == "X" && board[win[2]] == "X"
      return false
    elsif board[win[0]] == "O" && board[win[1]] == "O" && board[win[2]] == "O"
      return false
    end
  end
end

def over?(board)
  if board.any?{|value| value == " "}
    false
  else return true
  end
end

def winner(board)
  WIN_COMBINATIONS.each do |win|
    if board[win[0]] == "X" && board[win[1]] == "X" && board[win[2]] == "X"
      return "X"
    elsif board[win[0]] == "O" && board[win[1]] == "O" && board[win[2]] == "O"
      return "O"
    end
  end
  return nil
end