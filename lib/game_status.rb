# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

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

# Define your WIN_COMBINATIONS constant

def won?(board)
  return false if board.all?{|x| x == " "}
  WIN_COMBINATIONS.each do |wincombo|
    if wincombo.all?{|idx| board[idx] == "X"} || wincombo.all?{|idx| board[idx] == "O"}
      return wincombo
    end
  end
  false
end

def full?(board)
  board.none?{|x| x == " " || x.nil?}
end

def draw?(board)
  return false if won?(board)
  return false if !won?(board) && !full?(board)
  return true if full?(board) && !won?(board)
end

def over?(board)
  won?(board) || draw?(board) || full?(board)
end

def winner(board)
  unless won?(board)
    return nil
  end
  board[won?(board)[0]]
end