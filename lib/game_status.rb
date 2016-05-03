
def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end

WIN_COMBINATIONS = [[0,1,2],
                      [3,4,5],
                      [6,7,8],
                      [0,4,8],
                      [6,4,2],
                      [0,3,6],
                      [1,4,7],
                      [2,5,8]]

def won?(board)


  WIN_COMBINATIONS.any? do |win_combination|
    win_index1 = win_combination[0]
    win_index2 = win_combination[1]
    win_index3 = win_combination[2]


    position_1 = board[win_index1]
    position_2 = board[win_index2]
    position_3 = board[win_index3]


    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combination
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
     return win_combination
    else
      false
    end
  end
end


def full?(board)
  is_full = true
  board.each do |number|
    number = number.to_i
    number +=1
    if position_taken?(board, number) == false
      is_full = false

    end
  end
  return is_full
end

def draw?(board)
  if won?(board) == false
    if full?(board) == true
      true
    elsif full?(board) == false
      false
    else
      false
    end
  end
end

def over?(board)
  if won?(board) == true || draw?(board) == true || full?(board) == true
    true
  else
    false
  end

end

def winner(board)
 
 if won?(board) != false
    winner = won?(board)[0]
    board[winner]
 else
 	nil
 end 
end

 def play
   
 end





