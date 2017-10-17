# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom row
  [0,3,6], # Left column
  [1,4,7], # Middle column
  [2,5,8], # Right column
  [0,4,8], # cross1
  [2,4,6] # cross2
]

#method should accept a board as an argument and return false/nil
#if there is no win combination present in the board and return the
#winning combination indexes as an array if there is a win. To clarify:
#this method should not return who won (aka X or O), but rather how they
#won -- by means of the winning combination.
=begin
def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
  # win_combination is a 3 element array of indexes that compose a win, [0,1,2]
  # grab each index from the win_combination that composes a win.
    if board[win_combination][0] == "X" && board[win_combination][1] == "X" && board[win_combination][2] == "X"
      return win_combination # return the win_combination indexes that won.
    elsif board[win_combination][1] == "O" && board[win_combination][1] == "O" && board[win_combination][2] == "O"
      return win_combination
    else
      false
    end
  end
end

def won?(board)
  WIN_COMBINATIONS.detect do |combo|
    board[combo[0]] == board[combo[1]] &&
    board[combo[1]] == board[combo[2]] &&
    position_taken?(board, combo[0])
  end
end
=end

def won?(board)
  WIN_COMBINATIONS.find do |combo| # combo is like: [0,1,2]
    #combo == [0,1,2]
    #combo[2]
    if ((board[combo[0]] == "X" && board[combo[1]] == "X" && board[combo[2]] == "X") ||
      (board[combo[0]] == "O" && board[combo[1]] == "O" && board[combo[2]] == "O"))
      ""
    else
      false
    end
  end
  # combo || false
end

def full?(board)
  board.all?{|marker| marker == "X" || marker == "O"}
end

#accepts a board and returns true if the board has not been won
#and is full and false if the board is not won and the board is
#not full, and false if the board is won
def draw?(board)
  full?(board) && !won?(board)
end

#returns true if the board has been won, is a draw, or is full
def over?(board)
  won?(board) || draw?(board)
end

#return the token, "X" or "O" that has won the game given a winning board.
def winner(board)
  if combo_or_nil = won?(board)
    board[combo_or_nil[0]]
  end
end
