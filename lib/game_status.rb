# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
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

    if board[WIN_COMBINATIONS[0][0]] == "X"  && board[WIN_COMBINATIONS[0][1]] == "X"  && board[WIN_COMBINATIONS[0][2]] == "X"
     WIN_COMBINATIONS[0]
    elsif board[WIN_COMBINATIONS[1][0]] == "X"  && board[WIN_COMBINATIONS[1][1]] == "X"  && board[WIN_COMBINATIONS[1][2]] == "X"
     WIN_COMBINATIONS[1]
    elsif board[WIN_COMBINATIONS[2][0]] == "X"  && board[WIN_COMBINATIONS[2][1]] == "X"  && board[WIN_COMBINATIONS[2][2]] == "X"
     WIN_COMBINATIONS[2]
elsif board[WIN_COMBINATIONS[3][0]] ==  "O" && board[WIN_COMBINATIONS[3][1]] == "O"  && board[WIN_COMBINATIONS[3][2]] ==  "O"
     WIN_COMBINATIONS[3]
    elsif board[WIN_COMBINATIONS[4][0]] == "O"  && board[WIN_COMBINATIONS[4][1]] == "O"  && board[WIN_COMBINATIONS[4][2]] == "O"
     WIN_COMBINATIONS[4]
    elsif board[WIN_COMBINATIONS[5][0]] == "O"  && board[WIN_COMBINATIONS[5][1]] == "O"  && board[WIN_COMBINATIONS[5][2]] == "O"
     WIN_COMBINATIONS[5]
elsif board[WIN_COMBINATIONS[6][0]] == "X"  && board[WIN_COMBINATIONS[6][1]] == "X"  && board[WIN_COMBINATIONS[6][2]] == "X"
     WIN_COMBINATIONS[6]
    elsif board[WIN_COMBINATIONS[7][0]] == "O"  && board[WIN_COMBINATIONS[7][1]] == "O"  && board[WIN_COMBINATIONS[7][2]] == "O"
     WIN_COMBINATIONS[7]
  else
      false
end
end

def full?(board)
   !(board.any? { |i| i == " "})

end

def draw?(board)
  if full?(board) == true && won?(board)  == false
    then true
    else false
    end
  end

  def over?(board)
    if full?(board) == true || won?(board) == true || draw?(board) == true
      then true
      else false
      end
    end

def winner(board)
  if won?(board) != false
    board.detect{ |i| board.count(i) > 2}
  else
    nil
    end
end





