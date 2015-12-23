# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6],]

def full?(board)
  if board.any?{|element| element == " "}
    false
  else
    true
  end
end


def draw?(board)
  if won?(board) == nil
    true
  else
    false
  end
end

def over?(board)
  if board.any?{|item| item == " "} == true
    false
  else
    true
  end
end

def winner(board)
  if won?(board) == false
    return nil
  else
    return board[won?(board)[0]]
  end
end

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
  win_index_1 = win_combination[0]
  win_index_2 = win_combination[1]
  win_index_3 = win_combination[2]
  position_1 = board[win_index_1] # load the value of the board at win_index_1
  position_2 = board[win_index_2] # load the value of the board at win_index_2
  position_3 = board[win_index_3] # load the value of the board at win_index_3
  if position_1 != " " && position_1 == position_2 && position_2 == position_3
    return win_combination # return the win_combination indexes that won.
  else
    false
  end
  end
  if over?(board) == false
    false
  end
end