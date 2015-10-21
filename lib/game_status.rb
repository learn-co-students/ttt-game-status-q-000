# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS =[
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]
]

def won?(board)
  WIN_COMBINATIONS.each do |win_combo|
    pos_0 = board[win_combo[0]]
    pos_1 = board[win_combo[1]]
    pos_2 = board[win_combo[2]]

    return win_combo if pos_0 == "X" && pos_1 == "X" && pos_2 == "X"
    return win_combo if pos_0 == "O" && pos_1 == "O" && pos_2 == "O"
  end
  false
end

def full?(board)
  return true unless board.any? { |b| b.strip.empty? }
  false
end

def draw?(board)
  board.all? { |b| !b.strip.empty? } && !won?(board)
end

def over?(board)
  return false unless full?(board) || draw?(board)
  true
end

def winner(board)
  if combo = won?(board)
    board[combo.first]
  end
end
