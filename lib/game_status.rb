# Helper Method
def position_taken?(board, position)
  if (board[position.to_i-1] == 'X' || board[position.to_i-1] == 'O')
    return true
  end
  return false
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0, 1, 2],
                    [3, 4, 5],
                    [6, 7, 8],
                    [0, 3, 6],
                    [1, 4, 7],
                    [2, 5, 8],
                    [0, 4, 8],
                    [6, 4, 2]]

def won?(board)
  WIN_COMBINATIONS.each do |win|
    if ((board[win[0]] == 'X' &&
         board[win[1]] == 'X' &&
         board[win[2]] == 'X') || (board[win[0]] == 'O' &&
                                   board[win[1]] == 'O' &&
                                   board[win[2]] == 'O'))
      return win
    end
  end
  return false
end

def full?(board)
  count = 0
  9.times do
      if !(board[count] == 'X' || board[count] == 'O')
        return false
      end
    count += 1
  end
  return true
end

def draw?(board)
  if !won?(board) && full?(board)
    return true
  end
  return false
end

def over?(board)
  if won?(board) || draw?(board)
    return true
  end
  return false
end

def winner(board)
  if won?(board)
    return board[won?(board)[0]]
  end
  return
end