# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom row
  [0,3,6], # First column
  [1,4,7], # second column
  [2,5,8], # third column
  [0,4,8], # diagonal win from left
  [2,4,6]  # diagonal win from right
  # ETC, an array for each win combination
]

def won?(board)

  WIN_COMBINATIONS.find do |i|
     board[i[0]] == board[i[1]] &&
     board[i[1]] == board[i[2]] &&
     position_taken?(board, i[0])
  end
end

def full?(board)
  board.all?{|i| i == "X" || i == "O"}
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  won?(board) || draw?(board)
end

def winner(board)
  if i = won?(board)
    board[i.first]
  end
end


# def winner?(board)
#   if won?(board).first == "X"
#     return "X"
#   else return "O"
#   end
# end

# Helper Method
# AVI'S SOLUTION
# def position_taken?(board, location)
#   !(board[location].nil? || board[location] == " ")
# end

# # Define your WIN_COMBINATIONS constant
# WIN_COMBINATIONS = [
#   [0,1,2],
#   [3,4,5],
#   [6,7,8],
#   [0,3,6],
#   [1,4,7],
#   [2,5,8],
#   [0,4,8],
#   [6,4,2]
# ]

# # Define won?, full?, draw?, over?, and winner below
# def won?(board)
#   WIN_COMBINATIONS.detect do |combo|
#     board[combo[0]] == board[combo[1]] &&
#     board[combo[1]] == board[combo[2]] &&
#     position_taken?(board, combo[0])
#   end
# end

# def full?(board)
#   board.all?{|token| token == "X" || token == "O"}
# end

# def draw?(board)
#   full?(board) && !won?(board)
# end

# def over?(board)
#   won?(board) || full?(board)
# end

# def winner(board)
#   if winning_combo = won?(board)
#     board[winning_combo.first]
#   end
# end