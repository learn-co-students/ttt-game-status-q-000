#Code inspired by github.com/NolanChan

def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

def full?(board)
  !board.include?(" ")
end

WIN_COMBINATIONS = [
#Across
[0, 1, 2],
[3, 4, 5],
[6, 7, 8],
#Down
[0, 3, 6],
[1, 4, 7],
[2, 5, 8],
#Diagonal
[0, 4, 8],
[2, 4, 6]
]


def won?(board)
    WIN_COMBINATIONS.each do |win_combo|
    position1 = board[win_combo[0]]
    position2 = board[win_combo[1]]
    position3 = board[win_combo[2]]
    if position1 != " " && position1 == position2 && position2 == position3
      return win_combo
    end
  end
  false
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) || full?(board)
end

def winner(board)
  if won?(board)
    return board[won?(board)[0]]
  else
    nil
  end
end
