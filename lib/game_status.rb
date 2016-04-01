# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]

def won?(board)
  WIN_COMBINATIONS.detect do |winning_array|
    board[winning_array[0]] == board[winning_array[1]] && board[winning_array[1]] == board[winning_array[2]] && position_taken?(board, winning_array[0])
  end
end


def full?(board)
  !board.include?(" "||""||nil)
end

def draw?(board)
  if won?(board)
    return false
  elsif full?(board)
    return true
  end
end

def over?(board)
  full?(board) || won?(board)
end

def winner(board)
  winning_array = won?(board)
  if draw?(board)
    false
  elsif won?(board)
    board[won?(board)[0]]
  end
end