# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], #Top row
  [3,4,5], #Middle row
  [6,7,8], #Bottom row
  [0,3,6], #left column
  [1,4,7], #Middle Column
  [2,5,8], #Right COlumn
  [0,4,8], #Diaganol 1
  [2,4,6]  #Diaganol 2
  ]


def full?(board)
  return (position_taken?(board, 0) && position_taken?(board, 1) && position_taken?(board, 2) && position_taken?(board, 3) && position_taken?(board, 4) && position_taken?(board, 5) && position_taken?(board, 6) && position_taken?(board, 7) && position_taken?(board, 8))
end

def empty?(board)
  return (!position_taken?(board, 0) && !position_taken?(board, 1) && !position_taken?(board, 2) && !position_taken?(board, 3) && !position_taken?(board, 4) && !position_taken?(board, 5) && !position_taken?(board, 6) && !position_taken?(board, 7) && !position_taken?(board, 8))
end

def won?(board)
  if empty?(board)
#     puts "returning false because it's empty", board.inspect
    return false
  end

  WIN_COMBINATIONS.each do |entry|
    #Are they they all taken
    positions_taken = (position_taken?(board, entry[0]) && position_taken?(board, entry[1]))
    positions_equal = ((board[entry[0]] == board[entry[1]]) && (board[entry[1]] == board[entry[2]]))
    if (positions_taken && positions_equal)
      return entry
    end
  end
  return false
end


def draw?(board)
  return (full?(board) == true && won?(board) == false)
end

def over?(board)
  return (won?(board) || draw?(board) || full?(board))
end

def winner(board)
  w = won?(board)
  if w == false
    return nil
  end
  return board[w[1]]
end
