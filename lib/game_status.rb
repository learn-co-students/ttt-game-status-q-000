# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0,1,2],
                  [3,4,5],
                  [6,7,8],
                  [0,3,6],
                  [1,4,7],
                  [2,5,8],
                  [0,4,8],
                  [2,4,6]]
                  
def won?(board)
  WIN_COMBINATIONS.each do |win_combination| 
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    # load the value of board at specified index
    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

    if position_1 == 'X' && position_2 == 'X' && position_3 == 'X'
      return win_combination
    elsif position_1 == 'O' && position_2 == 'O' && position_3 == 'O'
      return win_combination
    end
  end
  false
end

def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

def draw?(board)
  full?(board) && !won?(board)
  # if won?(board) == false && full?(board) == true
  #   true
  # elsif won?(board) == true
  #   false
  # else
  #   false
  # end
end

def full?(board)
  board.include?(" ") ? false : true
  # if board.include?(" ")
  #   false
  # else
  #   true
  # end
end

def over?(board)
  won?(board) || draw?(board)
end

def winner(board)
  position = won?(board)
  if won?(board) == false
    nil
  elsif board[position[0]] == 'X' && board[position[1]] == 'X' && board[position[2]] == 'X'
    'X'
  elsif board[position[0]] == 'O' && board[position[1]] == 'O' && board[position[2]] == 'O'
    'O'
  end
end
