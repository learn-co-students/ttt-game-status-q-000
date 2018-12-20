# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

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
  WIN_COMBINATIONS.detect do |array|
    array.all? {|input| board[input] == "X"} || array.all? {|input| board[input] == "O"}
  end
end

def full?(board)
  if board.any? {|input| input == " "}
    false
else
  true
end
end

def draw?(board)
  unless won?(board) || full?(board) ==  false
    return true
  end
end

def over?(board)
  if full?(board) == false
    return false
  else
    return true
  end
end

def winner(board)
  if won?(board)
    if WIN_COMBINATIONS.detect {|array| array.all? {|input| board[input] == "X" }}
      return "X"
    else
      return "O"
    end
  end
end