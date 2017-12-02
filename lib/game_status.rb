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
  WIN_COMBINATIONS.each do |win_combination|
    win_index = win_combination
          position_1 = board[win_index[0]]
          position_2 = board[win_index[1]]
          position_3 = board[win_index[2]]



    if position_1 == "X" && position_2 == "X" && position_3 == "X"
    return win_combination
      elsif   position_1 == "O" && position_2 == "O" && position_3 == "O"
          return win_combination
      end

  end
      if board ==  [" ", " ", " ", " ", " ", " ", " ", " ", " "]
      false
    end

end

def full?(board)

  board.all?{|i|
      i == "X" || i == "O"

    }
end

def draw?(board)

  if won?(board) == false || won?(board) == nil && full?(board) == true
    true
  else
    false
  end
end

def over?(board)

 if won?(board) == true || full?(board) == true || draw?(board) == true
   true
 else
   false
 end

end

def winner(board)
  if won?(board) == false || won?(board) == nil


  else
  won?(board).each{|i|
      if board[i] == "X"
        return "X"
      elsif board[i] == "O"
        return "O"
      end
    }
  end
end