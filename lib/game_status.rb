# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]


def won?(board)
  for tiles in WIN_COMBINATIONS
    if board[tiles[0]]==board[tiles[1]] and board[tiles[1]]==board[tiles[2]] and position_taken?(board, tiles[0])
      return [tiles[0], tiles[1], tiles[2]]
    end 
  end
  return false
end

def winner(board)
  res = won?(board)
  if res 
    return board[res[0]]
  else
    return nil
  end
end

def full?(board)
  (0...9).each do |tile|
    unless position_taken?(board, tile)
      return false
    end
  end
  return true
end

def over?(board)
  if won?(board) or full?(board)
    return true
  end
  return false
end

def draw?(board)
  if not won?(board) and full?(board)
    return true
  end
  return false
end