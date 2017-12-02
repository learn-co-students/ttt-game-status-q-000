# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,4,8],
    [2,4,6],
    [1,4,7],
    [2,5,8],
    [0,3,6]
]

  
def won?(board)
  WIN_COMBINATIONS.detect do |win_combo|
    win_combo.all? { |position| board[position] == "X" } || win_combo.all? { |position| board[position] == "O" }
  end
end

def full?(board)
  unless board.any? {|pos| pos == " " || nil}
      board.all? == "X" || "O"
  end
end

def draw?(board)
  if full?(board) && !won?(board)
      true
  else
      false
    end
end

def over?(board)
  if full?(board) || won?(board) || draw?(board)
    true
  else
    false
  end
end

def winner(board)
  winning_player = won?(board)

  if !winning_player
      return nil
    end

    winning_player.each do |i|
      if board[i] == "X"
        return "X"
      elsif board[i] == "O"
        return "O"
      end
    end
  end
