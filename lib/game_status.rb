# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
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
  WIN_COMBINATIONS.each do |win_array|
    position_1 = board[win_array[0]]
    position_2 = board[win_array[1]]
    position_3 = board[win_array[2]]

    if position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 == "O" 
      return win_array
    end
  end
  false
end


def full?(board)
  board.all? do |position|
    position == "X" || position == "O"
  end
end


# Details about #draw? method: 
# returns true for a draw (no win + full board)
# returns false for a won game (win + full board)
# returns false for an in-progress game (no win + not full board)

def draw?(board)
  if !(won?(board)) && full?(board)
    return true
  elsif won?(board) && full?(board) || !(won?(board) && full?(board))
    return false
  end
end


# Details about #over? method:
# returns true for a won game, a draw, or a full board

def over?(board)
  if won?(board) || draw?(board) || full?(board)
    return true
  else
    return false
  end
end


def winner(board)
  if won?(board)
    token = won?(board)[0]

    return board[token]
  end
end

