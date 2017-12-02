# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

def won?(board)
    WIN_COMBINATIONS.each do |win_line|
      win_index_1 = win_line[0]
      win_index_2 = win_line[1]
      win_index_3 = win_line[2]
      if (board[win_index_1] == "X" && board[win_index_2] =="X" && board[win_index_3] == "X") ||
         (board[win_index_1] == "O" && board[win_index_2] =="O" && board[win_index_3] == "O")
        return win_line
      end
    end
  false
end

def full?(board)
  board.each do |position|
    if position == " " || position == "" || position == nil
      return false
    end
  end
  true
end

def draw?(board)
  if won?(board)
    false
  else
    true
  end
end

def over?(board)
  if (won?(board) || draw?(board)) && full?(board)
    true
  else
    false
  end
end

def winner(board)
  if won?(board)
    win_line = won?(board)
    if board[win_line[0]] == 'X'
      'X'
    else
      'O'
    end
  end
end