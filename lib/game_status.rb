# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end


# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]

def won?(board)
  answer = true
  WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]
    
    position_1 = board[win_index_1] 
    position_2 = board[win_index_2] 
    position_3 = board[win_index_3]


    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return answer = win_combination
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return answer = win_combination
    else
      answer = false
    end
  end
  answer
end

def full?(board)
  if board.any? {|space| space.include?(" ")}
    false
  else
    true
  end
end

def draw?(board)
  if full?(board)
    if won?(board)
      false
    else 
      true
    end
  else
    false
  end
end

def over?(board)
  if draw?(board) || won?(board)
    true
  else
    false
  end
end

def winner(board)
  if won?(board) == false
    nil
  else
    x = won?(board)[0]
    if board[x] == "X"
      "X"
    else
      "O"
    end
  end
end