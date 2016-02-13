
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

def won?(board)
  WIN_COMBINATIONS.detect do |win_index|
    position_1 = board[win_index[0]]
    position_2 = board[win_index[1]]
    position_3 = board[win_index[2]]

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      win_index
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      win_index
    else
      false
    end
  end
end



def full?(board)
  !(board.include?(" "))
end

def draw?(board)
  full?(board)
  !(won?(board))
end

def over?(board)
  won?(board)
  full?(board)
end

def winner(board)
  if won?(board)
    win_token = won?(board)
    board[win_token[0]]
  end
end





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