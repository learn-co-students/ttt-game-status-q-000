# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
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
   [2,4,6]
  ]

def won?(board)
    WIN_COMBINATIONS.each do |win_combinations|
    win_index_1 = win_combinations[0]
    win_index_2 = win_combinations[1]
    win_index_3 = win_combinations[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

    if (position_1 == "X" && position_2 == "X"  && position_3 =="X") || (position_1 == "O" && position_2 == "O"  && position_3== "O")
      return win_combinations

    else

      false
    end
   end


  if board[0] == " " && board[1] == " " && board[2] == " " && board[3] == " " && board[4] == " " && board[5] == " " && board[6] === " " && board[7] = " " && board[8] == " "
    return false
  else
  end
end

def full?(board)
  board.none? {|board| board == " "  }

end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  won?(board) || full?(board) || draw?(board)
end

def winner(board)

  if won?(board)

  win_combinations = won?(board)
  winnerarraynum = win_combinations[0]
  winnersymbol = board[winnerarraynum]
  return winnersymbol

else
nil
end
end



