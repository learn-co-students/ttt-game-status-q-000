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
  WIN_COMBINATIONS.detect {|win|
       win.all? {|i| board[i] == "X" } ||
       win.all? {|r| board[r] =="O" }}
end


def full?(board)
  board.all? { |i| i == "X" || i == "O"}
end

def draw?(board)
  if full?(board) && !won?(board)
    return true
  end
end

def over?(board)
 won?(board) || draw?(board) || full?(board)
end

def winner(board)
  if won?(board)
    return board[won?(board)[0]]
  end
end

