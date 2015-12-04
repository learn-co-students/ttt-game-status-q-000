# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
    [0, 1, 2],   #top row
    [3, 4, 5],   #middle row
    [6, 7, 8],   #bot row
    [0, 3, 6],   #L column
    [1, 4, 7],   #M column
    [2, 5, 8],   #R column
    [0, 4, 8],   #LD diagonal
    [6, 4, 2]    #RU diagonal
  ]

def won?(board)
  #WIN_COMBINATIONS.any? { |combo| combo.all? {|item| item == "X"} }
  winner = WIN_COMBINATIONS.detect { |combo|
    combo.all? {|item| board[item] == "X" } || combo.all? {|item| board[item] == "O" }
    }
  winner.nil? ? nil : winner
end

def full?(board)
  is_full = WIN_COMBINATIONS.all? do |combo|
    combo.all? {|item| position_taken?(board, item)}
  end
end

def full2?(board)
  counter = -1
  is_full = board.all? do
    counter += 1
    position_taken?(board, counter)
  end
end


def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) || draw?(board) || full?(board)
end

def winner(board)
  won?(board).nil? ? nil : board[won?(board)[0]]
end


