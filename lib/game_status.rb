# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
  [0,3,6],
  [0,4,8],
  [1,4,7],
  [2,5,8],
  [2,4,6],
  [3,4,5],
  [6,7,8]
  ]

def won?(board)

  win = false
  counter = 0

  while counter < 8 && win == false
    index = WIN_COMBINATIONS[counter]
    marker = board[index[0]]
    if position_taken?(board,index[0])
      if board[index[0]] == marker && board[index[1]] == marker && board[index[2]] == marker
        win = index
      end
    end
    counter = counter + 1
  end
  win
end

def full?(board)
  index = 0
  cont = true
  while index < 9
    cont  = position_taken?(board, index)
    index = index + 1
  end
  cont
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  won?(board) || draw?(board) || full?(board)
end

def winner(board)
  if over?(board) && !draw?(board)
    board[won?(board)[0]]
  end
end

