def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

WIN_COMBINATIONS = [
    [0,1,2], [3,4,5], [6,7,8],  #horizontal wins
    [0,3,6], [1,4,7], [2,5,8],  #vertical wins
    [0,4,8], [6,4,2]            #diagonal wins
  ]


def full?(board)
  board.none?{|i| i == " "}
end


def draw?(board)
  if won?(board) != false
    return false
  elsif full?(board) == true
    return true
  end
end


def over?(board)
  if won?(board) != false || draw?(board) == true
    return true
  else
    return false
  end
end


def winner(board)
  if won?(board) != false
    return board[won?(board).first]
  else
    return nil
  end
end


def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    if board[win_combination[0]] != " " && ((board[win_combination[0]] == board[win_combination[1]]) && (board[win_combination[1]] == board[win_combination[2]]))
      return win_combination
    end
  end
    return false
end