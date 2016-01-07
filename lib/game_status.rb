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
  WIN_COMBINATIONS.find{
    |combination|
    if position_taken?(board ,combination[0] )
      board[combination[0]] == board[combination[1]] && board[combination[1]] == board[combination[2]]
    end
    }
end

def full?(board)
  board.all? {
    |cell|
    cell == "X" || cell =="O"
    }
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  full?(board) || won?(board)
end

def winner(board)
  if(won?(board))
    board[won?(board)[0]]
  end
end