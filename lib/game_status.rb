# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2] #= Top Row
  [3,4,5] #= Middle Row
  [6,7,8] #= Bottom Row
  [0,3,6] #= Left Vertical
  [1,4,7] #= Middle Verticle
  [2,5,8] #= Right Verticle
  [0,4,8] #= Diagnol top left to bottom right
  [6,4,2] #= Diagnal bottom left to top right

  ]


def turn_count(board)


end