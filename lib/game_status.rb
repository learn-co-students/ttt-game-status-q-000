
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

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
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]
 
    position_1 = board[win_index_1] # load the value of the board at win_index_1
    position_2 = board[win_index_2] # load the value of the board at win_index_2
    position_3 = board[win_index_3] # load the value of the board at win_index_3
    markers = ["X", "O"]
    markers.each do |marker|
      if position_1 == marker && position_2 == marker && position_3 == marker
        return win_combination
      end
    end
 end   
  return false
end

def full?(board)
  if board.detect{|i| i == " "} 
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
  if won?(board)
    return true
  elsif full?(board)
    return true
  else 
    return false
  end
end

def winner(board)
  if won?(board) == [0,4,8]
    return "X"
  elsif won?(board) == [1,4,7]
    return "O" 
  else
    return nil
  end
end



