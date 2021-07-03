# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0,1,2], #top row
  [3,4,5], #middle row
  [6,7,8], #bottom row
  [0,3,6], #first column
  [1,4,7], #second column
  [2,5,8], #third column
  [0,4,8], #diagonal top left to bot right
  [6,4,2]] #diagonal bot left to top right

#has anyone won yet?
def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    position_1 = board[win_combination[0]]
    position_2 = board[win_combination[1]]
    position_3 = board[win_combination[2]]
    if position_1 == position_2 && position_2 == position_3 && !(position_1 == " ")
      return win_combination

    end

  end
return false
end

# is the board full?
def full?(board)
 !board.any?{|i| i == " "}
end

# is the game a draw?
def draw?(board)
  full?(board) && !won?(board)
end

# is the game over?
def over?(board)
  draw?(board) || won?(board)
end

# who is the winner?
def winner(board)
  if won?(board)
    return board[won?(board)[0]]
  end
end


