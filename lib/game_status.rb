# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8], # Bottom row
  [0,4,8], # Top left diagonal
  [2,4,6], # Top right diagonal
  [0,3,6], # left column
  [1,4,7], # middle column
  [2,5,8] # right column
    
  ]

  def won?(board)


    WIN_COMBINATIONS.each do |win_combination|
  
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]

      position_1 = board[win_index_1] # load the value of the board at win_index_1
      position_2 = board[win_index_2] # load the value of the board at win_index_2
      position_3 = board[win_index_3] # load the value of the board at win_index_3  
    
      if position_1 == "X" && position_2 == "X" && position_3 == "X"
         return win_combination
    
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
          return win_combination
      end

    end

  

  return false

end

def full?(board)
  if board.any?{|value| value == " "}
  return false
end
return true
end

def draw?(board)
  if full?(board) == true && won?(board) == false
    return true
  end
  if won?(board) != false
    return false
  end
  false
  end

  def over?(board)
    if won?(board) != false || full?(board) == true || draw?(board) == true
      return true
    end
  end

def winner(board)
  if won?(board) != false

    WIN_COMBINATIONS.each do |win_combination|
  
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]

      position_1 = board[win_index_1] # load the value of the board at win_index_1
      position_2 = board[win_index_2] # load the value of the board at win_index_2
      position_3 = board[win_index_3] # load the value of the board at win_index_3  
    
      if position_1 == "X" && position_2 == "X" && position_3 == "X"
         return "X"
    
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
          return "O"
      end
    end
    else return nil
  end
   
  end
