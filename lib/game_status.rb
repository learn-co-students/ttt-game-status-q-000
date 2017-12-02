require 'pry'

# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS= [[0,1,2],
[3,4,5],
[6,7,8],
[0,3,6],
[1,4,7],
[2,5,8],
[0,4,8],
[2,4,6]
]

def won?(board) 
WIN_COMBINATIONS.detect do |combination|
combination.all?{|player| board[player] == "X"} or combination.all?{|player| board[player] == "O"} 
end 
end

# win_index_1= win_combination[0]
# win_index_2= win_combination[1]
# win_index_3= win_combination[2]
# position_1= board[win_index_1]
# position_2= board[win_index_2]
# position_3= board[win_index_3]


# if board == [" ", " ", " ", " ", " ", " ", " ", " "," "]
#   return false
# elsif full?(board) and board != WIN_COMBINATIONS
#    return false
# # elsif (position_1 == "X" and position_2 == "X" and position_3== "X") or (position_1 == "O" and position_2 == "O" and position_3== "O")
# #   return win_combination


def full?(board)
  board.all?{|token| token!= " "}
end

def draw?(board)
   !won?(board) and full?(board)
end

def over?(board)
  won?(board) or draw?(board)
end

def winner(board)
if winnertoken= won?(board)
  return board[winnertoken.first]
end
end

