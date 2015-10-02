# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end
# Define your WIN_COMBINATIONS constant
require 'pry'

WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]
]

def won?(board)
  won_with_O?(board) || won_with_X?(board)
end

def won_with_O?(board)
  WIN_COMBINATIONS.detect do |win_array|
    win_array.all? do |win_index|
      board[win_index] == 'O'
    end
  end
end

def won_with_X?(board)
  WIN_COMBINATIONS.detect do |win_array|
    win_array.all? do |win_index|
      board[win_index] == 'X'
    end
  end
end

def full?(board)
  !board.detect do |position|
    position == " "
  end
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  draw?(board) || won?(board)
end

def winner(board)
  if won_with_O?(board)
    "O"
  elsif won_with_X?(board)
    "X"
  end
end