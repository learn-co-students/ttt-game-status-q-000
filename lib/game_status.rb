# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [1, 4, 7],
  [2, 5, 8],
  [0, 3, 6],
  [0, 4, 8],
  [2, 4, 6]
]

def won?(board)

  WIN_COMBINATIONS.find do | win_combination |

    win_index_1 = win_combination[0] # 0, 3
    win_index_2 = win_combination[1] # 1, 4
    win_index_3 = win_combination[2]

    sign_1 = board[win_index_1] # X
    sign_2 = board[win_index_2] # O ETC
    sign_3 = board[win_index_3]

    if sign_1 == sign_2 && sign_2 == sign_3 && sign_1 != " "
      return win_combination
    else
      false
    end
  end
end

def full?(board)
  board.none? {|space| space == " "}
end

def draw?(board)
  if full?(board) && !won?(board)
    return true
  else
    return false
  end
end

def over?(board)
  won?(board) || draw?(board)
end

def winner(board)
  win_combination = won?(board)
  if win_combination
    win_index = win_combination[0]
    board[win_index]
  end
end



=begin #won
Simply return the index of the winning combo
We have win combos
we have a current board
we need to iterate into each win combo one by one
each iterated win combo has 3 indexes. We need to iterate each index number
each iterated number (2nd iteration) to see if it is taken with the position take method
use && operator method to see if all three indexes pass (true) the position taken method
if true. return the indexes of winning combo
else, continue to iterate


=end
