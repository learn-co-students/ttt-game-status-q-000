# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
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
  [6,4,2]
]


def won?(board)
    WIN_COMBINATIONS.each do |combo|
      win_index_1 = combo[0]
      win_index_2 = combo[1]
      win_index_3 = combo[2]

      position_1 = board[win_index_1] 
      position_2 = board[win_index_2] 
      position_3 = board[win_index_3] 

      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return combo

      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        return combo

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

    WIN_COMBINATIONS.each do |combo|
  
      win_index_1 = combo[0]
      win_index_2 = combo[1]
      win_index_3 = combo[2]

      position_1 = board[win_index_1] 
      position_2 = board[win_index_2] 
      position_3 = board[win_index_3] 
    
      if position_1 == "X" && position_2 == "X" && position_3 == "X"
         return "X"
    
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
          return "O"
      end
    end
    else return nil
  end
end