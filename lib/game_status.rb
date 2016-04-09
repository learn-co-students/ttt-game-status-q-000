# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS = [
[0, 1, 2], # top
[3, 4, 5], # middle
[6, 7, 8], # bottom
[0, 3, 6], # left
[1, 4, 7], # center
[2, 5, 8], # right
[6, 4, 2], # diogonal 1
[0, 4, 8], # diagonal 2
]

def won?(board)
  for win_comb in WIN_COMBINATIONS
    win_index = [ board[win_comb[0]], board[win_comb[1]], board[win_comb[2]] ] # creates array with winning indexes on the board
    if win_index.all? { |v| v == "O"} || win_index.all? { |v| v == "X"}
      return win_comb
    end
  end
  return false
end


def full?(board)
  if board.any? {|value| value == " "}
    return false
  else
    return true
  end
end


def draw?(board)
  if won?(board)
    return false
  elsif !full?(board) && !won?(board)
    return false
  elsif full?(board) && !won?(board)
    return true
  end
end


def over?(board)
  if !full?(board)
    return false
  elsif won?(board) || full?(board) || draw?(board)
    return true
  end
end



def winner(board)
  if won?(board)
    winner_index = won?(board)
 
    winner_array = [ board[winner_index[0]], board[winner_index[1]], board[winner_index[2]] ]
    if winner_array.all? {|value| value == "X" }
      return "X"
    elsif winner_array.all? {|value| value == "O" }
      return "O"
    end
  end
  return nil
end