# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
  ]

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1] # load the value of the board at win_index_1
    position_2 = board[win_index_2] # load the value of the board at win_index_2
    position_3 = board[win_index_3] # load the value of the board at win_index_3

    if (position_1 == "X" && position_2 == "X" && position_3 == "X") #|| (position_1 == "O" && position_2 == "O" && position_3 == "O")
      return win_combination     # return the win_combination indexes that won.
    elsif (position_1 == "O" && position_2 == "O" && position_3 == "O")
      return win_combination
    #returns false for empty board
    elsif board.all? {|x| x == " " || x == nil}
      return false
    #returns false for draw
    elsif board.all? {|x| x == "X" || x == "O"}
      return false
    end
  end
end

def full?(board)
  #returns true for draw
  if board.all? {|x| x == "X" || x == "O"}
    return true
  #returns false for in progress game
  elsif board.any? {|x| x == "X" && x == "O" && x == " "}
    return false
  end
end

def draw?(board)
  #returns true for draw
  if board.all? {|x| x == "X" || x == "O"}
    return true
  #returns false for a game won
  elsif won?(board) != false
    return !true
  elsif (won?(board) == false) && (full?(board) == false)
    return false
  end
end

def over?(board)
  #returns true for draw
  if board.all? {|x| x == "X" || x == "O"}
    return true
  #returns true for a won game
  elsif won?(board) == true
    return true
  #returns false for an in progress game
  else
    false
  end
end

def winner(board)
  #return X when X wins
  if won?(board) == true && (position_1 == "X" && position_2 == "X" && position_3 == "X")
    return position_1
  #return O when o wins
  elsif won?(board) == true && position_1 == "O"
    return position_1
  #return nil when no winner
  elsif won?(board) == false
    false
  end
end