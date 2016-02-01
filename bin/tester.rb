
require_relative '../lib/game_status.rb'

boards = [[" "," "," ", " "," "," ", " "," "," "],
          ["X"," "," ", "X"," "," ", "X"," "," "],
          [" "," ","O", " ","O"," ", "O"," "," "],
          ["X","X","O", "O","O","X", "O","O","X"],
          ["X","O","X", "O","X","O", "O","X","O"],
          ["X"," ","X", " ","X"," ", "O","O"," "]]


puts "starting..."
board = boards[0]
#if(!!won?(board) || draw?(board))
#if(won?(board) || draw?(board))
puts "board: " + board.to_s
print "won?(board):  "
puts won?(board)
puts "done."
