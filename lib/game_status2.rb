# start testing delete
  require 'pry'
  board = ["X", "X", "X", " ", "O", " ", " ", " ", " "]
# end testing delete


# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  ]

# Accept a board and return false/nil if there is no win combination in the board. Return the winning combination indexes as an array if there is a win.

def won?(board)
  counter = 0
  WIN_COMBINATIONS.select do |potential_win_combo|
    print potential_win_combo
    print "\n"

    potential_win_combo.select do |potential_occupied|
      if
        position_taken?(board, potential_occupied)
        puts potential_occupied
        counter += 1
      else
        puts "no"
      end
    end
  end
end

won?(board)
