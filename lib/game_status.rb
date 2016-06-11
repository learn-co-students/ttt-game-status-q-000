# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
[0, 1, 2],
[3, 4, 5],
[6, 7, 8],
[0, 3, 6],
[1, 4, 7],
[2, 5, 8],
[0, 4, 8],
[2, 4, 6],
]

# Define your won? method
def won?(board)
  if board.include? ("" || " ")
    return false
  else
    WIN_COMBINATIONS.find do |win_combination|
      win_combination.all? { |i| (board[i] == "X") } || win_combination.all? { |i| (board[i] == "O") }
    end
  end
end

# Define your full? method
def full?(board)
  if board.all? { |i| (i == "X" || i == "O") }
    return true
  end
end

# Define your draw? method
def draw?(board)
  if board.any? {|i| i == ""}
    return true
  else full?(board) && !won?(board)
  end
end

# Define your over? method
def over?(board)
  if won?(board)
    return true
  else draw?(board)
  end
end

# Define your winner? method
def winner(board)
  if won?(board)
    return board[won?(board)[0]]
  else
    return nil
  end
end
