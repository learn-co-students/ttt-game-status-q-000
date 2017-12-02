# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], #= Top Row
  [3,4,5], #= Middle Row
  [6,7,8], #= Bottom Row
  [0,3,6], #= Left Vertical
  [1,4,7], #= Middle Verticle
  [2,5,8], #= Right Verticle
  [0,4,8], #= Diagnol top left to bottom right
  [6,4,2] #= Diagnal bottom left to top right
  ]

def won?(board)
  WIN_COMBINATIONS.detect do |combo|
    board[combo[0]] == board[combo[1]] &&
    board[combo[1]] == board[combo[2]] &&
    position_taken?(board, combo[0])
  end
end


def full?(board)
  board.all? { |filled| filled == "X" || filled == "O" }
end



def draw?(board)
  full?(board) && !won?(board)
end


def over?(board)
  won?(board) || full?(board)
end

def winner(board)
  if winning_combo = won?(board)
    board[winning_combo.first]
  end
end

def turn_count(board)


end