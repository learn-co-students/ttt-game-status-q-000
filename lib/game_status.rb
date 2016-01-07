# Helper Method
#require 'pry'
def position_taken?(board, position)
  !(board[position].nil? || board[position] == " ")
end

board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [6, 4, 2]
  ]

def won?(board)

  WIN_COMBINATIONS.find do |combo|
 #   board[combination[0]] == "X" || board[combination[0]] == "O" && board[combination[0]] == board[combination[1]] && board[combination[0]] == board[combination[2]]
    board[combo[0]] == board[combo[1]] &&
    board[combo[1]] == board[combo[2]] &&
    position_taken?(board, combo[0])
  end
end
#full
def full?(board)
  board.each do |cell|
    cell != " " or cell != "nil"
    if cell == " " or cell == "nil"
      return false
    end
  end
end
#draw
def draw?(board)
  full?(board) && !won?(board)

end
#over
def over?(board)
  draw?(board) && full?(board) or won?(board)
end

def winner(board)
  if won?(board)
    winner_array = won?(board)
    board[winner_array[0]]
  else
    return nil
  end


end



