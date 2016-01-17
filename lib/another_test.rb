board = ["X", "O", "X", "O", "X", "X", "O", "X", "O"]
# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
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
   def is_x(board)
    WIN_COMBINATIONS.each do |win_combination|
    if win_combination.all? {|win_index| board[win_index] == "X"} 
      true
    else 
      false
    end
    end
  end
  if is_x == true
    return win_combination
end

WIN_COMBINATIONS.each do |win_combination|
  win_combination.all? {|win_index| board[win_index] == "O"} 
    return win_combination
  end
  else 
    return false
end
end


board = [" ", "O", " ", " ", "O", " ", " ", "O", " "]


empty
board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
win 
board = ["X", "O", "X", "O", "X", "O", "O", "O", "X"]
board = ["X", "X", "X", " ", " ", " ", " ", " ", " "]
draw
board = ["X", "O", "X", "O", "X", "X", "O", "X", "O"]
