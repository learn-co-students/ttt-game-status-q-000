# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]

def won?(board)
  WIN_COMBINATIONS.each do |combination|
    windex1 = combination[0]
    windex2 = combination[1]
    windex3 = combination[2]
    if (board[windex1] == "X" && board[windex2] == "X" && board[windex3] == "X")
    return combination
  elsif (board[windex1] == "O" && board[windex2] == "O" && board[windex3] == "O")
    return combination
    end
  end
  else
    return false
  end

def full?(board)
  !(board.include?(" "))
end

def draw?(board)
  (full?(board) == true) && (won?(board) == false)
end

def over?(board)
  (full?(board) == true) || (draw?(board) == true) || (won?(board) == true)
end

def winner(board)
  if won?(board) == false
    return nil
  end
  won?(board).each do |spot|
    if board[spot] == "X"
      return "X"
    elsif board[spot] == "O"
      return "O"
    end
end
end