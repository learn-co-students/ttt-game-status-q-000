# Helper Method
board = ["X", "X", "X", " ", " ", " ", " ", " ", " "]

def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8], #horizontals
  [0,3,6],
  [1,4,7],
  [2,5,8], #verticals
  [0,4,8],
  [6,4,2], #diags
  ]

def won(board)
  if board.include?[WIN_COMBINATIONS[]]
    if WIN_COMBINATIONS == ["X","X","X"]
      puts "Congratulations! X wins!"
      elsif WIN_COMBINATIONS == ["O","O","O"]
      puts "Congratulations, ) wins!"
    else
    end
  else
  end
end

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end