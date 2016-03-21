# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

def won(board)
  board = []
  board.each do |space|
    if space == "X" || space == "O"
    end


    end
end

def full
end

def draw
end

def over
end

def winner
end


# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], #Top Row
  [3,4,5], #Middle Row
  [6,7,8], #Bottom Row
  [0,3,6], #Left column
  [1,4,7], #Middle column
  [2,5,8], #Right column
  [0,4,8], #L-R Diagonal
  [2,4,6], #R-L Diagonal
]
