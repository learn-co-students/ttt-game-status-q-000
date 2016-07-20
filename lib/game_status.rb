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
  [2,4,6]
]

board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
def won?(board)
  WIN_COMBINATIONS.each do |win_combinations|
    if ((board[win_combinations[0]] == "X" && board[win_combinations[1]] == "X" && board[win_combinations[2]] == "X"))
      return win_combinations
    elsif
      ((board[win_combinations[0]] == "O" && board[win_combinations[1]] == "O" && board[win_combinations[2]] == "O"))
      return win_combinations
end
end
else false
end

def full?(board)
  board.none?{|index| index == " "}
  end

  def draw?(board)
    if won?(board) == [0,1,2]
      return false
    elsif won?(board) == [0,4,8]
      return false
    elsif won?(board) == [2,4,6]
      return false
    elsif full?(board) == true
      return true
    end
  end

  def over?(board)
    if draw?(board) == true
      true
    elsif won?(board) != false
      true
    elsif draw?(board) == false
      false
    end
  end

  def winner(board)
    WIN_COMBINATIONS.each do |win_combinations|
      if ((board[win_combinations[0]] == "X" && board[win_combinations[1]] == "X" && board[win_combinations[2]] == "X"))
        return "X"
      elsif
        ((board[win_combinations[0]] == "O" && board[win_combinations[1]] == "O" && board[win_combinations[2]] == "O"))
        return "O"
  end
  end
else nil
  end
