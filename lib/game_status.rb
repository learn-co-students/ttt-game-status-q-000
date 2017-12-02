# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS=[
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
  ]

def won?(board)
  WIN_COMBINATIONS.each do |combo|
    if combo.all? {|index| board[index] == "X" }
      return combo
    elsif combo.all? {|index| board[index] == "O"}
      return combo
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
  fullBool= full?(board)
  wonBool= won?(board)
  drawBool= draw?(board)
  if drawBool || wonBool
    true
  elsif
    false
  end
end

def winner(board)
  WIN_COMBINATIONS.each do |combo|
    if combo.all? {|index| board[index] == "X" }
      return "X"
    elsif combo.all? {|index| board[index] == "O"}
      return "O"
    end
  end
  return nil
end
