# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
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
  [2,4,6]
  ]
def won?(board)
  WIN_COMBINATIONS.each do |winner|
    if(winner.all? {|cell| board[cell]=="X"})
      return winner
    end
    if(winner.all? {|cell| board[cell]=="O"})
      return winner
    end
  end
  return nil
end

def full?(board)
  board.all? do |cell|
    cell=="X"||cell=="O"
  end
end

def draw?(board)
  if(won?(board))
    return false
    elsif(full?(board))
    return true
    else
    return false
  end
end

def over?(board)
  return won?(board)||full?(board)||draw?(board)
end

def winner(board)
  if(won?(board)==nil)
    return nil
  else
    return board[won?(board)[0]]
  end
end