# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def won?(board)
  WIN_COMBINATIONS.each do |chickendinner|
    if chickendinner.all? {|index| board[index] == "X" }
      return chickendinner
    elsif chickendinner.all? {|index| board[index] == "O"}
      return chickendinner
    end
  end
  false
end

def full?(board)
  if board.detect {|spot| spot == " "}
    false
  else
    true
  end
end

def draw?(board)
  if full?(board) && !won?(board)
    true
  else
    false
  end
end

def over?(board)
  if draw?(board) || won?(board)
    true
  else
    false
  end
end


def winner(board)
  WIN_COMBINATIONS.each do |chickendinner|
    if chickendinner.all? {|index| board[index] == "X" }
      return "X"
    elsif chickendinner.all? {|index| board[index] == "O"}
      return "O"
    end
  end
  nil
end


# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
  [0,3,6],
  [0,4,8],
  [1,4,7],
  [2,5,8],
  [3,4,5],
  [6,7,8],
  [6,4,2]]