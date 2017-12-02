# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end
$WINER=nil

WIN_COMBINATIONS=[
  [0,1,2],[3,4,5],[6,7,8],
  [0,3,6],[1,4,7],[2,5,8],
  [0,4,8],[6,4,2]
]
def notempty?(board)
  if board.include?("X")||board.include?("O")
  return true
  else


  return false
  end
end




def won?(board)
  if notempty?(board)
    win_index=[]
    WIN_COMBINATIONS.each { |com|
      if position_taken?(board, com[0])
        if (board[com[0]]==board[com[1]] && board[com[1]]==board[com[2]])
          win_index.push(com[0],com[1],com[2])
          $WINER=board[com[0]]
        end
      end
    }
    if win_index.empty?







        return false
    else
        return win_index
    end


  else
    return false
  end
end





def full?(board)
  if board.include?(" ") || board.include?(nil)
    return false
  else


    return true
  end
end


def draw?(board)
 if full?(board)
   if won?(board)
     return false
   else
     return true
   end
 else
   return false
 end
end

def over?(board)
  if full?(board)

    return true
  elsif won?(board)
      return true
  else
      return false
  end

end


def winner(board)
  if won?(board)
    return $WINER
  else
    return nil
  end
end
