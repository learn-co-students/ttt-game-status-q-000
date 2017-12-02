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
  WIN_COMBINATIONS.any? do |combination|
    if combination.all? { |x| board[x] == "X" } || combination.all? { |o| board[o] == "O"}
      return combination
    end
  end
end

def full?(board)
  board.select { |index| index != " " }.length == 9 ? true : false
end

def draw?(board)
  if full?(board) && !won?(board)
    true
  end
end

def over?(board)
  if full?(board) && draw?(board) || full?(board) && won?(board)
    true
  end
end

def winner(board)
  sequence = won?(board)
  sequence.is_a?(Array) ? board[sequence[0]] : nil
end