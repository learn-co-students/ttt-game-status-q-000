# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def won?(board)
  if board.all?{ |position| position == " " }
    false
  elsif
    WIN_COMBINATIONS.each do |combo|
      plays = [board[combo[0]],board[combo[1]],board[combo[2]]]
      if (plays == ["X","X","X"]) || (plays == ["O","O","O"])
        return combo
      else
        false
      end
    end
  else
    true
  end
end

def full?(board)
  board.none?{ |position| position == " " }
end

def draw?(board)
  if full?(board)
    if !(won?(board))
      true
    else
      false
    end
  else
    false
  end
end

def over?(board)
  if (won?(board)) || (draw?(board)) || full?(board)
    true
  else
    false
  end
end

def winner(board)
  winning_combo = won?(board)
  if winning_combo
    return board[winning_combo[0]]
  else
    nil
  end
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], #top row
  [3,4,5], #mid row
  [6,7,8], #low row
  [0,3,6], #left v
  [1,4,7], #mid v
  [2,5,8], #rite v
  [0,4,8], #diag1
  [2,4,6] #diag2
]
