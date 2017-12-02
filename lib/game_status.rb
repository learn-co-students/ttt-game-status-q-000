# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS =[
  [0, 1, 2], 
  [3, 4, 5], 
  [6, 7, 8], 
  [0, 3, 6], 
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6]
  ]

def won?(board)
  WIN_COMBINATIONS.each do |combo| 
    win_index1 = combo[0]
    win_index2 = combo[1]
    win_index3 = combo[2]
    
    position_1 = board[win_index1]
    position_2 = board[win_index2]
    position_3 = board[win_index3]
    
    if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
      return combo
    else  
      false
    end
  end
  false
end

def full?(board)
  count = 1
  while count < 9
    if (board[count] == "") || (board[count] == " ")
      return false
    end
    count+=1
  end
  true
end

def draw?(board)
  if (won?(board) == false) && (full?(board) == true)
    return true
  end
  false
end

def over?(board)
  if (draw?(board) == true) || (won?(board) == true) || (full?(board) == true)
    return true
  end
  false
end

def winner(board)
  if won?(board) != false
    array = won?(board)
    winn = array[0]
    return board[winn]
  else
    nil
  end
end


