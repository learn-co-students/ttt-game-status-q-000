#I need to have an array (board) that represents an empty board.

#I need a nested array, where at each index I have a winning combination.  (8 combinations)

#I need a method (win) that will take in the empty board array.
#This method should iterate through the winning combinations nested array. I want to take each index and capture that value to see if the board array has each certain combination of winning sets, then output the appropriate message. If none of those combinations are present, output false or nil.
require 'pry'

# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS =[
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

  WIN_COMBINATIONS.each do |combos|

    if board[combos[0]] == " " && board[combos[1]] == " " && board[combos[2]] == " "
      false
      elsif board[combos[0]] == board[combos[1]] && board[combos[0]] == board[combos[2]]
      return combos
      end
  end
  false
end


def draw(board)
  if won?(board) == false || board.full? == true
    return true
  else
    return false
  end
end


def full? (board)

end
