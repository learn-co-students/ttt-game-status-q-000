# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
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

  board.all? do |space|
    space != " "
  end

  WIN_COMBINATIONS.find do |combo|
    win_index_1 = combo[0]
    win_index_2 = combo[1]
    win_index_3 = combo[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return combo
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return combo
    else
      false
    end
  end
end

def full?(board)
  board.none? {|space| space == " "}
end

def draw?(board)
  if !won?(board) && full?(board)
    return true
  end 
end

def over?(board)
  if won?(board) || draw?(board) || full?(board)
    return true
  end
end

def winner(board)
  if won?(board)
    win_combo = won?(board)
    position = win_combo[0]
    token = board[position]
    return token
  else 
    return nil
  end
end

board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
won?(board)
