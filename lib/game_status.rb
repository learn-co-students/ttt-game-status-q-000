# Helper Method
def position_taken?(board, position)
  !(board[position].nil? || board[position] == " ")
end

# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom row
  [0,3,6], # Left column
  [1,4,7], # Middle column
  [2,5,8], # Right column
  [0,4,8], # Diagonal left
  [2,4,6]  # Diagonal right
]

def won?(board)
  WIN_COMBINATIONS.detect do |win|
    win.all? {|e| board[e] == 'X'} || win.all? {|e| board[e] == 'O'}
  end
end

def full?(board)
  if board.none?{|position|position == " "}
    return true
  else
    return false
  end
end

def draw?(board)
  unless won?(board)
    return true
  end
end

def over?(board)
  unless won?(board) || full?(board)
    return false
  else  
    return true
  end
end

def winner(board)
  unless won?(board)
    return nil
  end
  if board[won?(board)[0]] == "X"
    return "X"
  elsif board[won?(board)[0]] == "O"
    return "O"
  end
end

