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
  [2,4,6]
  ]


def won?(board)
    WIN_COMBINATIONS.each do |combination|
      if combination.all? { |position| board[position] == 'X'}
        return combination
       elsif combination.all? { |position| board[position] == 'O'}    # Seperate for 'X' and 'O' otherwise draws don't work
        return combination
      end
    end
    return false
end

def full?(board)
  board.all?{|position| position=="X"||position=="O"}
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  draw?(board)||won?(board)
end

def winner(board)
  if !over?(board)
    return nil
  end
  board[won?(board)[0]]=="X"?"X":"O"
end