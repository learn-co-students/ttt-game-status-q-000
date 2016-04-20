require 'pry'

# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5], 
  [6, 7, 8], 
  [0, 3, 6], 
  [1, 4, 7], 
  [2, 5, 8], 
  [0, 4, 8], 
  [2, 4, 6] 
]

Board_full = ["X", "O", "X", "O", "X", "X", "O", "X", "O"]
Board_empty = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
Board_empty2 = []
Board_sample = [" ", "O", "X", " ", "O", " ", " ", "X", " "]

def empty?(board)
  board_check = []
  index = 0
  board.each do |b|
    board_check << position_taken?(board, index)
    index += 1
  end
  board_check.none?
end

def full?(board)
  board_check = []
  index = 0
  board.each do |b|
    board_check << position_taken?(board, index)
    index += 1
  end
  board_check.all?
end

def won?(board)
  
  return nil if empty?(board)
  
  WIN_COMBINATIONS.each do |combo|
    board_check = []
    board_check << board[combo[0]]
    board_check << board[combo[1]]
    board_check << board[combo[2]]

    if board_check.all? {|pos| pos == "X"}
      return combo
    elsif board_check.all? {|pos| pos == "O"}
      return combo
    end

  end

  false
end

def draw?(board)
  if full?(board) && !won?(board)
    true
  else
    false
  end
end

def over?(board)
  if draw?(board) || won?(board)
    true
  else
    false
  end
end

def winner(board)
  win_combo = won?(board)
  return nil unless win_combo
  board[win_combo[0]]
end
