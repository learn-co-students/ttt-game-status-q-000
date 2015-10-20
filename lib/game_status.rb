# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8],  # Bottom row
  [0,4,8],  # Diagonal from top left to bottom right
  [2,4,6],  # Diagonal from top right to bottom left
  [0,3,6],  # Left column
  [1,4,7],  # Middle column
  [2,5,8]  # Right column
]

def won?(board)
  WIN_COMBINATIONS.each do |c|
    win = c.all? do |position|
      position_taken?(board,position) && (board[position] == board[c[0]])
    end
    if win
      return c
    end
  end
  return false
end


def full?(board)
  @board = board
  if @board.any? {|x| x == "" || x == " "}
    return false 
  else 
    return true
  end
end

def draw?(board)
  draw = false
    if full?(board)
      draw = true
    end
    if won?(board)
      draw = false
    end
  draw
 end

def over?(board)
  over = false
  if won?(board)
    over = true
  end
  if draw?(board)
    over = true
  end
  if full?(board)
    over = true
  end
end

def winner(board)
  winner = nil
    if won?(board)
      winner = board[won?(board)[0]]
    end
  winner
end


