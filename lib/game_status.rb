# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS = [
  [0,1,2],  # Top row
  [3,4,5],  # Middle row
  [6,7,8],  # Bottom row
  [0,3,6],  # Left column
  [1,4,7],  # Middle column
  [2,5,8],  # Right column
  [0,4,8],  # Top-left to Bottom-right diagonal
  [2,4,6]   # Top-right to Bottom-left diagonal
]

def won?(board)
  WIN_COMBINATIONS.detect do |win.index|
    board[win_index[0]] == board[win_index[1]] &&
    board[win_index[1]] == board[win_index[2]] &&
    position_taken?(board, win_index[0])
  end
end

def full?(board)
end

def draw?(board)
end

def over?(board)
end

def winner(board)
end

# def won?(board)
#   position_1 = WIN_COMBINATIONS[0]
#   position_2 = WIN_COMBINATIONS[1]
#   position_3 = WIN_COMBINATIONS[2]
#   position_4 = WIN_COMBINATIONS[3]
#   position_5 = WIN_COMBINATIONS[4]
#   position_6 = WIN_COMBINATIONS[5]
#   position_7 = WIN_COMBINATIONS[6]
#   position_8 = WIN_COMBINATIONS[7]

#   if board[position_1[0]] == "X" && board[position_1[1]] == "X" && board[position_1[2]] == "X"
#     position_1
#   elsif board[position_2[0]] == "X" && board[position_2[1]] == "X" && board[position_2[2]] == "X"
#     position_2
#   elsif board[position_3[0]] == "X" && board[position_3[1]] == "X" && board[position_3[2]] == "X"
#     position_3
#   elsif board[position_4[0]] == "X" && board[position_4[1]] == "X" && board[position_4[2]] == "X"
#     position_4
#   elsif board[position_5[0]] == "X" && board[position_5[1]] == "X" && board[position_5[2]] == "X"
#     position_5
#   elsif board[position_6[0]] == "X" && board[position_6[1]] == "X" && board[position_6[2]] == "X"
#     position_6
#   elsif board[position_7[0]] == "X" && board[position_7[1]] == "X" && board[position_7[2]] == "X"
#     position_7
#   elsif board[position_8[0]] == "X" && board[position_8[1]] == "X" && board[position_8[2]] == "X"
#     position_8
#   elsif board[position_1[0]] == "O" && board[position_1[1]] == "O" && board[position_1[2]] == "O"
#     position_1
#   elsif board[position_2[0]] == "O" && board[position_2[1]] == "O" && board[position_2[2]] == "O"
#     position_2
#   elsif board[position_3[0]] == "O" && board[position_3[1]] == "O" && board[position_3[2]] == "O"
#     position_3
#   elsif board[position_4[0]] == "O" && board[position_4[1]] == "O" && board[position_4[2]] == "O"
#     position_4
#   elsif board[position_5[0]] == "O" && board[position_5[1]] == "O" && board[position_5[2]] == "O"
#     position_5
#   elsif board[position_6[0]] == "O" && board[position_6[1]] == "O" && board[position_6[2]] == "O"
#     position_6
#   elsif board[position_7[0]] == "O" && board[position_7[1]] == "O" && board[position_7[2]] == "O"
#     position_7
#   elsif board[position_8[0]] == "O" && board[position_8[1]] == "O" && board[position_8[2]] == "O"
#     position_8
#   else
#     false
#   end
# end

# def full?(board)
#   if board.any?{|position| position == " "}
#     false
#   else
#     true
#   end
# end

# def draw?(board)
#   if won?(board) == false && full?(board) == true
#     true
#   else
#     false
#   end
# end

# def over?(board)
#   if won?(board) == false && full?(board) == false && draw?(board) == false
#     false
#   else
#     true
#   end 
# end

# def winner(board)
#   position_1 = WIN_COMBINATIONS[0]
#   position_2 = WIN_COMBINATIONS[1]
#   position_3 = WIN_COMBINATIONS[2]
#   position_4 = WIN_COMBINATIONS[3]
#   position_5 = WIN_COMBINATIONS[4]
#   position_6 = WIN_COMBINATIONS[5]
#   position_7 = WIN_COMBINATIONS[6]
#   position_8 = WIN_COMBINATIONS[7]

#   if board[position_1[0]] == "X" && board[position_1[1]] == "X" && board[position_1[2]] == "X"
#     "X"
#   elsif board[position_2[0]] == "X" && board[position_2[1]] == "X" && board[position_2[2]] == "X"
#     "X"
#   elsif board[position_3[0]] == "X" && board[position_3[1]] == "X" && board[position_3[2]] == "X"
#     "X"
#   elsif board[position_4[0]] == "X" && board[position_4[1]] == "X" && board[position_4[2]] == "X"
#     "X"
#   elsif board[position_5[0]] == "X" && board[position_5[1]] == "X" && board[position_5[2]] == "X"
#     "X"
#   elsif board[position_6[0]] == "X" && board[position_6[1]] == "X" && board[position_6[2]] == "X"
#     "X"
#   elsif board[position_7[0]] == "X" && board[position_7[1]] == "X" && board[position_7[2]] == "X"
#     "X"
#   elsif board[position_8[0]] == "X" && board[position_8[1]] == "X" && board[position_8[2]] == "X"
#     "X"
#   elsif board[position_1[0]] == "O" && board[position_1[1]] == "O" && board[position_1[2]] == "O"
#     "O"
#   elsif board[position_2[0]] == "O" && board[position_2[1]] == "O" && board[position_2[2]] == "O"
#     "O"
#   elsif board[position_3[0]] == "O" && board[position_3[1]] == "O" && board[position_3[2]] == "O"
#     "O"
#   elsif board[position_4[0]] == "O" && board[position_4[1]] == "O" && board[position_4[2]] == "O"
#     "O"
#   elsif board[position_5[0]] == "O" && board[position_5[1]] == "O" && board[position_5[2]] == "O"
#     "O"
#   elsif board[position_6[0]] == "O" && board[position_6[1]] == "O" && board[position_6[2]] == "O"
#     "O"
#   elsif board[position_7[0]] == "O" && board[position_7[1]] == "O" && board[position_7[2]] == "O"
#     "O"
#   elsif board[position_8[0]] == "O" && board[position_8[1]] == "O" && board[position_8[2]] == "O"
#     "O"
#   else
#     nil
#   end
# end

