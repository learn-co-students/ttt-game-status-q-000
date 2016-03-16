# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [ [0,1,2] , [3,4,5] , [6,7,8] , [0,3,6] , [1,4,7] , [2,5,8] , [0,4,8] , [2,4,6] ]

# Define won? method
def won?(board)
  WIN_COMBINATIONS.each do |combo|
    win_index_1 = combo[0]
    win_index_2 = combo[1]
    win_index_3 = combo[2]
    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

    if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
      return combo
    end

  end
  return false
end

#define full? method (return true if no available position)
def full?(board)
  board.all? do |mark|
    mark == "X" || mark == "O"
  end
end

#define draw? method
def draw?(board)
  if full?(board) && won?(board) == false
    return true
  end
end

#define over? method
def over?(board)
  if won?(board) || draw?(board) || full?(board)
    return true
  end
end

#define winner method
def winner(board)
    WIN_COMBINATIONS.each do |combo|
    win_index_1 = combo[0]
    win_index_2 = combo[1]
    win_index_3 = combo[2]
    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

    if (position_1 == "X" && position_2 == "X" && position_3 == "X")
      return "X"
    elsif (position_1 == "O" && position_2 == "O" && position_3 == "O")
      return "O"
    end
  end
  return nil
end