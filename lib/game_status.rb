# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2], #top row
  [3, 4, 5], #middle
  [6, 7, 8], #last
  [0, 3, 6], #column 1
  [1, 4, 7], # column 2
  [2, 5, 8], #column 3
  [0, 4, 8], #diagonal 1
  [2, 4, 6] #diagonal 2
  ]

def won?(board)
  WIN_COMBINATIONS.detect do |win|
    win.all? {|choice| board[choice] == 'X'} || win.all? {|choice| board[choice] == 'O'}
  end
end

def full?(board)
  if board.none?{|position|position == " "} then true
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