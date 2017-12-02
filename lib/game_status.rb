# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2], #top row
  [3, 4, 5], #middle row
  [6, 7, 8], #bottom row
  [0, 3, 6], #left colomn
  [1, 4, 7], #middle column
  [2, 5, 8], #left column
  [0, 4, 8], #top left diagonal
  [2, 4, 6] #top left diagonal
  ]

def won?(board)
  WIN_COMBINATIONS.each do |win_combo|
    win_index_1 = win_combo[0]
    win_index_2 = win_combo[1]
    win_index_3 = win_combo[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

    if position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combo
    end
  end
  nil
end

def full?(board)
  board.none?{|i| i == " "}
end

def draw?(board)
  if full?(board)
    if !won?(board)
      true
    else
      false
    end
   else
    false
  end
end

def over?(board)
  if draw?(board) || won?(board)
    true
   else
    false
  end
end

def winner(board)
  if won?(board)
    winning_character = won?(board)[0]
    victor = board[winning_character]
  end
end


