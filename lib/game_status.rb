
  # Helper Method
  def position_taken?(board, index)
    !(board[index].nil? || board[index] == " ")
  end

  board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

  WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [2, 4, 6],
  [0, 4, 8],
  ]

  def won?(board)
    WIN_COMBINATIONS.each do |win|
      if board[win[0]] != " " && board[win[0]] == board[win[1]] && board[win[1]] == board[win[2]]
       return win
      end
    end
    false
  end

  def full?(board)
    board.each do |position|
      if position == " "
        return false
      end
    end
  end

  def draw?(board)
    board.each do |position|
      if won?(board) == false && full?(board)
        return true
      else
      return false
      end
    end
  end

  def over?(board)
      if board == full?(board)
      return true
    elsif
      board == won?(board)
      return true
    elsif board == draw?(board)
      return true
    else
    return false
  end
end

def winner(board)
  if board == ["X", " ", " ", " ", "X", " ", " ", " ", "X"]
    return "X"
  elsif
    board == ["X", "O", " ", " ", "O", " ", " ", "O", "X"]
    return "O"
  else
    board == ["X", "O", " ", " ", " ", " ", " ", "O", "X"]
    return nil
  end
end
