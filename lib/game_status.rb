# Helper Method

def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
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
  [6,4,2]
]

# def won?(board)
#   WIN_COMBINATIONS.each_with_index do |win_combo, index|
#     # p win_combo
#     if board[index] == win_combo[index]
#       return win_combo
#     else
#       return false
#     end

#   end
# #     p win_combo
# #     p win_combo[0]
# #     win_index_1 = win_combo[0]
# #     win_index_2 = win_combo[1]
# #     win_index_3 = win_combo[2]

# #     position_1 = board[win_index_1]
# #     position_2 = board[win_index_2]
# #     position_3 = board[win_index_3]
# # p position_1
# #     if position_1 == "X" && position_2 == "X" && position_3 == "X"
# #       win_combo
# #     else
# #       return false
# #     end
# #   end
 
  
# end



def won?(board)
  WIN_COMBINATIONS.each do |combo|
    board.each do |position|
    p position
    end
    
    # if combo == "X"
    #   return combo
    # else
    #   return false
    # end
  end
  
end

board = ["X", "X", "X", " ", " ", " ", " ", " ", " "]

p won?(board)

































