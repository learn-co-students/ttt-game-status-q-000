# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 4, 8], [1, 4, 7], [2, 4, 6], [0, 3, 6], [2, 5, 8]]

def won?(board)

  WIN_COMBINATIONS.each do |win_combination|
    winner = []
    win_combination.each do |win_index|
      winner << board[win_index]
        end
          if winner[0] == winner[1] && winner[0] == winner[2] && winner[0] != " "
            return win_combination
            break
          end
        end
  false
end

def full?(board)
  if board.all? {|el| el != " "}
    return true
  else false
  end
end

def draw?(board)
  if won?(board) == false
    return true
  else false
  end
end

def over?(board)
  if full?(board) == true
    return true
  else false
  end
end

def winner(board)
  if won?(board) == false
  return nil
  else
  board[won?(board)[0]]
  end
end
