# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS=[
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,6,4],
]


def won?(board)
  WIN_COMBINATIONS.detect do |win_combination|
    if
      win_combination.all? do |win_index|
        board[win_index]=="X"
      end
      true
    elsif
      win_combination.all? do |win_index|
        board[win_index]=="O"
      end
      true
    else
      false
    end
  end
end

def full?(board)
  board.all? do |index|
    index=="X"||index=="O"
  end
end

def draw?(board)
  if full?(board)==true && won?(board)==nil
    true
  end
end

def over?(board)
  if won?(board)!=nil || full?(board)==true || draw?(board)==true
    true
  else
    false
  end
end

def winner(board)
  if won?(board)!=nil
    board[won?(board).detect {|index| board[index]=="X" || board[index]=="O"}]
  else
    nil
  end
end
