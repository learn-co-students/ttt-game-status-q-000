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
  [6,4,2],
]



def won?(board)
   topacross = WIN_COMBINATIONS[0]
   middleacross = WIN_COMBINATIONS[1]
   bottomacross = WIN_COMBINATIONS[2]
   leftdown =WIN_COMBINATIONS[3]
   middledown = WIN_COMBINATIONS[4]
   rightdown = WIN_COMBINATIONS[5]
   left_win = WIN_COMBINATIONS[6]
   right_win = WIN_COMBINATIONS[7]



      if board[topacross[0]] == "X" && board[topacross[1]] == "X" && board[topacross[2]] == "X" 
        return topacross
       
        elsif board[middleacross[0]] == "X" && board[middleacross[1]] == "X" && board[middleacross[2]] == "X" 
        return middleacross
       
        elsif board[bottomacross[0]] == "X" && board[bottomacross[1]] == "X" && board[bottomacross[2]] == "X" 
        return bottomacross
      
        elsif board[leftdown[0]] == "X" && board[leftdown[1]] == "X" && board[leftdown[2]] == "X" 
        return leftdown
     
        elsif board[rightdown[0]] == "X" && board[rightdown[1]] == "X" && board[rightdown[2]] == "X" 
        return rightdown      

        elsif board[left_win [0]] == "X" && board[left_win [1]] == "X" && board[left_win [2]] == "X" 
        return left_win 
       
        
        elsif board[right_win[0]] == "X" && board[right_win[1]] == "X" && board[right_win[2]] == "X" 
        return right_win

        elsif board[topacross[0]] == "O" && board[topacross[1]] == "O" && board[topacross[2]] == "O" 
        return topacross
       
        elsif board[middleacross[0]] == "O" && board[middleacross[1]] == "O" && board[middleacross[2]] == "O" 
        return middleacross
       
        elsif board[bottomacross[0]] == "O" && board[bottomacross[1]] == "O" && board[bottomacross[2]] == "O" 
        return bottomacross
      
        elsif board[leftdown[0]] == "O" && board[leftdown[1]] == "O" && board[leftdown[2]] == "O" 
        return leftdown
     
       elsif board[middledown[0]] == "O" && board[middledown[1]] == "O" && board[middledown[2]] == "O" 
        return middledown

        elsif board[rightdown[0]] == "O" && board[rightdown[1]] == "O" && board[rightdown[2]] == "O" 
        return rightdown      

        elsif board[left_win [0]] == "O" && board[left_win [1]] == "O" && board[left_win [2]] == "O" 
        return left_win 
       
        elsif board[right_win[0]] == "O" && board[right_win[1]] == "O" && board[right_win[2]] == "O" 
        return right_win
      else
        false
      
   end   
end

def full?(board)
  if (board[0] == "X" || board[0] == "O") && (board[1] == "X" || board[1] == "O") &&(board[2] == "X" || board[2] == "O") &&(board[3] == "X" || board[3] == "O") &&(board[4] == "X" ||board[4] ==  "O") &&(board[5] == "X" || board[5] == "O") &&(board[6] == "X" || board[6] == "O") &&(board[7] == "X" || board[7] == "O") &&(board[8] ==  "X" || board[8] == "O") 
   return true
  else
   return false
end
end


def draw?(board)
  if full?(board) && won?(board) == false
    return true
  else
    return false
end
  
end

def over?(board)
  if draw?(board) || full?(board) || won?(board)
    return true
  else 
    return false
end  
end

def winner(board)
  if won?(board)
  won?(board).each do |wincombo|
    if board[wincombo] == "X"
      return "X"
    elsif board[wincombo] == "O"
      return "O"
 else
 return false
end
end
end
end
