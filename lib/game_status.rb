# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5], 
  [6, 7, 8], 
  [0, 3, 6], 
  [1, 4, 7], 
  [2, 5, 8], 
  [0, 4, 8], 
  [6, 4, 2]
]

def won?(board)
  WIN_COMBINATIONS.each do |position|
    if (board[position[0]] == "X" && board[position[1]] == "X" && board[position[2]] == "X") || (board[position[0]] == "O" && board[position[1]] == "O" && board[position[2]] == "O")
      return position
        end
      end
        false
      end

def full?(board)
  win = true
  board.each do |element|
    if !won?(board) && (element == "X" || element == "O")
      win
    elsif element == " " 
      win = false
    end
  end
    win
  end

def draw?(board)
  status = false
    if (full?(board) && !won?(board))
      status = true
    end
      status
    end

def over?(board)
    if won?(board) || full?(board) || draw?(board)
      return true
    end
      false
    end

def winner (board)
    winning_comination = won?(board)
    if winning_comination
    return board[winning_comination[0]]
    end
      nil
    end