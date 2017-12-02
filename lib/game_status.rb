# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2], [3, 4, 5], [6, 7, 8],
  [0, 3, 6], [1, 4, 7], [2, 5, 8],
  [0, 4, 8], [2, 4, 6]
]

def won?(board)
  WIN_COMBINATIONS.each do |win_combination| 
    # position_taken?(board, board[win_combination[0]]) &&
    # board[win_combination[0]] == board[win_combination[1]] && 
    # board[win_combination[1]] == board[win_combination[2]]  

    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    # if board[win_index_1] == 'X' && board[win_index_2] == 'X' && board[win_index_3] == 'X'
    #   return win_combination
    # else
    #   false
    # end

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

    # if position_1 == "X" && position_2 == "X" && position_3 == "X"
    if position_1 == position_2 && position_2 == position_3 && position_taken?(board, win_combination[0])
      return win_combination
    else
      false
    end

    # position_taken?(board, board[win_index_1]) &&
    # board[win_index_1] == board[win_index_2] &&
    # board[win_index_2] == board[win_index_3]
  end
  false
end

def full?(board)
  board.all? {|x| x == 'X' || x == 'O'}
end

def draw?(board)
  if !won?(board) && full?(board)
    true
  else
    false
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
  if WIN_COMBINATIONS.any? {|x| board[x[0]] == 'X' && board[x[1]] == 'X' && board[x[2]] == 'X'}
    'X'
  elsif WIN_COMBINATIONS.any? {|x| board[x[0]] == 'O' && board[x[1]] == 'O' && board[x[2]] == 'O'}
    'O'
  else
    nil
  end
end

