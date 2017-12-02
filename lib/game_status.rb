# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
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
  WIN_COMBINATIONS.detect do |combo|
    combo.all? {|choice| board[choice] == "X"} || combo.all? {|choice| board[choice] == "O"}
  end
end

def full?(board)
  if board.none?{|position|position == " "} then true
  end
end

def draw?(board)
  if (full?(board) && !won?(board)) then true
  end
end

def over?(board)
  if won?(board) || draw?(board) then true
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