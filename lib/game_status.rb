# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end
require 'pry'
# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 4, 8],
  [2, 4, 6],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8]
]

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    win = win_combination.all? do |index|
      board[index] == "X"
    end
    if win
      return win_combination
    end
    win = win_combination.all? do |index|
      board[index] == "O"
    end
    if win
      return win_combination
    end
  end
  return false
end

def full?(board)
  board.all? do |index|
  if index == "X"
    true
  elsif index == "O"
    true
  else
    false
end
end
end

def draw?(board)
  if won?(board)
    false
  elsif !won?(board) && full?(board)
    true
  else !won?(board) && full?(board)
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
  return nil if !(won?(board))
  return "X" if board[won?(board)[0]] == "X"
  return "O" if board[won?(board)[0]] == "O"
end
