
board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

WIN_COMBINATIONS =
  [[0, 1, 2],
   [3, 4, 5],
   [6, 7, 8],
   [0, 4, 8],
   [2, 4, 6],
   [0, 3, 6],
   [1, 4, 7],
   [2, 5, 8]]


def won?(board)
  combo = 0
  while combo < WIN_COMBINATIONS.length
    current_combo = WIN_COMBINATIONS[combo]

    win1 = current_combo.all? { |position| board[position] == "X" }
    win2 = current_combo.all? { |position| board[position] == "O" }

    if win1 == true || win2 == true
      return current_combo
    end
    combo += 1
  end
  return nil
end

def winner(board)

  won = won?(board)
 

  if won != nil
    type = won[0]
    return board[type]
  end
end

def full?(board)
  board.all? {|position| position == "X" || position =="O"}
end

def draw?(board)
  if full?(board) == true && (won?(board) == false || won?(board) == nil)
    return true
  else false
  end
end

def over?(board)
  if draw?(board) == true || won?(board) != nil || full?(board) == true
    return true
  end
end




