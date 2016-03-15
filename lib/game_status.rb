
# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], [3,4,5], [6,7,8],  # horizontal
  [0,3,6], [1,4,7], [2,5,8],  # vertical
  [0,4,8], [2,4,6]            # diagonal

]

def won?(board)
  if board == [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    return false
  end 

  WIN_COMBINATIONS.each do |win_comb|
    a = win_comb[0]
    b = win_comb[1]
    c = win_comb[2]
    position_a = board[a]
    position_b = board[b]
    position_c = board[c]
    if position_a == "X" && position_b == "X" && position_c == "X"
      return win_comb
    elsif position_a == "O" && position_b == "O" && position_c == "O"
      return win_comb
    end
  end
  return false
end

def full?(board)
  !board.include?(" ")
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  full?(board) || won?(board)
end

def winner(board)
  if won?(board) == false
    return nil
  else
    win_comb = won?(board)
    return "#{board[win_comb[0]]}"
  end
end