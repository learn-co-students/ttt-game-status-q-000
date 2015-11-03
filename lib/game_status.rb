# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

WIN_COMBINATIONS = [
 [0,1,2], [3,4,5], [6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

def won?(board) 
    
    counter=0
    p = []
    while counter <= board.length-1
    p[counter]= position_taken?(board,counter)
    counter+=1
    end

   board_status =  p.any? { |p_val| p_val == true  }
   empty_board = p.all? { |p_val| p_val == false  }
   full_board = p.all? { |p_val| p_val == true }
   
    if empty_board
      false

      elsif full_board
     false

    elsif board_status
        
      WIN_COMBINATIONS.each do |win_combination|
        pos = ["","",""]
        count=0
        win_combination.each do |i|
              pos[count] = board[i]
              count+= 1
        end
        if pos.all? { |pos_val| pos_val == "X" }
          w ="X"
          return win_combination
          
          elsif pos.all? { |pos_val| pos_val == "O" }
            w = "O"
          return win_combination
         
         else 
          w = nil
          false   
        end

      end
      
  end
end


def full?(board)

  if board.any? { |board_val| board_val==" " || nil  }
    false
  
  else
    true
  end

end


def draw?(board)

    

    if  full?(board) && !won?(board)
        true

      else 
        false

     
    end
end

def over?(board)
  if won?(board) !=false || draw?(board) == true || full?(board) == true
    true
  else false
  end
end

def winner(board)
  if won?(board) != false
    puts " #{w}"
  else puts nil
end
end


