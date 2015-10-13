require 'pry'
# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

boardx = ["X", "X", "X", " ", " ", " ", " ", " ", " "]

# Define your WIN_COMBINATIONS constant
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
  if board.count("X") >= 5 && board.count("O") >= 4
    return false
  else
    WIN_COMBINATIONS.detect do |combo|
    # position_taken?(board, combo[0])
    combo.all? do |mixture| 
      board[mixture] == "X" || board[mixture] == "O"
    end
  end
end
end


def full?(board)
  if board.count(" ") == 0
    return true
  else return false
  end
end

def draw?(board)
  if full?(board) && !won?(board) #draw
     true #draw
    # binding.pry
  elsif full?(board) && won?(board) #win
     false #win
  else  return false
  end
end

def over?(board)
  if !full?(board)
    false
    # binding.pry
  elsif full?(board) || won?(board) || draw?(board)
    true
  else false
  end
end

def winner(board)
  if board.count("X") > board.count("O") 
    "X"
  elsif board.count("X") < board.count("O") 
    "O"
  else nil
  end

end

      



# || combo.all? { |mixture| board[mixture] == "O" }


#     combo.each do |combo_index|
#       return board[combo_index] 
#       binding.pry


#       # == "X" || "O"
#       # combo

#         # print combo
#         # print board
#         # print q
#     end
#   end
# end


# # q.each == 
#     #   board.each_index


#     # # winner = combo.each_index do |slot| 
#     # board.each_index do |slot|
#     #   if slot == combo[slot]



# #     combo[0] == board[combo][0]
# #     combo[1]
# #     combo[2]

# #     board.each == combo
# #       return combo
# #     # end
# #   end

# #   # board.each do |cubby|
# # end