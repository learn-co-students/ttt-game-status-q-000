# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

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
    x_wins = win_combination.all? do |index|
      board[index] == 'X'
    end

    o_wins = win_combination.all? do |index|
      board[index] == 'O'
    end

    if x_wins || o_wins
      return win_combination
    end
  end
  return nil
end

# returns true if all the positions on the board are taken
def full?(board)
  full = Array(0..8).all? do |position|
    position_taken?(board, position)
  end
end

# returns false unless the board is full and there is no winner 
def draw?(board)
  false
  if full?(board) && !won?(board)
    true
  end
end

# returns false unless there is a winner or a draw
# the game isn't over till it's over!
def over?(board)
  false
  if won?(board) || draw?(board)
    true
  end
end

# returns the value of the board at the first position of the winning row
def winner(board)
  if won?(board)
    board[won?(board)[0]]
  end
end