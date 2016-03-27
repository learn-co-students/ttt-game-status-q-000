# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

WIN_COMBINATIONS = [
  [0, 1, 2], #Top Row
  [3, 4, 5], #Middle Row
  [6, 7, 8], #Bottom Row

  [0, 3, 6], #Left Column
  [1, 4, 7], #Middle Column
  [2, 5, 8], #Right Column

  [0, 4, 8], #Diagonal 1
  [2, 4, 6] #Diagonal 2
]



def won?(board)
  WIN_COMBINATIONS.find do |win|
    position_taken?(board, win[0]) && win.all? { |x| board[x] == board[win[0]] }
  end
end


def full? (board)
  !board.any? do |x|
    x == " "
  end
end


def draw? (board)
  full?(board) && !won?(board)
end


def over? (board)
  won?(board) || draw?(board) || full?(board)
end


def winner (board)
  gold = won?(board)
  if won?(board)
    return board[gold[0]]
  else
    return nil
  end
end
