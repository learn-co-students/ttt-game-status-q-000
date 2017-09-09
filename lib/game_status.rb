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
  winner = false
  WIN_COMBINATIONS.each do |wincombo|
    win_index_1 = wincombo[0]
    win_index_2 = wincombo[1]
    win_index_3 = wincombo[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      winner = wincombo
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      winner = wincombo
    else
      false
    end
    break if winner
  end
  return winner
end

def full?(board)
  board.all? do |i|
    i == "X" || i == "O"
  end
end

def draw?(board)
   full?(board) && !won?(board)
end

def over?(board)
  won?(board) || draw?(board) || full?(board)
end

def winner(board)
  if wincombo = won?(board)
    board[wincombo.first]
  end
end
