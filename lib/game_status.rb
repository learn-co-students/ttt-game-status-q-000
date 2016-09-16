# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS  = [
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
  WIN_COMBINATIONS.each do |win_index|
    if board[win_index[0]] == board[win_index[1]] &&
    board[win_index[1]] == board[win_index[2]] &&
    position_taken?(board,win_index[0])
      return win_index
    end
  end
  false
end

def full?(board)
  board.all? do |position|
    position != " "
  end
end

def draw?(board)
  full?(board) == true &&
  won?(board) == false
end

def over?(board)
  draw?(board) == true ||
  won?(board) != false
end

def winner(board)
  num_x = board.count("X")
  num_o = board.count("O")
  if won?(board) != false && over?(board) == true
    if num_x > num_o
      return "X"
    else
      return "O"
    end
  else
    return nil
  end
end
