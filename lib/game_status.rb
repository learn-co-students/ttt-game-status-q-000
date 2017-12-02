# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]

#Method to determine if there is a winning combo on the board
def won?(board)
  WIN_COMBINATIONS.detect do |combo|
    combo.all?{|i| board[i]=="X"} || combo.all?{|i| board[i]=="O"}
  end
end

#To determine if the board is full
def full?(board)
  board.all?{|i| i=="X"||i=="O"}
end

#Determine if there is a draw on the board (fill & no winner)
def draw?(board)
  full?(board)&&!won?(board)
end

#over? accepts a board and returns true if the board has been won, is a draw, or is full.
def over?(board)
   full?(board)||won?(board)||draw?(board)
end

#winner method should accept a board and return the token, "X" or "O"
def winner(board)
  won?(board) ? board[won?(board).fetch(0)] : nil
end

board = ["X", "X", "X", " ", " ", " ", " ", " ", " "]

puts full?(board)