# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

WIN_COMBINATIONS = [
 [0,1,2],
 [3,4,5],
 [6,7,8],
 [0,3,6],
 [1,4,7],
 [2,5,8],
 [0,4,8],
 [6,4,2]
]

def won?(board)

  combo = 0
  while combo < WIN_COMBINATIONS.length
    new_combo = WIN_COMBINATIONS[combo]

    winX = new_combo.all? { |position| board[position] == "X" }
    winO = new_combo.all? { |position| board[position] == "O" }
      if winX == true || winO == true
        return new_combo
      end
    combo += 1
  end
end
 
def full?(board)
board.all? { |e| e == "X" || e == "O"}
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) || draw?(board)
end

def winner(board)
  
  if winning = won?(board)
    winX = winning.all? { |position| board[position] == "X" }
    winO = winning.all? { |position| board[position] == "O" }
    if winX == true
      return "X"
    elsif winO == true
      return "O"
    else 
      return nil
    end
  end
end