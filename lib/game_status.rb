# Helper Methods
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

def won?(board)
  WIN_COMBINATIONS.detect do |combo|
    combo.all? { |i| board[i] == "X" } || 
    combo.all? { |i| board[i] == "O" }
  end
end

def full?(board)
  board.any? { |position| position == " " } ? false : true
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) || full?(board) || draw?(board)
end

def winner(board)
  won?(board) ? board[won?(board)[0]] : nil
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
    [0, 1, 2], # top-row
    [3, 4, 5], # middle-row
    [6, 7, 8], #bottom-row
    [0, 3, 6], #col-1
    [1, 4, 7], #col-2
    [2, 5, 8], #col-3
    [0, 4, 8], #diagonal-1
    [2, 4, 6]  #diagonal-2
  ]