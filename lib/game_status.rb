# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
  # ETC, an array for each win combination
]



def won?(board)
  win_combinations = WIN_COMBINATIONS
  win_combinations.detect do |combos|
    if position_taken?(board, combos[0]) && position_taken?(board, combos[1]) && position_taken?(board, combos[2])
      status = board[combos[0]]==board[combos[1]] && board[combos[1]]==board[combos[2]]
      status
    end
  end
end

def full?(board)
  board.all? do |space|
    !(space.nil? || space == " ")
  end
end

def draw?(board)
  (full?(board) && !won?(board))
end

def over?(board)
  (draw?(board) || won?(board))
end

def winner(board)
  if won?(board) != nil
    champ = won?(board)
    board[champ[0]]
  else
    nil
  end
end