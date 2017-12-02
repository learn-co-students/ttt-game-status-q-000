# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

WIN_COMBINATIONS = [
  [0,1,2],[3,4,5],
  [6,7,8],[0,3,6],
  [1,4,7],[2,5,8],
  [0,4,8],[2,4,6]
  ]

def won?(board)
  WIN_COMBINATIONS.each do |combo|
lotto = [board[combo[0]], board[combo[1]], board[combo[2]]]

    if lotto.all? {|a| a == "X"} || lotto.all? {|a| a == "O"}
    return combo
end
end
else false
end

    def full?(board)
      board.keep_if {|a| a == "X" || a == "O"}
      if board.length != 9
        false
      else
        true
    end
end

def draw?(board)
  if won?(board) == true
    false
  elsif won?(board) == false && full?(board) == true
    true
  else false
  end
end

def over?(board)
    if !!won?(board) == true
      true
      elsif !!draw?(board) == true
        true
    else false
    end
  end

def winner(board)
  WIN_COMBINATIONS.each do |combo|
lotto = [board[combo[0]], board[combo[1]], board[combo[2]]]

    if lotto.all? {|a| a == "X"} == true
      return "X"
    elsif lotto.all? {|a| a == "O"} == true
      return "O"
    end
  end
else nil
end