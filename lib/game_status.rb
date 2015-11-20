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
  [6,4,2]
]

def won?(board)
  WIN_COMBINATIONS.detect do |combination|
    xwins = combination.all? { |index| board[index] == "X" }
    owins = combination.all? { |index| board[index] == "O" }

    xwins || owins
  end
end

def full?(board)
  board.all? { |cell| cell == "X" || cell == "O" }
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  full?(board)
end

def winner(board)
  WIN_COMBINATIONS.detect do |combination|
    xwins = combination.all? { |index| board[index] == "X" }
    owins = combination.all? { |index| board[index] == "O" }

    if (xwins && owins)
      return nil
    elsif xwins
      return "X"
    elsif owins
      return "O"
    end
  end
end