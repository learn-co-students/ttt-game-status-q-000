# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant
  WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom row
  [0,3,6], # Left column
  [1,4,7], # Middle column
  [2,5,8], # Right column
  [0,4,8], # Top-left to bottom-right diagonal
  [6,4,2]  # Top-right to bottom-left diagonal
    ]
def won?(board)
  win_position_1 = WIN_COMBINATTIONS[0]
  win_position_2 = WIN_COMBINATTIONS[1]
  win_position_3 = WIN_COMBINATTIONS[2]
  win_position_4 = WIN_COMBINATTIONS[3]
  win_position_5 = WIN_COMBINATTIONS[4]
  win_position_6 = WIN_COMBINATTIONS[5]
  win_position_7 = WIN_COMBINATTIONS[6]
  win_position_8 = WIN_COMBINATTIONS[7]

  if board[win_position_1[0]] == "X" && board[win_position_1[1]] == "X" && board[win_position_1[2]] == "X"
    "X won in the top row"
  elsif board[win_position_2[3]] == "X" && board[win_position_2[4]] == "X" && board[win_position_2[5]] == "X"
    "X won in the middle row"
  elsif board[win_position_3[6]] == "X" && board[win_position_3[7]] == "X" && board[win_position_3[8]] == "X"
    "X won in the bottom row"
  elsif board[win_position_4[0]] == "X" && board[win_position_4[3]] == "X" && board[win_position_4[6]] == "X"
    "X won in the left column"
  elsif board[win_position_5[1]] == "X" && board[win_position_5[4]] == "X" && board[win_position_5[7]] == "X"
    "X won in the middle column"
  elsif board[win_position_6[2]] == "X" && board[win_position_6[5]] == "X" && board[win_position_6[8]] == "X"
    "X won in the right column"
  elsif board[win_position_7[0]] == "X" && board[win_position_7[4]] == "X" && board[win_position_7[8]] == "X"
    "X won diagonally left  to right"
  elsif board[win_position_8[2]] == "X" && board[win_position_8[4]] == "X" && board[win_position_8[6]] == "X"
    "X won diagonally right to left"
  elsif board[win_position_1[0]] == "O" && board[win_position_1[1]] == "O" && board[win_position_1[2]] == "O"
    "O won in the top row"
  elsif board[win_position_2[3]] == "O" && board[win_position_2[4]] == "O" && board[win_position_2[5]] == "O"
    "O won in the middle row"
  elsif board[win_position_3[6]] == "O" && board[win_position_3[7]] == "O" && board[win_position_3[8]] == "O"
    "O won in the bottom row"
  elsif board[win_position_4[0]] == "O" && board[win_position_4[3]] == "O" && board[win_position_4[6]] == "O"
    "O won in the left column"
  elsif board[win_position_5[1]] == "O" && board[win_position_5[4]] == "O" && board[win_position_5[7]] == "O"
    "O won in the middle column"
  elsif board[win_position_6[2]] == "O" && board[win_position_6[5]] == "O" && board[win_position_6[8]] == "O"
    "O won in the right column"
  elsif board[win_position_7[0]] == "O" && board[win_position_7[4]] == "O" && board[win_position_7[8]] == "O"
    "O won diagonally left  to right"
  elsif board[win_position_8[2]] == "O" && board[win_position_8[4]] == "O" && board[win_position_8[6]] == "O"
    "O won diagonally right to left"
  else
    nil
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