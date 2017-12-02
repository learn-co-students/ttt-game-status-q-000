# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8], # bottom row
  [0,3,6],  #left column
  [1,4,7],  #mid column
  [2,5,8],  #right column
  [0,4,8],  #left diag
  [2,4,6]   #right diag
  ]

def won?(board)
  empty = true
  board.none? do |int|
   if int == "X"  || int == "O"
    empty = false
  end
  end

  if empty == false
  WIN_COMBINATIONS.any? do |win_combo|
    win_index_1 = win_combo[0]
    win_index_2 = win_combo[1]
    win_index_3 = win_combo[2]

    pos_1 = board[win_index_1]
    pos_2 = board[win_index_2]
    pos_3 = board[win_index_3]

    if pos_1 == "X" && pos_2 == "X" && pos_3 == "X"
      return win_combo
    elsif pos_1 == "O" && pos_2 == "O" && pos_3 == "O"
      return win_combo
    else
      false
    end
  end
      end
end


def full?(board)
  if !board.include?(" ") && !board.include?(nil)
    return true
  end
end

#board doesn't contain blank spaces
#also include return true for a draw

def draw?(board)
  if !won?(board) && full?(board)
    return true
  elsif !won?(board) && full?(board)
    return false
  elsif won?(board)
    return false
  end
  end


def over?(board)
  if won?(board) || draw?(board) ||  full?(board)
    return true
   end
end

def winner(board)
  if won?(board)
    if board[won?(board)[0]]  == "X"
       return "X"
    elsif board[won?(board)[0]] == "O"
       return "O"
    end
 else
   return nil
 end
end
