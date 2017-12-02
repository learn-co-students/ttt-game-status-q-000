# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS=

  [ [0,1,2] ,
[3,4,5] ,
[6,7,8] ,
[0,3,6] ,
[1,4,7] ,
[2,5,8] ,
[0,4,8] ,
[6,4,2] ]

def won?(board)
  if board.all?{ |loc| loc == " " }
    return false
  end
  WIN_COMBINATIONS.each do |combo|
    if (board[combo[0]] == "X" || board[combo[0]] == "O") && board[combo[0]] == board[combo[1]] && board[combo[0]] == board[combo[2]]
      return combo
    end
  end
  return false
end

def full?(board)
  if board.any?{ |loc| loc == " " }
      return false
  else
      return true
  end
end

def draw?(board)
  if won?(board) || !full?(board)
    return false
  else
    return true
  end
end

def over?(board)
  if won?(board) || draw?(board)
    return true
  elsif !full?(board)
      return false
  end
end

def winner(board)
  if won?(board)
    return board[won?(board)[0]]
  else
    return nil
  end
end