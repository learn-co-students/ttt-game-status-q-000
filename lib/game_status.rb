# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS=[
                  [0,1,2],
                  [3,4,5],
                  [6,7,8],
                  [0,3,6],
                  [1,4,7],
                  [2,5,8],
                  [0,4,8],
                  [6,4,2]
]

def won?(board)
  if WIN_COMBINATIONS.include?("X") || WIN_COMBINATIONS.include?("O")
    return board[WIN_COMBINATIONS]
  else
    return false
  end
  board.select do | matches |
    matches.select do | more_matches |
    if more_matches.include?("X") || more_matches.include?("O")
      return board[more_matches]
    end
  end
  end
end
#
# def full?()
#
# end
#
# def draw?()
#
# end
#
# def over?()
#
# end
#
# def winner?()
#
# end
