
WIN_COMBINATIONS = [
  [0,1,2], 
  [3,4,5], 
  [6,7,8], 
  [0,4,8], 
  [2,4,6], 
  [0,3,6], 
  [2,5,8], 
  [1,4,7]]


# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end


def won?(board)
  retval = false

  WIN_COMBINATIONS.each do |combo|
    won = combo.all? do |i|
      board[i] == "X"
    end
    if won
      retval = combo
      break
    end

    won = combo.all? do |i|
      board[i] == "O"
    end
    if won
      retval = combo
      break
    end
  end
  retval
end

def full?(board)
  full = board.all? do |square|
      (!square.nil? && square.strip.size > 0) 
  end
end

def draw?(board)
  #true not won and full
  #false not won and not full
  if !(winner board).nil?
    false
  elsif full? board
    true
  else false
  end
    

  #!( full? board || (over? board ))
end

def over?(board)
  !(winner board).nil? || (full? board )
end

def winner(board)
  #won returns an array with the winning indices [[0],[1],[4]]
  winner = won? board
  if winner
    board[winner[0]]
  end
end

# Define your WIN_COMBINATIONS constant
