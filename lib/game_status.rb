# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end


# Define your WIN_COMBINATIONS constant
  WIN_COMBINATIONS = [
    [0,1,2], # Top Row
    [3,4,5], # Middle Row
    [6,7,8], # Bottom Row
    [0,4,8], # Diagonal Row # 1
    [6,4,2], # Diagonal Row # 2
    [0,3,6], # Vertical Column 1
    [1,4,7], # Vertical Column 2
    [2,5,8]  # Vertical Column 3
]

def won?(board)
  WIN_COMBINATIONS.detect do |combo|
    return combo if combo.all? do |position| board[position] == "X" end
    return combo if combo.all? do |position| board[position] == "O" end
  end
end

def full?(board)
  board.all? do |i|
    if i == "X" || i == "O"
      true
    else
      false
    end
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
  if won?(board) || draw?(board) || full?(board)
    true
  else
    false
  end
end

def winner(board)
  if won?(board) != nil
    board[won?(board).first]
  else
    nil
  end
end
