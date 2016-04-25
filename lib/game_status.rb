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
  result = false
  WIN_COMBINATIONS.each do |win_combination|
    if !result
      if win_combination.all?{|i| board[i]=="X"} || win_combination.all?{|i| board[i]=="O"}
         result = win_combination
      end
    end
  end
   result
end

def full?(board)
  if board.any?{|location| location == " "}
     false
    else
      true
    end
end

def draw?(board)
  if won?(board) == false && full?(board) == true
    true
  else
   false
  end
end

def over?(board)
  if won?(board) == false && draw?(board) == false && full?(board) == false
    false
  else
    true
  end
end

def winner(board)
  win_combination = won?(board)
    if win_combination
      board[win_combination[0]]
    else
      nil
    end
=begin
  win_position_1 = WIN_COMBINATTIONS[0]
  win_position_2 = WIN_COMBINATTIONS[1]
  win_position_3 = WIN_COMBINATTIONS[2]
  win_position_4 = WIN_COMBINATTIONS[3]
  win_position_5 = WIN_COMBINATTIONS[4]
  win_position_6 = WIN_COMBINATTIONS[5]
  win_position_7 = WIN_COMBINATTIONS[6]
  win_position_8 = WIN_COMBINATTIONS[7]

  if board[win_position_1[0]] == "X" && board[win_position_1[1]] == "X" && board[win_position_1[2]] == "X"
    "X"
  elsif board[win_position_2[3]] == "X" && board[win_position_2[4]] == "X" && board[win_position_2[5]] == "X"
    "X"
  elsif board[win_position_3[6]] == "X" && board[win_position_3[7]] == "X" && board[win_position_3[8]] == "X"
    "X"
  elsif board[win_position_4[0]] == "X" && board[win_position_4[3]] == "X" && board[win_position_4[6]] == "X"
    "X"
  elsif board[win_position_5[1]] == "X" && board[win_position_5[4]] == "X" && board[win_position_5[7]] == "X"
    "X"
  elsif board[win_position_6[2]] == "X" && board[win_position_6[5]] == "X" && board[win_position_6[8]] == "X"
    "X"
  elsif board[win_position_7[0]] == "X" && board[win_position_7[4]] == "X" && board[win_position_7[8]] == "X"
   "X"
  elsif board[win_position_8[2]] == "X" && board[win_position_8[4]] == "X" && board[win_position_8[6]] == "X"
    "X"
  elsif board[win_position_1[0]] == "O" && board[win_position_1[1]] == "O" && board[win_position_1[2]] == "O"
    "O"
  elsif board[win_position_2[3]] == "O" && board[win_position_2[4]] == "O" && board[win_position_2[5]] == "O"
    "O"
  elsif board[win_position_3[6]] == "O" && board[win_position_3[7]] == "O" && board[win_position_3[8]] == "O"
    "O"
  elsif board[win_position_4[0]] == "O" && board[win_position_4[3]] == "O" && board[win_position_4[6]] == "O"
    "O"
  elsif board[win_position_5[1]] == "O" && board[win_position_5[4]] == "O" && board[win_position_5[7]] == "O"
    "O"
  elsif board[win_position_6[2]] == "O" && board[win_position_6[5]] == "O" && board[win_position_6[8]] == "O"
    "O"
  elsif board[win_position_7[0]] == "O" && board[win_position_7[4]] == "O" && board[win_position_7[8]] == "O"
    "O"
  elsif board[win_position_8[2]] == "O" && board[win_position_8[4]] == "O" && board[win_position_8[6]] == "O"
    "O"
  else
    nil
  end
=end
end
