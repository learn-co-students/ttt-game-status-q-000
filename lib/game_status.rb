# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0, 1, 2], [0, 3, 6], [0, 4, 8], [2, 5, 8], [6, 7, 8], [1, 4, 7], [2, 4, 6], [3, 4, 5]]

def won?(board)
  if !board.include?("X") && !board.include?("O")
    return false
  end
  WIN_COMBINATIONS.each do |combo|
    if board[combo[0]] == 'X' || board[combo[0]] == 'O'
      if board[combo[0]] == board[combo[1]] && board[combo[0]] == board[combo[2]]
        return combo
      end
    end
  end
  return false
end

def full?(board)
  if board.include?(" ")
    return false
  end
  return true
end

def draw?(board)
  puts "Full: #{full?(board)} Won: #{won?(board)}"
  if full?(board) == true && won?(board) == false
    return true
  end
  return false
end

def over?(board)
  if full?(board) || draw?(board) or won?(board)
    return true
  end
  return false
end

def winner(board)
  victor = won?(board)
  if victor == false
    return nil
  else return board[victor[0]]
  end
end
