# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combination
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combination
    else
      false
    end
    end
    return false
  end


def full?(board)
  board.each do |piece|
    if piece == " "
      return false
    end
  end
  return true
end

def draw?(board)
  board.each do |piece|
    if won?(board) == false
      return true
    end
  end
  return false
end

def over?(board)
  board.each do |piece|
    if full?(board) == true
      return true
    end
  end
  return false
end

def winner(board)
  if won?(board)
  winning_combination = won?(board) #[6,7,8]
  winning_position = winning_combination[0] #6
  #board = ["x","x"," "," "," "," ","O","O","O"]
  board[winning_position] #0

end

  # return "X"
  #    return "X"
  #else board(WIN_COMBINATIONS) == "O"
  #    return "O"
  #  end
end


# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], #Top Row
  [3,4,5], #Middle Row
  [6,7,8], #Bottom Row
  [0,3,6], #Left column
  [1,4,7], #Middle column
  [2,5,8], #Right column
  [0,4,8], #L-R Diagonal
  [2,4,6], #R-L Diagonal
]

board = ["x","x"," "," "," "," ","O","O","O"]
winning_combination = won?(board) #
