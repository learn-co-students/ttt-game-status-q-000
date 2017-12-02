# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS = [
  [0, 1, 2], #Top row win
  [3, 4, 5], # Middle Row Win
  [6, 7, 8], # Bottom Row Win
  
  [0, 3, 6], # First column win
  [1, 4, 7], # Second Column Win
  [2, 5, 8], # Third Column Win

  [0, 4, 8], # Diagonal Win
  [2, 4, 6] # Diagonal Win
]

def won?(board)
  WIN_COMBINATIONS.detect do |combination|
    combination.all? {|play| board[play] == 'X'} || combination.all? {|play| board[play] == 'O'}
  end
end

def full?(board)
  if board.none?{|space|space == " "} then true
  end
end

def draw?(board)
  unless won?(board)
    return true
  end
end

def over?(board)
  unless won?(board) || full?(board)
    return false
  else
    return true
  end
end

def winner(board)
  unless won?(board)
    return nil
  end
  if board[won?(board)[0]] == "X"
    return "X"
  elsif board[won?(board)[0]] == "O"
    return "O"
  end
end


