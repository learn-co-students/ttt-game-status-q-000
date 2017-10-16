# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end


# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2], [3, 4, 5], [6, 7, 8], #rows    0 1 2
  [0, 3, 6], [1, 4, 7], [2, 5, 8], #cols    3 4 5
  [0, 4, 8], [6, 4, 2]             #diags   6 7 8
]

def won?(board)
  WIN_COMBINATIONS.each do |combination|
    # print "Combination #{combination}\n"
    if combination.all? { |c| position_taken?(board, c) && board[c] == board[combination[0]]}
      return combination
    end
  end
  return false
end


def full?(board)
  !board.any? {|b| b == " "}
end

def draw?(board)
  return (full?(board) && !won?(board))
end

def over?(board)
  return (won?(board) || draw?(board))
end

def winner(board)
  winner = won?(board)
  if winner
    return board[winner[0]]
  else
    return nil
  end  
end

# puts full?([" ", " ", " ", " ", " ", " ", " ", " ", " "])
# print full?(["X", "X", "X", " ", " ", " ", " ", " ", " "])
# print full?(["X", "X", "X", "X", "X", "X", "X", "X", "X"])
# print draw?(["X", "O", "X", "O", "X", "X", "O", "X", "O"])
puts winner(["X", " ", " ", " ", "X", " ", " ", " ", "X"])
puts winner(["X", "O", " ", " ", " ", " ", " ", "O", "X"])