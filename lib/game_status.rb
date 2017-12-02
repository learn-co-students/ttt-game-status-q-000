# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

WIN_COMBINATIONS = [
  [0,1,2], [3,4,5], [6,7,8],
  [0,3,6], [1,4,7], [2,5,8],
  [0,4,8], [2,4,6]
]

def won? (board)
  WIN_COMBINATIONS.each do |c|
    win_1, win_2, win_3 = c[0], c[1], c[2]
    positions = board[win_1], board[win_2], board[win_3]
  
    if (positions.all? { |p| p == "X" } || positions.all? { |p| p == "O" }) 
      return win_1, win_2, win_3
    end
  end
  return nil 
end

def full? (board)
  !board.any? { |e| e == " " } 
end

def draw? (board)
  !won?(board) && full?(board) 
end

def over? (board)
  won?(board) || full?(board) || draw?(board)
end

def winner (board)
  won_indices = won?(board)
  return board[won_indices[0]] if won_indices
  return nil 
end
