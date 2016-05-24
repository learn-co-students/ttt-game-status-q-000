# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

WIN_COMBINATIONS = [
[0,1,2],
[3,4,5],
[6,7,8],
[0,3,6],
[1,4,7],
[2,5,8],
[0,4,8],
[6,4,2]
]


def won? (board)
  WIN_COMBINATIONS.each do |combo|

    position1 = board[combo[0]]
    position2 = board[combo[1]]
    position3 = board[combo[2]]

      if (position1 == "X" && position2 == "X" && position3 == "X") || (position1 == "O" && position2 == "O" && position3 == "O")
        return combo
      elsif full? (board)
      end
    end
    false
end

def full? (board)
board.any? {|i| i == " "}
    return false
  else
    return true
end




# Define your WIN_COMBINATIONS constant
