# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  # Horizontal wins:
  [0,1,2], [3,4,5], [6,7,8], 
  # Vertical wins:
  [0, 3, 6], [1, 4, 7], [2, 5, 8],
  # Diagonal wins:
  [0, 4, 8], [2, 4, 6]
]

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    position_1 = board[win_combination[0]]
    position_2 = board[win_combination[1]]
    position_3 = board[win_combination[2]]

    if (position_1 == "X" && position_2 =="X" && position_3 =="X") || (position_1 == "O" && position_2 =="O" && position_3 =="O")
      return win_combination
    end
  end
  return false
end

def full?(board)
  if board.count("X") + board.count("O") < 9
    false
  else
    true
  end
end

def draw?(board)
  if (board.count("X") + board.count("O") == 9) && (won?(board) == false)
    true
  elsif (board.count("X") + board.count("O") < 9) && (won?(board) == true)
    false
  else won?(board) == true
    false  
  end
end

def over?(board)
  if won?(board) == true || draw?(board) == true || full?(board) == true
    true
  else
    false
  end
end

def winner(board)
  if won?(board) == true && (position_1 == "X" && position_2 =="X" && position_3 =="X")
    "X"
  elsif won?(board) == true && (position_1 == "O" && position_2 =="O" && position_3 =="O")
    "O"
  else
    nil
  end
end
