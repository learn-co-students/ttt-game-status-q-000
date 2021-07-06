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
  [2,4,6],
  [0,4,8]
]

def won?(board)
  # Flag / Switch
  the_answer = false
  WIN_COMBINATIONS.each do |win_combination| # Scope Gate
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]
    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]
    # implementation
    # x_win = [position_1, position_2, position_3].all? do |position|
    #   position == "X"
    # end
    # o_win = [position_1, position_2, position_3].all? do |position|
    #   position == "O"
    # end
    a_win = [position_1, position_2, position_3].uniq.size == 1 && position_1 != " "
    # return value
    if a_win
      the_answer = win_combination
    end
  end
  the_answer
end

def full?(board)
  full_board = board.all? do |space|
    space == "X" || space == "O"
  end
  return full_board
end

def draw?(board)
  if !won?(board) && full?(board)
    return true
  elsif !won?(board) && !full?(board)
    return false
  else
    return false
  end
end

def over?(board)
  if won?(board) || draw?(board) || full?(board)
    true
  else
    false
  end
end

def winner(board)
  winning_arr = won?(board)
  if winning_arr.class == Array && board[winning_arr[0]] == "X"
    return "X"
  elsif winning_arr.class == Array && board[winning_arr[0]] == "O"
    return "O"
  else
    return nil
  end
end
