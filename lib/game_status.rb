# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]




def won?(board)

  WIN_COMBINATIONS.detect do |combination|
    win_index_1 = combination[0]
    win_index_2 = combination[1]
    win_index_3 = combination[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

      if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
        return combination
      else
        false
      end
  end

end


def full?(board)
    board.all? do |spot|
      if spot == "X" || spot == "O"
        true
      else
        false
      end
    end

  end

#Build a method `#draw?` that accepts a board and returns true if the board has not been won and is full and false if the board is not won and
#the board is not full, and false if the board is won. You should be able to compose this method solely using the methods you used above with
#some ruby logic.

def draw?(board)
    !won?(board) && full?(board)
end

def over?(board)
  #draw?(board) ||
  !won?(board) == false || draw?(board)
end


def winner(board)
  if !won?(board) == false
    return board[won?(board)[0]]
    #  "\"#{board[won?(board)[0]]}\" "
  end
end
