# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
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
  [2, 4, 6]
]

def won?(board)
  WIN_COMBINATIONS.each do |combo|
    if position_taken?(board, combo[0]) && board[combo[0]] == board[combo[1]] && board[combo[1]] == board[combo[2]]
    return combo
      end
    end
  false
end


def full?(board)
  board.each_with_index do |token, index|
    if !position_taken?(board, index)
      return false
      end
    end
end


def draw?(board)
  if full?(board) && !won?(board)
    return true
  end
end


def over?(board)
  won?(board) || draw?(board)  
end


def winner(board)
  win_combo = won?(board)
  if win_combo 
    return board[win_combo[0]]
  else 
    return nil
  end
end





