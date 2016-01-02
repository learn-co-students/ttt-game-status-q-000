# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,4,8],
  [2,4,6],
  [0,3,6],
  [2,5,8],
  [1,4,7]]

def won?(board)
  winning_board = []
  #check if X won
  WIN_COMBINATIONS.each do |combination|
    combination.each do |position|
      if (board[position] == "X")
        winning_board << position
      end
    end
    if (winning_board.size == 3)
      return winning_board
    else
      winning_board.clear
    end
  end

  #check if O won
  WIN_COMBINATIONS.each do |combination|
    combination.each do |position|
      if (board[position] == "O")
        winning_board << position
      end
    end
    if (winning_board.size == 3)
      return winning_board
    else
      winning_board.clear
    end
  end

  return false
end

def full?(board)
  board.each do |position|
    if (position==" " || position==nil)
      return false
    end
  end
    return true
end

def draw?(board)
  if (full?(board)==true && won?(board)==false)
    return true
  end
  return false
end

def over?(board)
  if (draw?(board)==true || won?(board)!=false)
    return true
  end
  return false
end

def winner(board)
  if (won?(board)==false)
    return nil
  else
    winning_array = won?(board)
    return board[winning_array[0]]
  end
end
