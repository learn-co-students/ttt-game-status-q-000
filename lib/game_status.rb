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
  WIN_COMBINATIONS.each do |combination|
    if position_taken?(board, combination[0]) && board[combination[0]] ==
      board[combination[1]] && board[combination[1]] == board[combination[2]]
      return combination
    end
  end
  false
end

def full?(board)
  board.none?{|i| i == " "}
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) || draw?(board) ||full?(board)
end

def winner(board)
  winner = won?(board)
  if winner
    return board[winner[0]] || board[winner[0]]
  end
  nil
end
